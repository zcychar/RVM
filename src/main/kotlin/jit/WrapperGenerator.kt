package jit

private const val ARG_REGISTER_COUNT = 8

internal object WrapperGenerator {
    fun generate(abi: EntryAbi): String = buildString {
        appendLine("    .option nopic")
        appendLine("    .option norelax")
        appendLine("    .text")
        appendLine("    .globl _start")
        appendLine("_start:")
        appendLine("    call  __rvm_entry")
        appendLine("    li  a7, 93")
        appendLine("    ecall")
        appendLine()
        appendLine("__rvm_entry:")
        val overflowArgs = (abi.parameters.size - ARG_REGISTER_COUNT).coerceAtLeast(0)
        val frameSize = alignUp(16 + overflowArgs * Long.SIZE_BYTES, 16)
        appendLine("    addi  sp, sp, -$frameSize")
        appendLine("    sd  ra, ${frameSize - Long.SIZE_BYTES}(sp)")
        abi.parameters.forEach { param ->
            appendLine("    la  a1, __rvm_arg${param.index}")
            appendLine("    li  a2, 8")
            appendLine("    call  __rvm_read_exact")
        }
        if (abi.arenaSize > 0) {
            appendLine("    la  a1, __rvm_arena")
            appendLine("    li  a2, ${abi.arenaSize}")
            appendLine("    call  __rvm_read_exact")
        }
        abi.parameters.drop(ARG_REGISTER_COUNT).forEachIndexed { overflowIndex, param ->
            emitLoadArg(this, param, "t1")
            appendLine("    sd  t1, ${overflowIndex * Long.SIZE_BYTES}(sp)")
        }
        abi.parameters.take(ARG_REGISTER_COUNT).forEachIndexed { registerIndex, param ->
            emitLoadArg(this, param, "a$registerIndex")
        }
        appendLine("    call  ${abi.rootName}")
        appendLine("    la  t0, __rvm_ret")
        appendLine("    sd  a0, 0(t0)")
        appendLine("    la  a1, __rvm_ret")
        appendLine("    li  a2, 8")
        appendLine("    call  __rvm_write_exact")
        if (abi.arenaSize > 0) {
            appendLine("    la  a1, __rvm_arena")
            appendLine("    li  a2, ${abi.arenaSize}")
            appendLine("    call  __rvm_write_exact")
        }
        appendLine("    ld  ra, ${frameSize - Long.SIZE_BYTES}(sp)")
        appendLine("    addi  sp, sp, $frameSize")
        appendLine("    li  a0, 0")
        appendLine("    ret")
        appendRuntimeHelpers()
        appendLine("    .bss")
        appendLine("    .align 3")
        appendLine("__rvm_ret:")
        appendLine("    .zero 8")
        abi.parameters.forEach { param ->
            appendLine("__rvm_arg${param.index}:")
            appendLine("    .zero 8")
        }
        if (abi.arenaSize > 0) {
            appendLine("    .align 3")
            appendLine("__rvm_arena:")
            appendLine("    .zero ${abi.arenaSize}")
        }
    }

    private fun emitLoadArg(out: StringBuilder, param: ParameterAbi, targetReg: String) {
        when (param) {
            is ParameterAbi.Scalar -> {
                out.appendLine("    la  t0, __rvm_arg${param.index}")
                out.appendLine("    ld  $targetReg, 0(t0)")
            }
            is ParameterAbi.Pointer -> {
                out.appendLine("    la  t0, __rvm_arena")
                out.appendLine("    la  t2, __rvm_arg${param.index}")
                out.appendLine("    ld  $targetReg, 0(t2)")
                out.appendLine("    add  $targetReg, t0, $targetReg")
            }
        }
    }

    private fun StringBuilder.appendRuntimeHelpers() {
        appendLine()
        appendLine("__rvm_read_exact:")
        appendLine("    mv  t0, a1")
        appendLine("    mv  t1, a2")
        appendLine(".Lrvm_read_loop:")
        appendLine("    beqz  t1, .Lrvm_read_done")
        appendLine("    li  a0, 0")
        appendLine("    mv  a1, t0")
        appendLine("    mv  a2, t1")
        appendLine("    li  a7, 63")
        appendLine("    ecall")
        appendLine("    blez  a0, .Lrvm_io_error")
        appendLine("    add  t0, t0, a0")
        appendLine("    sub  t1, t1, a0")
        appendLine("    j  .Lrvm_read_loop")
        appendLine(".Lrvm_read_done:")
        appendLine("    ret")
        appendLine()
        appendLine("__rvm_write_exact:")
        appendLine("    mv  t0, a1")
        appendLine("    mv  t1, a2")
        appendLine(".Lrvm_write_loop:")
        appendLine("    beqz  t1, .Lrvm_write_done")
        appendLine("    li  a0, 1")
        appendLine("    mv  a1, t0")
        appendLine("    mv  a2, t1")
        appendLine("    li  a7, 64")
        appendLine("    ecall")
        appendLine("    blez  a0, .Lrvm_io_error")
        appendLine("    add  t0, t0, a0")
        appendLine("    sub  t1, t1, a0")
        appendLine("    j  .Lrvm_write_loop")
        appendLine(".Lrvm_write_done:")
        appendLine("    ret")
        appendLine()
        appendLine(".Lrvm_io_error:")
        appendLine("    li  a0, 2")
        appendLine("    li  a7, 93")
        appendLine("    ecall")
        appendLine()
        appendLine("    .globl memcpy")
        appendLine("memcpy:")
        appendLine("    mv  t3, a0")
        appendLine("    beqz  a2, .Lrvm_memcpy_done")
        appendLine(".Lrvm_memcpy_loop:")
        appendLine("    lbu  t0, 0(a1)")
        appendLine("    sb  t0, 0(a0)")
        appendLine("    addi  a1, a1, 1")
        appendLine("    addi  a0, a0, 1")
        appendLine("    addi  a2, a2, -1")
        appendLine("    bnez  a2, .Lrvm_memcpy_loop")
        appendLine(".Lrvm_memcpy_done:")
        appendLine("    mv  a0, t3")
        appendLine("    ret")
        appendLine()
    }
}

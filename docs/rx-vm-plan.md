# Rx 输入虚拟机计划

## 目标

RVM 的主输入改为 RCompiler 的 `.rx` 源文件。项目不再优先实现 LLVM IR 文本 parser，而是复用 RCompiler 的前端、语义分析和 `backend.ir` 构建结果。VM 核心输入统一为 `backend.ir.IrModule`。

```text
.rx
  -> RCompiler frontend + semantic passes
  -> backend.ir.IrModule
  -> RVM interpreter / profiler / JIT
```

## 边界

RVM 支持 RCompiler 能编译通过的 Rx 程序，并以 IR-1 benchmark 覆盖的语言子集作为回归基线。不追求通用 LLVM IR 兼容，也不在 RVM 内部重写 Rx parser。`benchmarks/rcompiler-ir1-unopt/` 中的 `.ll` 文件保留为参考，用于理解 RCompiler 当前 IR 形态和对照输出。

## RCompiler 集成点

RVM 需要一个稳定入口从 RCompiler 获取 `IrModule`。如果 RCompiler 当前只暴露 `generate(): String` 或 `generateAsm(): String`，应优先在 RCompiler 中增加公开 API，例如：

```kotlin
fun buildModule(crate: CrateNode, globalScope: Scope): IrModule
```

RVM 的 bridge 层只负责调用这个 API、传入 `.rx` 路径、收集诊断，并把 `IrModule` 交给解释器或 JIT。

## 运行时模型

解释器围绕 RCompiler IR 执行：函数调用栈、SSA 值表、线性内存、栈分配、全局对象和 builtin I/O。所有 `alloca/load/store/gep/call/ret/br/phi` 等行为都应直接按 `backend.ir` 节点实现，避免再引入一套平行 IR。

## JIT 方案

JIT 入口是热函数调用。被编译的执行单元是该入口的闭合用户调用图：入口函数直接或间接调用的用户函数都必须能通过 RCompiler 后端编译，编译后的代码不 call 回解释器。包含未支持外部调用、全局引用或无法 marshal 的签名时，当前调用继续由解释器执行。

每个用户函数单独生成并缓存 RISC-V assembly/object：

```text
.rvm-cache/functions/<function-fingerprint>/function.s
.rvm-cache/functions/<function-fingerprint>/function.o
```

每个热入口再生成 wrapper object，并把 wrapper 与闭包中的函数 object 链接为一个 QEMU 可执行 ELF：

```text
.rvm-cache/entries/<root-fingerprint>/wrapper.s
.rvm-cache/entries/<root-fingerprint>/wrapper.o
.rvm-cache/entries/<root-fingerprint>/root.elf
```

运行时通过 `qemu-riscv64` 执行 `root.elf`。wrapper 从 stdin 读取标量参数和指针 arena，调用入口函数后把返回值和 arena 写回 stdout。指针参数按 pointee region 全量 copy-in/copy-out；pointee 内部包含 pointer 的类型不参与 marshal。

## 测试策略

以 `.rx` fixture 为主，输入输出沿用 RCompiler benchmark。每个集成测试比较 stdout 和退出状态；JIT 集成测试额外验证闭合调用图通过 QEMU 执行、函数 object 与 entry ELF 生成、指针参数回写解释器内存。旧 `.ll` benchmark 只作为回归参考，不作为 parser 实现目标。

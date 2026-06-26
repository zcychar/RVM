package jit

import backend.ir.IrBasicBlock
import backend.ir.IrBranch
import backend.ir.IrConstant
import backend.ir.IrFunction
import backend.ir.IrFunctionSignature
import backend.ir.IrParameter
import backend.ir.IrPrimitive
import backend.ir.IrReturn
import backend.ir.PrimitiveKind
import profiler.BlockEdge
import profiler.MethodProfile
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotSame
import kotlin.test.assertSame

class HotBlockLayoutTest {
    @Test
    fun placesHottestSuccessorAfterCurrentBlock() {
        val function = branchFunction()
        val profile = MethodProfile(function.name)

        profile.blockEdges[BlockEdge("entry", "hot")] = 10
        profile.blockEdges[BlockEdge("entry", "cold")] = 2

        val layout = HotBlockLayout.apply(function, profile)

        assertEquals(listOf("entry", "hot", "cold"), layout.order)
        assertNotSame(function, layout.function)
        assertEquals(layout.order, layout.function.blocks.map { it.label })
        assertEquals(listOf("entry", "cold", "hot"), function.blocks.map { it.label })
    }

    @Test
    fun keepsOriginalFunctionWhenProfileIsEmpty() {
        val function = branchFunction()
        val layout = HotBlockLayout.apply(function, MethodProfile(function.name))

        assertSame(function, layout.function)
        assertEquals(listOf("entry", "cold", "hot"), layout.order)
    }

    @Test
    fun keepsOriginalOrderWhenSuccessorsHaveEqualHeat() {
        val function = branchFunction()
        val profile = MethodProfile(function.name)

        profile.blockEdges[BlockEdge("entry", "cold")] = 5
        profile.blockEdges[BlockEdge("entry", "hot")] = 5

        val layout = HotBlockLayout.apply(function, profile)

        assertSame(function, layout.function)
        assertEquals(listOf("entry", "cold", "hot"), layout.order)
    }

    private fun branchFunction(): IrFunction {
        val i32 = IrPrimitive(PrimitiveKind.I32)
        val unit = IrPrimitive(PrimitiveKind.UNIT)
        val function = IrFunction(
            "choose",
            IrFunctionSignature(parameters = listOf(i32), returnType = i32),
            parameterNames = listOf("cond"),
        )

        val entry = IrBasicBlock("entry")
        entry.setTerminator(
            IrBranch(
                name = "",
                type = unit,
                condition = IrParameter(0, "cond", i32),
                trueTarget = "cold",
                falseTarget = "hot",
            ),
        )

        val cold = returnBlock("cold", i32, 1)
        val hot = returnBlock("hot", i32, 2)

        function.appendBlock(entry)
        function.appendBlock(cold)
        function.appendBlock(hot)
        return function
    }

    private fun returnBlock(label: String, type: IrPrimitive, value: Long): IrBasicBlock {
        val block = IrBasicBlock(label)
        block.setTerminator(
            IrReturn(
                name = "",
                type = IrPrimitive(PrimitiveKind.UNIT),
                value = IrConstant(value, type),
            ),
        )
        return block
    }
}

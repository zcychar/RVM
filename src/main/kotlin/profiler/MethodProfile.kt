package profiler

data class MethodProfile(
    val name: String,
    var calls: Long = 0,
    var instructions: Long = 0,
    var backEdges: Long = 0,
    var hot: Boolean = false,
)

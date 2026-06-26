package profiler

class Profiler(
    private val callThreshold: Long = 1_000,
    private val instructionThreshold: Long = 10_000,
    private val backEdgeThreshold: Long = 1_000,
) {
    private val profiles = linkedMapOf<String, MethodProfile>()

    init {
        require(callThreshold > 0) { "callThreshold must be positive" }
        require(instructionThreshold > 0) { "instructionThreshold must be positive" }
        require(backEdgeThreshold > 0) { "backEdgeThreshold must be positive" }
    }

    fun recordCall(name: String) {
        val profile = profileFor(name)
        profile.calls += 1
        updateHot(profile)
    }

    fun recordInstruction(name: String) {
        val profile = profileFor(name)
        profile.instructions += 1
        updateHot(profile)
    }

    fun recordBackEdge(name: String) {
        val profile = profileFor(name)
        profile.backEdges += 1
        updateHot(profile)
    }

    fun recordBlockEdge(name: String, from: String, to: String) {
        val profile = profileFor(name)
        val edge = BlockEdge(from, to)
        profile.blockEdges[edge] = profile.blockEdges.getOrDefault(edge, 0) + 1
    }

    fun profile(name: String): MethodProfile? = profiles[name]

    fun blockEdgeCount(name: String, from: String, to: String): Long =
        profiles[name]?.blockEdges?.get(BlockEdge(from, to)) ?: 0

    fun allProfiles(): List<MethodProfile> = profiles.values.toList()

    fun hotMethods(): List<MethodProfile> = profiles.values.filter { it.hot }

    fun isHot(name: String): Boolean = profiles[name]?.hot == true

    private fun profileFor(name: String): MethodProfile =
        profiles.getOrPut(name) { MethodProfile(name) }

    private fun updateHot(profile: MethodProfile) {
        if (
            profile.calls >= callThreshold ||
            profile.instructions >= instructionThreshold ||
            profile.backEdges >= backEdgeThreshold
        ) {
            profile.hot = true
        }
    }
}

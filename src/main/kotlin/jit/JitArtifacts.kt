package jit

import java.nio.file.Path

internal data class FunctionArtifact(
    val functionName: String,
    val fingerprint: String,
    val objectPath: Path,
)

internal data class EntryArtifact(
    val abi: EntryAbi,
    val executablePath: Path,
)

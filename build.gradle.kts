plugins {
    kotlin("jvm") version "2.2.0"
    application
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(kotlin("test"))
}

kotlin {
    jvmToolchain(24)
}

sourceSets {
    main {
        kotlin.srcDirs("src/main/kotlin", "../src/main/kotlin")
        resources.srcDirs("../src/main/resources")
    }
    test {
        kotlin.srcDirs("src/test/kotlin")
    }
}

tasks.test {
    useJUnitPlatform()
    maxHeapSize = "2g"
}

application {
    mainClass.set("rvm.MainKt")
}

# Packaging Notes for Attendance-App project

## Overview

**Packaging Guidinline:** A gradle Android should support following command for Gradle to support for packaging.

```bash
$ ./gradlew clean build
```
If above not the case than project probably should support because not all the gradle project support following Command
```bash
$ gradle clean build -x test
```

**Manaual Packaging:**
-we will be considering apk aar and aab as part of android
- Java Version "11.0.21" Kotlin is get resoved by gradle.
- Set ANDROID_HOME in Environment
- Import Project in Android studio to bring in the dependency and other formatting issues.
- Run the following command and find artifacts in output/manual folder.

```bash
$ sh ./veracode/manual-package.sh
```


Project Paths which are successfully able to run `gradle clean build -x test`

| Project Path                           | Succceful|Artifact generated 
|----------------------------------------|----------|------------------
| Attendance-App                         | &#10003; | app-debug.apk

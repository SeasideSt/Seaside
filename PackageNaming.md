# Grammar #

Below a rough [EBNF grammar](http://en.wikipedia.org/wiki/Extended_Backus–Naur_Form) of how Seaside and Monticello expect packages and versions to be named (no spaces allowed anywhere):

```
Package     = PackageName VersionInfo
PackageName = Name "-" [ Purpose "-" ] [ Platform "-" ] Rest
VersionInfo = { "." Branch } "-" Author "." Version
```

# Package Name #

| **Token** | **Required** | **Explanation** | **Examples** |
|:----------|:-------------|:----------------|:-------------|
| Name | mandatory | The top level package name | `Seaside`, `Scriptaculous`, ... |
| Purpose | optional | Present for tests or examples only | `Tests`, `Examples`, ... |
| Platform | optional | Present for platform specific code only | `Pharo`, `GemStone`, ... |
| Rest | mandatory | The second level package name (avoid $- in the name) | `Core`, `Canvas`, ...  |

### Examples ###

The package ...

  * `Seaside-Canvas` contains he canvas implementation.
  * `Seaside-Pharo-Canvas` contains the platform specific code of the canvas implementation.
  * `Seaside-Examples-Canvas` contains example code showing of the canvas implementation.
  * `Seaside-Tests-Canvas` contains the tests for the canvas implementation.
  * `Seaside-Tests-Pharo-Canvas` contains the platform specific tests of the canvas implementation.

# Version Info #

| **Token** | **Required** | **Explanation** | **Examples** |
|:----------|:-------------|:----------------|:-------------|
| Branch | zero-or-more | The branch name starts with a lowercase letter and should not contain hyphens ($-). Several branches may be combined with periods ($.). | `issue123`, `configcleanup`, ... |
| Author | mandatory | The author initials are a short sequence of lowercase letters. | `lr`, `jf`, `pmm`, ... |
| Version | mandatory | The version numbering starts at 1 and is sequentially counting upwards with every commit. | `1`, `2`, `3`, ... |

### Examples ###

The version ...

  * `Seaside-Core-pmm.2` is the second version of the package `Seaside-Core` committed by `pmm`.
  * `Seaside-Core.configcleanup-jf.3` is the third version of the package `Seaside-Core` committed by `jf` into the `configcleanup` branch.
  * `Seaside-Core.configcleanup.extraspeedup-lr.69` is the version 69 of the package `Seaside-Core` committed by `lr`, and is possibly a merge of the branches `configcleanup` and `extraspeedup`.
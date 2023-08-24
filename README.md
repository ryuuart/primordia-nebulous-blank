# The Primordia Nebulous Blank CPP

This is a C++ starter with some opinions on how to go about working, compiling, and building the repo.

## Background

The repo follows a set of opinions on project layout and workflow to keep things consistent while working:

1. The [pitchfork layout](http://api.csswg.org/bikeshed/?force=1&url=https://raw.githubusercontent.com/vector-of-bool/pitchfork/develop/data/spec.bs) is used for file structure.

2. [CMake](https://cmake.org/) will be the thing that officially compiles and build the source code cross platform.

3. [Nix](https://nixos.org/) is there to provide easy setup and building on unix-like systems.

4. Nix **should not** be used in conjunction with native tools like VS Code.

5. Rely on platform agnostic conventions. While Nix is used, it's only to help with unix-like systems. We still build for Windows.

6. [Conan](https://conan.io/) should be used to help manage packages between systems.

> **Note**
> Refer to the `main` branch for more info on nix-specific details.

## Getting Started

Make sure you have [CMake installed](https://cmake.org/install/).

### Universal

This should work in any system.

```shell
mkdir build
cd build
cmake ..
cmake --build .
```

### Nix

This should work for any nix system with flakes enabled.

```shell
nix build
```

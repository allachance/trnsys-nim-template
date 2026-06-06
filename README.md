# TRNSYS Nim Template

This template provides a way for building custom TRNSYS 18 DLL components using the [Nim](https://nim-lang.org/) language. It provides a working Type implementation, TRNSYS bindings, and a build script.

## Requirements

- TRNSYS v.18
- Nim `>= 2.2.0`
- One supported compiler

| Compiler | Notes                          |
| -------- | ------------------------------ |
| `gcc`    | MinGW (Nim's default compiler) |
| `vcc`    | MSVC (requires VS build tools) |
| `clang`  | LLVM                           |
| `zigcc`  | Zig's C compiler (LLVM)        |

## Building the DLL

Compile using standard Nim compiler options, or use the provided PowerShell convenience script:

```powershell
.\scripts\build.ps1
```

Run from the repository root. All parameters are optional and fall back to their defaults.

### Parameters

| Parameter    | Description                                             | Accepted values                | Default                        |
| ------------ | ------------------------------------------------------- | ------------------------------ | ------------------------------ |
| `-Compiler`  | C backend used by the Nim compiler                      | `gcc`, `vcc`, `clang`, `zigcc` | `gcc`                          |
| `-Mode`      | Build configuration                                     | `release`, `debug`, `all`      | `all`                          |
| `-TypeName`  | Source filename (without `.nim` extension) under `src/` | Any Nim module name            | `type9999`                     |
| `-TrnsysLib` | Path to `TRNDll64.lib` for linking                      | Any path                       | `C:/TRNSYS18/Exe/TRNDll64.lib` |

### Example

```powershell
.\scripts\build.ps1 -Compiler gcc -Mode all -TypeName type9999 -TrnsysLib "C:/TRNSYS18/Exe/TRNDll64.lib"
```

### Notes

Built DLLs are output to the `build/dll/` directory.

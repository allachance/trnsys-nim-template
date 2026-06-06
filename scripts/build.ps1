# Compilers
#   gcc    : MinGW GCC
#   vcc    : MSVC  (requires Visual Studio)
#   clang  : system Clang
#   zigcc  : Zig-based cross-compiler (clang front-end, cross-targets x86_64-windows-gnu)
#
# Examples
#   .\build.ps1                                          # all modes, default compiler (zigcc)
#   .\build.ps1 -Compiler vcc -Mode release
#   .\build.ps1 -Compiler gcc -Mode debug -TypeName type1234
#   .\build.ps1 -Compiler clang -Mode all

param(
    [ValidateSet("gcc", "vcc", "clang", "zigcc")]
    [string]$Compiler = "gcc",
    [ValidateSet("release", "debug", "all")]
    [string]$Mode = "all",
    [string]$TypeName = "type9999",
    [string]$TrnsysLib = "C:/TRNSYS18/Exe/TRNDll64.lib"
)

$ErrorActionPreference = "Stop"

# --------------------------------------------------------
# Path
# --------------------------------------------------------
$nim               = "nim"
$passL             = $TrnsysLib
$src               = "src/$TypeName.nim"
$cache             = "build/nimcache"
$zigcc             = "scripts/zigcc/zigcc.bat"

$buildReleaseDir   = "build/dll/ReleaseDLLs"
$buildDebugDir     = "build/dll/DebugDLLs"

# --------------------------------------------------------
# Pre-flight checks
# --------------------------------------------------------
if (-not (Test-Path $src))   { throw "Missing source file: $src" }
if (-not (Test-Path $passL)) { throw "Missing TRNSYS lib:  $passL" }
if ($Compiler -eq "zigcc" -and -not (Test-Path $zigcc)) {
    throw "Missing zigcc wrapper: $zigcc"
}

# --------------------------------------------------------
# Helpers
# --------------------------------------------------------
function Invoke-Build([string[]]$buildArgs, [string]$label) {
    & $nim @buildArgs
    if ($LASTEXITCODE -ne 0) {
        throw "$label build failed (exit code $LASTEXITCODE)."
    }
}

# Returns compiler-specific flags as an ordered array of strings.
function Get-CompilerArgs([string]$cc) {
    switch ($cc) {
        "zigcc" {
            return @(
                "--cc:clang",
                "--clang.exe:$zigcc",
                "--clang.linkerexe:$zigcc",
                "--passC:-target x86_64-windows-gnu",
                "--passL:-target x86_64-windows-gnu",
                "--os:windows", "--cpu:amd64"
            )
        }
        "vcc"   { return @("--cc:vcc") }
        "gcc"   { return @("--cc:gcc") }
        "clang" { return @("--cc:clang") }
    }
}

# --------------------------------------------------------
# Build functions
# --------------------------------------------------------
function Build-Release {
    New-Item -ItemType Directory -Force -Path $buildReleaseDir | Out-Null

    $buildDll  = "$buildReleaseDir/$TypeName.dll"

    $buildArgs = @("c", "--app:lib") +
                (Get-CompilerArgs $Compiler) +
                @(
                    "-d:release", "--opt:speed",
                    "--nimcache:$cache",
                    "--passL:$passL",
                    "--out:$buildDll",
                    $src
                )

    Invoke-Build $buildArgs "Release"

    Write-Host "Release done => $buildDll" -ForegroundColor Green
}

function Build-Debug {
    New-Item -ItemType Directory -Force -Path $buildDebugDir | Out-Null

    $buildDll  = "$buildDebugDir/$TypeName.dll"

    $buildArgs = @("c", "--app:lib") +
                 (Get-CompilerArgs $Compiler) +
                 @(
                     "-d:debug", "--linedir:on",
                     "--nimcache:$cache",
                     "--passL:$passL",
                     "--out:$buildDll",
                     $src
                 )

    Invoke-Build $buildArgs "Debug"

    Write-Host "Debug done => $buildDll" -ForegroundColor Green
}

# --------------------------------------------------------
# Entry point
# --------------------------------------------------------
switch ($Mode) {
    "release" { Build-Release }
    "debug"   { Build-Debug }
    "all"     { Build-Release; Build-Debug }
}

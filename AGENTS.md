# Repository Guidelines

## Project Structure & Module Organization
- Core library sources live at the repo root: `zmij.cc` (C++), `zmij.c` (C), and `zmij.h`.
- `example.cc` is a minimal usage sample for the C++ API.
- Tests, benchmarks, and supporting libs are under `test/` (notably `gtest/`, `dragonbox/`, and `fmt/`).
- CMake build configuration is in `CMakeLists.txt` and `test/CMakeLists.txt`.

## Build, Test, and Development Commands
- Configure and build:
  `cmake -S . -B build` then `cmake --build build`
- Run unit tests via CTest:
  `ctest --test-dir build --output-on-failure`
- Run the example:
  `./build/example`
- Optional benchmarks:
  `./build/test/benchmark`

## Coding Style & Naming Conventions
- C/C++ with C++17 (`ZMIJ_STANDARD` in CMake); keep changes compatible with both C and C++ when touching shared logic.
- Indentation uses two spaces and no tabs (match existing files like `zmij.cc`).
- Macros use the `ZMIJ_` prefix; keep compile-time options consistent (e.g., `ZMIJ_USE_SIMD`, `ZMIJ_USE_INT128`, `ZMIJ_NO_BUILTINS`).
- Prefer small, focused functions and avoid introducing external dependencies.

## Testing Guidelines
- Tests use GoogleTest (`test/gtest`); most test sources follow `*-test.cc` naming.
- Add new tests under `test/` and register them in `test/CMakeLists.txt`.
- Validate changes with `ctest --test-dir build`; add targeted tests for edge cases (rounding, subnormals, NaNs).

## Commit & Pull Request Guidelines
- Commit messages are short, imperative, and capitalized (e.g., “Add missing #include <math.h>”).
- Include PR/issue references when relevant (e.g., `(#57)`).
- PRs should describe the change, rationale, and test coverage; include performance notes when relevant to conversion speed.

## Configuration Tips
- Toggle feature flags with compile definitions to validate portability:
  `-DZMIJ_USE_SIMD=0`, `-DZMIJ_USE_INT128=0`, `-DZMIJ_NO_BUILTINS=1`.

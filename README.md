# Quasi-Riemann hypothesis — standalone Lean project

An extracted dependency closure of `OAI.NumberTheory.DirichletL.Nonvanishing`
from [openai/math](https://github.com/openai/math). The original declaration
names and proof sources are preserved.

## Statements

- `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`:
  `7 / 8 < s.re → riemannZeta s ≠ 0`.
- `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`:
  nonvanishing of every Dirichlet L-function for `7 / 8 < s.re`, excluding
  the principal character's pole at `s = 1`.

This is the stated `7/8` zero-free half-plane result, not the full Riemann
hypothesis. These files do not constitute a fresh mathematical review.

## Verified build

On 2026-10-07, this standalone project passed `lake build` with Lean 4.34.1
on Linux, compiling all 2,943 extracted modules and the `QuasiRiemann`
entry point. `lake env lean CheckAxioms.lean` also passed: both exported
theorems depend only on `propext`, `Classical.choice`, and `Quot.sound`.
All extracted source hashes still match `provenance.json`.

The build and axiom-check output is retained in `verification/`.
Comparator was not run separately.

## Build

Install [elan](https://github.com/leanprover/elan), then run from this directory:

```sh
lake update
lake exe cache get
lake build
lake env lean CheckAxioms.lean
```

`lean-toolchain` pins Lean **4.34.1**. Mathlib is pinned to commit
`d13f23b723b8a846827a245b89c10fc7d3f11612`; commit the accompanying
`lake-manifest.json` when publishing the project. The initial build needs
network access to fetch dependencies and the Mathlib cache. No files from
the parent OpenAI repository are required.

The default build follows only `QuasiRiemann.lean` and its imports. It does
not compile the statement-only Comparator fixtures. `CheckAxioms.lean`
prints the assumptions of both exported theorems and fails if it finds an
axiom outside `propext`, `Quot.sound`, and `Classical.choice`, matching the
original Comparator configurations. This rejects `sorryAx` and additional
project axioms.

For an additional statement comparison, install `comparator`, `landrun`,
and `lean4export` as described by the original project, then run:

```sh
lake env comparator ComparatorChallenges/QuasiRiemannHypothesis.json
lake env comparator ComparatorChallenges/DirichletSevenEighths.json
```

The `sorry` placeholders in `ComparatorChallenges/*.lean` belong to the
original target statements, not the proof library.

## Contents and provenance

- `OAI/`: 2,924 original modules in the entry point's import closure.
- `RellichKondrachov/`: 15 required third-party modules.
- `PrimeNumberTheoremAnd/`: 4 required third-party modules.
- `provenance.json`: source revisions, compatibility-patch hashes,
  external imports, and SHA-256 hashes of all 2,943 extracted source files.
- `licenses/`: original third-party licenses.

The vendored third-party sources include the compatibility changes from
the OpenAI repository's `rellich-kondrachov-lean4341.patch` and
`PrimeNumberTheoremAnd-lean4341.patch`. They retain their original namespaces
and copyright headers. Mathlib is the only direct Lake dependency.

## VeriLib upload

Upload this directory as the project root, including `lakefile.lean`,
`lean-toolchain`, `lake-manifest.json`, the Lean sources, and licenses.
Exclude `.lake/` and generated build files. The build command is `lake build`;
the entry file is `OAI/NumberTheory/DirichletL/Nonvanishing.lean` (also exposed
through `QuasiRiemann.lean`). No upload is performed by this project.

import Lake

open Lake DSL

package «quasi-riemann» where
  version := v!"0.1.0"
  fixedToolchain := true
  leanOptions := #[⟨`autoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "d13f23b723b8a846827a245b89c10fc7d3f11612"

lean_lib RellichKondrachov where
  globs := #[`RellichKondrachov.+]

lean_lib PrimeNumberTheoremAnd where
  globs := #[`PrimeNumberTheoremAnd.+]

lean_lib OAI where
  globs := #[`OAI.+]

@[default_target]
lean_lib QuasiRiemann

-- Statement-only fixtures for the optional Comparator check.
lean_lib ComparatorChallenges where
  roots := #[`ComparatorChallenges.QuasiRiemannHypothesis,
             `ComparatorChallenges.DirichletSevenEighths]

import QuasiRiemann
import Lean.Util.CollectAxioms

#print axioms OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re
#print axioms OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Quot.sound, ``Classical.choice]
  for name in #[``OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re,
      ``OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re] do
    let axioms ← Lean.collectAxioms name
    for axiomName in axioms do
      unless allowed.contains axiomName do
        throwError "{name} depends on disallowed axiom {axiomName}"

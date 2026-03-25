---
name: architecture-compliance-check
description: 'Verify layering violations, dependency direction, MerlinX ACL boundary integrity, and separation of concerns against docs/architecture.md.'
argument-hint: 'Code files or modules to check, e.g. "Infrastructure layer" or list of changed files'
user-invocable: true
metadata: {
  "skill": "architecture-compliance-check",
  "description": "Architecture compliance check against docs/architecture.md.",
  "usage": "Use when code planning or review needs architecture validation.",
  "input": "Code area or file list.",
  "output": "COMPLIANT/NON-COMPLIANT with violations."
}
---

# Architecture Compliance Check Skill

## When to use
- Planner needs design validation before implementation
- Code Review finds potential layering or boundary violations
- Architecture guard needs a secondary confirmation

## Inputs
- Code area (e.g., "Presentation layer", "Infrastructure") or list of changed file paths

## Procedure
1. Parse file paths to determine layers (Presentation, Application, Domain, Infrastructure)
2. Validate layering correctness: each layer only depends on layers below per `docs/architecture.md`
3. Check dependency direction: no circular dependencies, no upward layer calls
4. Verify MerlinX anti-corruption boundary (Infrastructure only, no wire DTOs exposed to upper layers)
5. Assess separation of concerns: each module has single responsibility
6. Check for blackbox modularity: clear public interfaces, hidden internals
7. Cross-reference with `docs/architecture.md` for any violations

## Output format
- **Compliance Verdict**: COMPLIANT | NON-COMPLIANT
- **Violations** (if any):
  1. Violated rule (with reference to `docs/architecture.md`)
  2. Evidence (file path, symbol, dependency chain)
  3. Impact (user-facing vs. internal)
- **Overcomplications** (if any): unnecessary layers or abstractions flagged as JUSTIFIED or USELESS
- **Recommendations**: minimal corrective actions to restore compliance

## Completion checks
- All file paths analyzed against layering rules
- All identified violations have evidence trails
- MerlinX boundary integrity confirmed or flagged
- Compliance verdict is explicit

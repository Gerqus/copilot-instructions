---
name: sanity-check
description: 'Perform a sanity check (Why-WhatFor analysis) on a decision before proceeding with it.'
argument-hint: 'Description of the decision made/to make.'
user-invocable: true
metadata: {
  "skill": "sanity-check",
  "description": "Perform a sanity check on a decision.",
  "usage": "Use this skill throughout the work, after making a decision, change in code, or approach.",
  "input": "Description of the decision made/to make.",
  "output": "A Why-WhatFor analysis result, validating or refuting the decision."
}
---

# Sanity Check (Why-WhatFor Analysis) Skill

## When to use
- After making any non-trivial: decision, change, tool use or fleshing-out prior thoughts.
- Before committing to a complex implementation path.
- When evaluating the potential consequences (positive and negative) of any non-trivial change.
- Validating own chain of thoughts and assumptions.

## The Why-WhatFor Sanity Check

You are the sanity checker of your own work. Perform this analysis strictly:
1. **Why**:
  - What is the fundamental rationale for this decision within the broader project and task context?
  - What is the immediate reason for this decision?
2. **What For**: For what gain?
  - Evaluate potential positive and negative impacts of the decision on whole project and work scope
  - Evaluate immediate consequences.

## Outputs
- Present a concise, focused, distilled outline summarizing the Why-WhatFor analysis.
- Conclude with a clear statement: Does the logic hold up? Or should approach be adjusted, backtracked, or rethought?
- Do not shy away from being neither critical/lenient nor supportive of your own decisions. Strive for cold objectiveness.

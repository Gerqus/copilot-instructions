---
name: sanity-check
description: 'Perform a sanity check (Why-What-For analysis) on your work before finalizing an approach or code change.'
argument-hint: 'Description of the planned/completed change or approach.'
user-invocable: true
metadata: {
  "skill": "sanity-check",
  "description": "Perform a sanity check on a planned or implemented change.",
  "usage": "Use this skill throughout the work, after making a decision, change in code, or approach.",
  "input": "Description of the change or approach.",
  "output": "A Why-What-For analysis result, validating or refuting the change."
}
---

# Sanity Check (Why-What-For Analysis) Skill

## When to use
- After making a significant decision, change in code, or architectural approach.
- Before committing to a complex implementation path.
- When evaluating the potential consequences (positive and negative) of a change.

## The Why-What-For Sanity Check

You are the sanity checker of your own work. Perform this analysis strictly:
1. **Why**: What is the root cause or fundamental rationale for this change within the broader project and task context?
2. **What**: What exact mechanisms are changing, and does the code or approach perfectly match the original intention without unnecessary bloat? (Apply Occam's Razor)
3. **For**: For what consequences? Evaluate potential positive and negative impacts, edge cases, regressions, performance, and coupling constraints.

## Outputs
- Present a concise, structured outline to the user summarizing the Why-What-For analysis.
- Conclude with a clear statement: Does the logic hold up? Or do you need to adjust, backtrack, or rethink the approach?
- Do not shy away from adjusting code or abandoning the approach immediately if this sanity check uncovers flaws.
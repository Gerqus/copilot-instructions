---
name: finalize
description: 'Run the post-coding finalization pipeline: review, test, debug, fix, cleanup, verify.'
argument-hint: 'What was done and acceptance criteria'
agent: '[orchestrator] Finalization'
---
Run the full finalization pipeline on the work just completed.

**What was done:** ${input:What coding work was just completed?}
**Acceptance criteria:** ${input:What does "done" look like? (test expectations, behavior, constraints)}

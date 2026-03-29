---
name: finalize
description: 'Run the post-coding finalization pipeline: deep review, sanity checks/tests, verification, and triage-ready findings (no fixes).' 
argument-hint: 'What was done and acceptance criteria'
agent: '[orchestrator] Finalization'
---
Run the full assessment-only finalization pipeline on the work just completed. Do not fix/debug; report findings for later triage. Keep report format flexible and adapt it to what is most useful for triage.

**What was done:** ${input:What coding work was just completed?}
**Acceptance criteria:** ${input:What does "done" look like? (test expectations, behavior, constraints)}

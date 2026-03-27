---
name: decision-log-audit
description: 'Audit a conversation for undocumented decisions that meet logging criteria (durable, cross-cutting, non-obvious, normative).'
argument-hint: 'Changed files or description of work completed, e.g. "refactored search engine" or list of modified .php files'
user-invocable: true
metadata: {
  "skill": "decision-log-audit",
  "description": "Decision log hygiene and suggested entries.",
  "usage": "Use when work is complete to ensure decisions are logged.",
  "input": "Changed files or work description.",
  "output": "Suggested new entries, flagged stale entries."
}
---

# Decision Log Audit Skill

## When to use
- Programmer finishes implementation and should log decisions
- Finalization needs to check for undocumented decisions
- Decision log needs cleanup of stale/outdated entries

## Inputs
- List of changed files or description of work completed (e.g., "implemented offer deduplication logic")

## Procedure
1. Review existing `decisionlog.md` to find related entries
2. Analyze changed code/files to identify technical, architectural, or domain decisions:
   - Why a specific pattern was chosen (vs. alternatives)
   - Why a boundary or layer exists (vs. being flattened)
   - Performance or correctness trade-offs made
   - External constraints enforced (MerlinX API rules, product split rules, etc.)
3. For each identified decision, assess:
   - **Durable**: will it likely apply beyond this task?
   - **Cross-cutting**: does it affect multiple files or features?
   - **Non-obvious**: is it clear from the code alone?
   - **Normative**: does it express a rule or constraint?
4. Flag stale entries in `decisionlog.md` that no longer apply given recent changes
5. Suggest new entries for decisions meeting all 4 criteria

## Output format
- **Suggested new decision log entries**:
  1. [Decision statement]: [short rule-centric phrase, max 2 clauses]
  2. [Rationale/evidence from changed code]
  3. [Expected durability: temporary/session/long-term]
- **Flagged as stale** (suggest removal):
  1. [Existing entry that may no longer apply]
  2. [Why it seems outdated]
- **Entries to review for update**:
  1. [Entry that overlaps with new decisions]
  2. [Suggested amendment]

## Completion checks
- All changed files analyzed for decisions
- Each identified decision assessed against 4 criteria
- Existing log reviewed for overlaps and staleness
- Suggested entries use rule-centric phrasing
- Output is actionable (ready to merge into `decisionlog.md`)

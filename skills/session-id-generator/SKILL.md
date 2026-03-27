---
name: session-id-generator
description: 'Generate a unique session ID for orchestrator agents to identify the current work session across subagent delegations. Produces an 8-character hex hash from random bytes.'
argument-hint: 'No arguments required'
user-invocable: true
metadata: {
  "skill": "session-id-generator",
  "description": "Generate a unique 8-char hex session ID from random data for cross-agent session tracking.",
  "usage": "Invoke at session start in orchestrator agents before delegating to subagents.",
  "input": "None.",
  "output": "Single 8-character lowercase hexadecimal string."
}
---

# Session ID Generator

## When to use

- At the start of an orchestrator session, before delegating work to subagents.
- When any agent needs a unique identifier to tag session memory files (e.g. `plan-<sessionId>.md`, `dod-<sessionId>.md`, `arch-review-<sessionId>.md`).
- When the orchestrator must communicate to subagents which session they belong to.

## Inputs

None. The script sources its randomness from `/dev/urandom`.

## Procedure

1. Run the [session ID generator script](./scripts/generate_session_id.sh):
   ```
   bash .github/skills/session-id-generator/scripts/generate_session_id.sh
   ```
2. Capture the single-line output — an 8-character lowercase hex string.
3. Use the captured value as `<sessionId>` in all session memory file paths for this work session.
4. Pass the session ID to every subagent invocation so they can read/write the correct session files.

## Output

A single line containing an 8-character lowercase hexadecimal string (e.g. `a3f7c012`).

## Completion checks

- Output is exactly 8 hex characters (`[0-9a-f]{8}`).
- The value is used consistently across all subagent delegations within the session.
- Session memory files are named with the generated ID (e.g. `/memories/session/plan-a3f7c012.md`).

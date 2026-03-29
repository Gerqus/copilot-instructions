---
name: conversation-id-generator
description: 'Generate a unique conversation ID for orchestrator agents to namespace `/memories/session/*` artifacts and prevent collisions across parallel chats/subagent delegations. Produces an 8-character hex hash from random bytes.'
argument-hint: 'No arguments required'
user-invocable: true
metadata: {
  "skill": "conversation-id-generator",
  "description": "Generate a unique 8-char hex conversation ID from random data to namespace VS Code memory files and avoid cross-chat collisions.",
  "usage": "Invoke at conversation start in orchestrator agents before delegating to subagents.",
  "input": "None.",
  "output": "Single 8-character lowercase hexadecimal string."
}
---

# Conversation ID Generator

## When to use

- At the start of an orchestrator conversation, before delegating work to subagents.
- When any agent needs a unique identifier to tag session memory files (e.g. `plan-<conversationId>.md`, `dod-<conversationId>.md`, `arch-review-<conversationId>.md`) and prevent collisions across parallel chats.
- When the orchestrator must communicate to subagents which conversation they belong to.

## Inputs

None. The script sources its randomness from `/dev/urandom`.

## Procedure

1. Run the [conversation ID generator script](./scripts/generate_conversation_id.sh):
   ```
  bash .github/skills/conversation-id-generator/scripts/generate_conversation_id.sh
   ```
2. Capture the single-line output — an 8-character lowercase hex string.
3. Use the captured value as `<conversationId>` in all session memory file paths for this conversation so files created through the VS Code memory tool do not collide with parallel chats.
4. Pass the conversation ID to every subagent invocation so they can read/write the correct session files.

## Output

A single line containing an 8-character lowercase hexadecimal string (e.g. `a3f7c012`).

## Completion checks

- Output is exactly 8 hex characters (`[0-9a-f]{8}`).
- The value is used consistently across all subagent delegations within the conversation.
- Session memory files are named with the generated ID (e.g. `/memories/session/plan-a3f7c012.md`).

---
name: prompt-implement-phase
description: 'Implement a single user-indicated phase from a whole plan.'
argument-hint: 'Plan and phase to implement'
user-invocable: true
metadata: {
  "skill": "prompt-implement-phase",
  "line": "codex",
  "counterpart": "/home/projekty/copilot-instructions/github/prompts/implement phase.prompt.md",
  "type": "prompt-counterpart"
}
---

# Prompt Counterpart: implement phase

Source prompt: `/home/projekty/copilot-instructions/github/prompts/implement phase.prompt.md`

## Prompt Content

In the context of the whole plan, use [$prompt-implement](/home/projekty/copilot-instructions/codex/skills/prompt-implement/SKILL.md) to work on the single phase of the plan indicated by the user. Report back when it is done. Be mindful not to overstep into other phases, but do not defer work that belongs to this phase. Use minimal code changes to fulfill the goals of this phase, considering future phase work. Do not shy away from asking clarifying questions interactively if you encounter something unexpected.

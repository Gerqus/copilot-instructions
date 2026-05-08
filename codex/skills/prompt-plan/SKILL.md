---
name: prompt-plan
description: 'Research, align business decisions with the user, and produce a locked phased implementation plan.'
argument-hint: 'Goal, problem, or feature to plan'
user-invocable: true
metadata: {
  "skill": "prompt-plan",
  "line": "codex",
  "counterpart": "/home/projekty/copilot-instructions/github/prompts/plan.prompt.md",
  "type": "prompt-counterpart"
}
---

# Prompt Counterpart: plan

Source prompt: `/home/projekty/copilot-instructions/github/prompts/plan.prompt.md`
Target agent (original): `Planner based off copilot official`

## Prompt Content

Create a small, precise implementation plan for:

${input:What should be planned?}

Planning rules:
- First collect all discoverable, relevant information from the codebase, current instructions, architecture docs, tests, related features, and existing patterns. Do not ask the user questions that can be answered by repository discovery.
- Reuse existing architecture, modules, helpers, patterns, tests, and conventions wherever appropriate. Prefer extending the established design over inventing a new one.
- After discovery, be interactive with the user for business decision making. Ask concise questions for product intent, scope boundaries, acceptance criteria, priority, UX/workflow decisions, and trade-offs that cannot be inferred from the codebase.
- Do not make major business decisions silently. Surface the options, recommend one, and get the user's decision before locking the plan.
- Make sure the plan adheres to architectural requirements, especially single source of truth, single responsibility, reusable boundaries, black-box modularity, directional data flow, explicit contracts, and removal of obsolete paths.
- If the discovered architecture conflicts with the requested outcome, abort and push back to the user, informaing them of the conflict and required architectural cleanup instead of planning around the conflict with fallbacks or compatibility shims.
- Lock all implementation decisions before finalizing: files, contracts, ownership, data flow, tests, cleanup, migration/removal work, verification commands, and out-of-scope items. For important or ambiguous decisions interactively ask the user for their decision.
- Split the work into self-contained phases. Each phase must have a clear goal, exact changes, dependencies, verification, and closure criteria.
- Keep phases small enough that each can be implemented and verified independently. If a phase is broad or fuzzy, split it.
- Do not leave implementation choices to the implementer unless the user explicitly asks for optionality. Instead interactively lock decisions with user.

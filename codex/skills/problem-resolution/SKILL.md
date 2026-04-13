---
name: problem-resolution
description: 'Selecting resolution for a problem base on RCA'
argument-hint: 'Task context and desired outcome'
user-invocable: true
metadata: {
  "skill": "problem-resolution",
  "line": "codex",
  "counterpart": "/home/projekty/copilot-instructions/agents/Problem resolution.agent.md",
  "type": "agent-counterpart"
}
---

# Problem resolution (Codex Counterpart)

This skill is the Codex-native equivalent of `/home/projekty/copilot-instructions/agents/Problem resolution.agent.md`.

## Codex Mapping
- Subagent delegation: `spawn_agent`, `send_input`, `wait_agent`
- User decisions: `request_user_input` in Plan mode; concise direct questions otherwise
- Session artifacts: `.agents/session/<conversationId>/...`
- Delegation authorization: if this skill instructs you to delegate, that instruction is sufficient authorization; do not wait for the user to separately ask for subagents.

# Problem resolution mode instructions
You are in problem resolution mode. Your task is to select the best resolution for a problem based on root cause analysis (RCA) approach, debugging and investigation.
Don't make any code edits now.

## Interaction protocol
- Share your resolution candidates and trade-off analysis with the user as they develop — invite feedback on direction before finalizing.
- Use `request_user_input (Plan mode) or direct user questions` to present options, discuss trade-offs, confirm priorities, and get the user's take on risk appetite and scope preferences.
- When the choice has meaningful consequences, surface it early for discussion rather than presenting a fait accompli.
- You own the resolution analysis and option shaping; the user owns direction and benefits from being part of the reasoning process.

## Change-planning thoroughness

- When planning, reviewing, or implementing changes, assess not only what should be added or refactored, but also what becomes obsolete, misleading, fragile, or unnecessary under the new design.
- If the root cause is architectural, prefer a resolution that cleans up the responsible boundary, ownership, or flow instead of layering a local symptom patch on top.
- Re-check touched areas for architecture, data flow, ownership, and contract changes. Do not preserve inference, synchronization, coupling, fallback, or compatibility logic by default.
- Treat the seam between old and new code as a high-risk zone. Look specifically for dead paths, misplaced responsibilities, deceptive behavior, and brittle transitions.
- Prefer coherent replacement and cleanup: if the new design removes the need for a legacy path, explicitly call for its removal.

Based on your research, brainstorm at least a few possible resolutions for the problem. Each resolution idea starts from formulating how it addresses the root cause of the problem and continues onwards. Consider the following factors when evaluating each resolution:
* Effectiveness: Will the resolution effectively address the root cause of the problem?
* Feasibility: Is the resolution feasible to implement given the current resources and constraints?
* Impact: What is the potential impact of the resolution on the overall system?
* Risks: What are the potential risks associated with the resolution, and how can they be mitigated?
* Industry best practices: Does the resolution align with industry best practices and standards?
* Long-term sustainability: Will the resolution provide a long-term solution to the problem, or is it a temporary fix?

Try and think about consequences of each resolution **in the context of the whole system** as opposed to just the immediate problem.

After evaluating the possible resolutions, rank them and recommend the best one based on the above factors. When the choice carries meaningful scope, product, rollout, or risk trade-offs, ask the user to confirm the preferred direction via `request_user_input (Plan mode) or direct user questions` before treating it as final. Provide a detailed explanation of why the recommended resolution leads.
The resolution consists of a list of dependencies within project, impact and logic it touches, modifies or relies on.

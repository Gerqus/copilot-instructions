# Codex Workspace

This directory is the Codex-native counterpart of the GitHub Copilot instruction ecosystem in this repository.

## Structure
- `skills/`: Codex-native skills (agent counterparts, prompt counterparts, helper skills)
- `references/`: shared instruction references mirrored from `instructions/` and `copilot-instructions.md`
- `scripts/`: sync automation for regenerating this codex line

## Session Artifacts Convention
- Use `.agents/session/<conversationId>/...` for planner/orchestrator artifacts.
- Reuse the same `<conversationId>` across delegated subagents and handoffs.

## Global Guidance
- Core TDD directive: `references/copilot-instructions.md`
- Language/framework guidance: `references/instructions/*.instructions.md`
- Apply the change-planning thoroughness rule from `references/copilot-instructions.md`: reassess touched architecture, flow, ownership, and contracts, and explicitly remove legacy logic that the new design makes obsolete.

## Agent Counterparts
- `/home/projekty/copilot-instructions/agents/Architecture guard.agent.md` -> `codex/skills/architecture-guard/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Business Analyst.agent.md` -> `codex/skills/business-analyst/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Code Review.agent.md` -> `codex/skills/code-review/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Critical thinking.agent.md` -> `codex/skills/critical-thinking/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Debugger.agent.md` -> `codex/skills/debugger/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Janitor.agent.md` -> `codex/skills/janitor/SKILL.md`
- `/home/projekty/copilot-instructions/agents/One-question deep analysis.agent.md` -> `codex/skills/one-question-deep-analysis/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Planner github official.agent.md` -> `codex/skills/planner-github-official/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Planner.old.md` -> `codex/skills/planner-old/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Problem resolution.agent.md` -> `codex/skills/problem-resolution/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Production incident triage.agent.md` -> `codex/skills/production-incident-triage/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Product Owner.agent.md` -> `codex/skills/product-owner/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Programmer.agent.md` -> `codex/skills/programmer/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Root-cause analyzis.agent.md` -> `codex/skills/root-cause-analyzis/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Tester.agent.md` -> `codex/skills/tester/SKILL.md`
- `/home/projekty/copilot-instructions/agents/Verifier.agent.md` -> `codex/skills/verifier/SKILL.md`
- `/home/projekty/copilot-instructions/agents/[orchestrator] Bug fixer.agent.md` -> `codex/skills/orchestrator-bug-fixer/SKILL.md`
- `/home/projekty/copilot-instructions/agents/[orchestrator] Feature implementation.agent.md` -> `codex/skills/orchestrator-feature-implementation/SKILL.md`
- `/home/projekty/copilot-instructions/agents/[orchestrator] Finalization.agent.md` -> `codex/skills/orchestrator-finalization/SKILL.md`

## Prompt Counterparts
- `/home/projekty/copilot-instructions/prompts/Implement plan step with architecture.prompt.md` -> `codex/skills/prompt-implement-plan-step-with-architecture/SKILL.md`
- `/home/projekty/copilot-instructions/prompts/Solve_next_todo_item.prompt.md` -> `codex/skills/prompt-solve-next-todo-item/SKILL.md`
- `/home/projekty/copilot-instructions/prompts/finalize.prompt.md` -> `codex/skills/prompt-finalize/SKILL.md`

## Helper Skill Counterparts
- `skills/architecture-compliance-check/SKILL.md` -> `codex/skills/architecture-compliance-check/SKILL.md`
- `skills/conversation-id-generator/SKILL.md` -> `codex/skills/conversation-id-generator/SKILL.md`
- `skills/core-test-failure-output/SKILL.md` -> `codex/skills/core-test-failure-output/SKILL.md`
- `skills/decision-log-audit/SKILL.md` -> `codex/skills/decision-log-audit/SKILL.md`
- `skills/security-gate/SKILL.md` -> `codex/skills/security-gate/SKILL.md`
- `skills/test-meaningfulness-audit/SKILL.md` -> `codex/skills/test-meaningfulness-audit/SKILL.md`

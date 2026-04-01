# copilot-instructions Workspace

This repository is a dual-ecosystem AI instruction set — **Copilot line** (`github/`) and **Codex line** (`codex/`). Files here are installed into target projects via symlinks or copy. See [README.md](../README.md) for installation.

## Structure

| Path | Role |
|------|------|
| `github/copilot-instructions.md` | Generic thinking/TDD/change-planning directives — install to `<project>/.github/copilot-instructions.md` |
| `github/agents/` | Custom agent modes (`.agent.md`) |
| `github/instructions/` | File-scoped instruction files with `applyTo` globs |
| `github/prompts/` | Slash-command prompt templates |
| `github/skills/` | On-demand helper skills |
| `github/hooks/` | Lifecycle hooks (deterministic enforcement, not guidance) |
| `codex/AGENTS.md` | Codex-native workspace instructions and authoritative counterpart map |
| `codex/skills/` | Codex counterparts of all agents, prompts, and skills |
| `codex/references/` | Curated instruction mirror for Codex consumption |

## Build and Test

No build step — files are consumed as-is by AI tools.

## Primitive Placement

When adding or modifying guidance, choose the primitive whose scope and enforcement mode match the intent:

| Need | Copilot primitive | Codex equivalent | Decision rule |
|------|-------------------|------------------|--------------|
| Universal always-on discipline | `github/copilot-instructions.md` | `codex/AGENTS.md` (Global Guidance) | Loaded on every prompt; keep minimal |
| File/language-scoped rules | `github/instructions/*.instructions.md` + `applyTo` | `codex/references/instructions/` | Passive context; mirror to Codex after changes |
| Specialized multi-step workflow | `github/agents/*.agent.md` | `codex/skills/<name>/SKILL.md` | Register mapping in `codex/AGENTS.md` |
| Focused parameterized task | `github/prompts/*.prompt.md` | `codex/skills/prompt-<name>/SKILL.md` | |
| On-demand helper workflow | `github/skills/<name>/SKILL.md` | `codex/skills/<name>/SKILL.md` | |
| Deterministic lifecycle gate | `github/hooks/*.json` | Codex hooks (TBD) | Enforces unconditionally; not guidance |

**Key distinctions:**
- **Instructions vs. Skills/Agents**: Instructions are passive context loaded when files match. Skills/Agents drive active, workflow-oriented execution.
- **Skills vs. Agents**: Same capabilities throughout → Skill. Need context isolation, subagent output boundaries, or per-stage tool restriction → Agent.
- **Skills vs. Prompts**: Multi-step workflow with bundled assets → Skill. Single focused task with parameterized inputs → Prompt.  
- **Instructions vs. Hooks**: Instructions *guide* (non-deterministic). Hooks *enforce* via shell commands at lifecycle events (`PreCompact`, `PreToolUse`, etc.).

## Ecosystem Dependencies

Agents and skills in this repo assume the following exist in **target projects**. New agents must document their dependencies here and in `codex/AGENTS.md`:

| Dependency | Used by | Effect if absent |
|------------|---------|-----------------|
| `docs/architecture.md` | Architecture guard, Architecture compliance check, Programmer, Code Review | Architecture gate cannot validate; agents warn and request the file |
| `decisionlog.md` | Decision log audit, Programmer, Orchestrators | Decisions not logged; create empty file to enable |
| Test harness | Tester, Programmer, Core test failure output | TDD protocol degrades gracefully |
| Playwright MCP (`browser` tool) | Code Review (browser tests), Programmer | Browser test steps skipped |

## Key Conventions

### ConversationId pattern
Orchestrators generate a `conversationId` via the `conversation-id-generator` skill before spawning subagents. All delegated agents reuse the same ID to namespace session artifacts:
- Copilot: `/memories/session/<conversationId>/`
- Codex: `.agents/session/<conversationId>/`

Never create session artifacts without a `conversationId`. This prevents collision between parallel workflows.

### Architecture gate
Programmer and orchestrators invoke the Architecture guard subagent before implementation. Halt on NON-COMPLIANT verdicts unless the user explicitly overrides. Persist verdict to session memory.

### Decision logging
After implementation, assess decisions against 4 criteria (durable, cross-cutting, non-obvious, normative). Log qualifying decisions to `decisionlog.md` via the `decision-log-audit` skill using rule-centric phrasing (one sentence, max two clauses).

### Adding a new file-scoped entity
1. Create relevant md file in `copilot/` with required frontmatter
2. Map it in `codex/AGENTS.md` and create the Codex counterpart in `codex` if needed
3. If the agent introduces a new target-project dependency, add it to the Ecosystem Dependencies table above and in `codex/AGENTS.md`

### MCP server integration
Declare tool dependencies in agent frontmatter (`tools:` for Copilot, `available_tools` for Codex). When building new agents:
- Playwright browser automation: use `browser` in Copilot `tools:`; `mcp__playwright__*` namespace in Codex
- Always test MCP availability in the target environment before marking it required

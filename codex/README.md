# Codex Line

This `codex/` directory is organized as a project-local Codex workspace mirror of the current GitHub Copilot line.

## What is included
- Full agent counterpart set: 18
- Full prompt counterpart set: 3
- Mirrored helper skills: 6
- Mirrored global instruction references: 11

## Regeneration
Run:

```bash
python3 codex/scripts/sync_codex_line.py
```

The sync script re-generates `codex/skills/` and `codex/references/` from repository `agents/`, `prompts/`, `skills/`, and `instructions/` sources.

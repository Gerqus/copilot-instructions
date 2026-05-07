---
name: prompt-implement
description: 'Implementation directive with consolidation of most important rules.'
argument-hint: 'Prompt context and required inputs'
user-invocable: true
metadata: {
  "skill": "prompt-implement",
  "line": "codex",
}
---

Implement needed changes. Priorities for code shape are ranked in strict order of importance:
1. Single source of truth
2. Single responsibility principles
3. Reusability
4. Black-box modularity
5. Directional data flow
Code must be simple, well-bounded, and maintainable. When tradeoffs arise, apply priorities in order. No fallbacks or defaults - centralize all configuration as single source of truth. No backwards compatibility.

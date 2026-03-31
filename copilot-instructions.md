## Test-first directive (TDD)

- When implementing bugfixes or features, write tests that first surface the current bug or missing behavior.
- Prefer tests that verify observable outcomes and user-visible behavior over internal implementation details.
- Confirm the test fails for the correct functional reason before changing production code.
- Implement the minimal code change soon after to move the failing test to passing (red -> green), then refactor safely.

## Change-planning thoroughness

- When planning, reviewing, or implementing changes, assess not only what should be added or refactored, but also what becomes obsolete, misleading, fragile, or unnecessary under the new design.
- Re-check touched areas for architecture, data flow, ownership, and contract changes. Do not preserve inference, synchronization, coupling, fallback, or compatibility logic by default.
- Treat the seam between old and new code as a high-risk zone. Look specifically for dead paths, misplaced responsibilities, deceptive behavior, and brittle transitions.
- Prefer coherent replacement and cleanup: if the new design removes the need for a legacy path, explicitly call for its removal.

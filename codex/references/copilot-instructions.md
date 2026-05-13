## Thinking discipline for every prompt

- Apply this guidance on every user prompt, not only when a specific file pattern matches.
- Before starting work, determine the scope of the request, the main subject, the relevant dependencies, and the files or systems likely involved.
- Strive to understand the full context before acting. If something is unclear, infer from the repository context and best engineering practices, then validate against the files in scope.
- When planning, first think through the whole task in your head. Perform a dry run of the intended changes step by step and visualize the code flow, data flow, dependencies, edge cases, and likely pitfalls.
- Re-check your own assumptions, explanations, and prior conclusions. If something feels off, question it, backtrack if needed, and adjust the approach before continuing.
- Prefer the simplest solution that works. Apply Occam's Razor whenever there is a choice between equivalent approaches.
- After non-trivial decision, #skill:sanity-check the consequences.

## Response profile (global)

- Be concise by default: compact wording, short sentences, no filler.
- Focus on core signal: what changed, why, and how to verify.
- Be strictly precise: avoid vague language, hedging, and unnecessary alternatives.
- Keep an execution-first tone: neutral, direct, professional.
- Do not over-explain obvious steps; expand only when uncertainty or risk requires it.
- Optimize for token/context budget:
	- Default to <= 120 words unless the user asks for more detail.
	- Prefer some bullet points over long paragraphs.
	- Report deltas only; do not restate unchanged plans, todos, or prior context.
	- Avoid repeating file content; reference paths/symbols instead.
- Brevity must not reduce task rigor:
	- Save words, not substance.
	- Keep persistence, completeness, and verification depth intact.
	- Include essential caveats, blockers, and validation results even in short responses.

## Test-first directive (TDD)

- When implementing bugfixes or features, write behavior-first tests that first surface the current bug or missing behavior through the public contract, observable output, state change, or user-visible result.
- Require tests that verify observable outcomes and user-visible behavior over internal implementation details; implementation-detail assertions (private helper calls, exact call order/counts, mock choreography) do not satisfy TDD evidence unless that interaction is the explicit contract.
- Confirm the test fails for the correct functional reason before changing production code.
- Implement the minimal code change soon after to move the failing test to passing (red -> green), then refactor safely.

## Change-planning thoroughness

- When planning, reviewing, or implementing changes, assess not only what should be added or refactored, but also what becomes obsolete, misleading, fragile, or unnecessary under the new design.
- If a symptom is caused by architectural mismatch, wrong ownership, or broken boundaries/data flow, fix that structure directly instead of patching the symptom in place.
- Re-check touched areas for architecture, data flow, ownership, and contract changes. Do not preserve inference, synchronization, coupling, fallback, or compatibility logic by default.
- Treat the seam between old and new code as a high-risk zone. Look specifically for dead paths, misplaced responsibilities, deceptive behavior, and brittle transitions.
- Prefer coherent replacement and cleanup: if the new design removes the need for a legacy path, explicitly call for its removal.
- Ensure all changes are well-bounded. Unify and split responsibilities so that you can explicitly list the responsibilities of each authority, module, and flow.

## Family-first design directive

- When virtually sensible, design this as the first member of a family. Even if there is only one element/implementation/path/item/part now, identify likely variation axes and encode cheap extension seams where the next cases would otherwise cause structural rewrite.
- Avoid speculative abstractions that do not correspond to a named future axis.
- Do not optimize only for current cardinality. Optimize for adding next elements/implementations/paths/items/parts with the smallest semantic diff.

## Anti-defensive-coding discipline

- Do not add error handling, fallbacks, or guards for scenarios that structurally cannot happen.
- Exhaustive type-safe constructs (enum switches, discriminated unions, pattern matches) must not have a default/fallback branch unless an external, untrusted source can produce an out-of-range value. A fallback on a closed enum is a lie: it silently swallows bugs instead of surfacing them.
- Validate only at system boundaries (network input, file I/O, CLI args, external APIs). Inside the boundary, trust the types and contracts that already exist.
- When you feel the urge to add a safety net "just in case," stop and ask: can this case actually occur given the current types and call sites? If no, delete the urge.

## User-facing error discipline

- Every user-facing error must suggest an actionable remediation; an error without a next step is pointless.
- User-facing errors must not expose technical details, internal circumstances, stack traces, identifiers, dependency names, implementation clues, or system state. Keep diagnostics in protected logs/telemetry and show users only safe, generic wording plus the remediation path.

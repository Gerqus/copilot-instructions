---
name: core-test-failure-output
description: 'Run core PHP tests via tests/run_all.sh and return only failed test files with exact error/throw/fail lines. Use when user asks for failure-only raw output with no narrative summary.'
argument-hint: 'Optional scope or runner variant, e.g. core tests or package tests'
user-invocable: true
metadata: {
  "skill": "core-test-failure-output",
  "description": "Run core PHP tests and return only failed test files with exact failure lines, no summary.",
  "usage": "Use when user requests raw failure output from core tests without narrative.",
  "input": "Optional scope/runner variant, default is core suite via tests/run_all.sh.",
  "output": "Exact lines from failure collector script, including NO_FAILED_TEST_FILES or FAILED_FILE blocks."
}
---

# Core Test Failure Output

## When to use
- User asks to run core tests and show only failures.
- User requests exact failure lines, not a prose summary.
- User wants failed test file list plus raw failure messages.

## Inputs
- Default: run core suite from `./tests/run_all.sh`.
- Optional variants: adapt runner only if user explicitly requests another suite.

## Procedure
1. Run [failure collector script](./scripts/run_core_test_failure_output.sh).
2. Return script output as-is.
3. Do not add generated narrative, interpretation, or paraphrasing.

## Decision points
- If output is `NO_FAILED_TEST_FILES`, return that exact line only.
- If failures exist, return each `FAILED_FILE:` block with the captured lines.
- If the runner is missing/unexecutable, return the emitted error line unchanged.

## Completion checks
- Runner used is `./tests/run_all.sh`.
- Every reported failed file appears as `FAILED_FILE: <path>`.
- Failure body preserves exact lines produced by failed tests.
- No additional generated summary text is added.

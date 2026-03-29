---
name: test-meaningfulness-audit
description: 'Analyze test files for meaningful assertions that process actual data; verify changed code is exercised by tests.'
argument-hint: 'Test files or feature area, e.g. "booking form tests" or list of *_test.php files'
user-invocable: true
metadata: {
  "skill": "test-meaningfulness-audit",
  "description": "Test meaningfulness and coverage assessment.",
  "usage": "Use when code changes need test quality validation.",
  "input": "Test files or feature area.",
  "output": "Meaningful/Trivial per test, coverage gaps."
}
---

# Test Meaningfulness Audit Skill

## When to use
- Code Review finds new/changed code without obvious tests
- Tester needs to verify assertions are meaningful (not trivial)
- Verification requires proof that changed code is actually exercised

## Inputs
- Test files (e.g., list of *_test.php) or feature area (e.g., "offer search")

## Procedure
1. Parse test file assertions looking for data processing and assertion patterns
2. Flag trivial assertions (true/false checks with no setup, empty assertions, single-line logic tests)
3. Verify meaningful assertions process actual data and assert on results (e.g., apply logic, check output)
4. Cross-reference changed code files with test file imports to detect coverage
5. Identify which changed/new functions are exercised by tests and which are not
6. Report coverage gaps (functions with no tests or only trivial tests)

## Output format
- **Test Quality Assessment**:
  1. Total tests analyzed: N
  2. Meaningful tests: N (assert after processing data)
  3. Trivial tests: N (flagged as weak)
- **Code Path Coverage**:
  - Changed functions exercised by tests: [list]
  - Changed functions NOT exercised: [list]
  - Changed functions with only trivial tests: [list]
- **Risk Assessment**: high/medium/low risk for uncovered code
- **Recommendations**: which gaps should be addressed before release

## Completion checks
- All assertions in test files analyzed
- Trivial tests identified and flagged
- All changed files cross-referenced with test coverage
- Coverage gaps explicitly listed
- Risk level assigned to gaps

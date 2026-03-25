---
name: security-gate
description: 'Validate input sanitization, auth/authz enforcement, secrets exposure, and OWASP Top 10 patterns in changed code.'
argument-hint: 'Code files to scan or feature area, e.g. "authentication controller" or "user input handling"'
user-invocable: true
metadata: {
  "skill": "security-gate",
  "description": "Security gate validation for changed files.",
  "usage": "Use when code review or verification needs security compliance checks.",
  "input": "Code area or file list.",
  "output": "PASS/FAIL per check with evidence."
}
---

# Security Gate Skill

## When to use
- User requests security validation of code changes
- Code Review finds input handling or authentication logic
- Verification needs to confirm security best practices

## Inputs
- Code area (e.g., "authentication", "user input form handling") or list of file paths

## Procedure
1. Scan changed files for user input handling (form fields, query params, API inputs)
2. Verify input sanitization and validation for SQL injection, XSS, command injection
3. Check auth/authz enforcement (login checks, permission checks, role-based access)
4. Scan for exposed secrets (hardcoded tokens, API keys, credentials)
5. Validate against OWASP Top 10 patterns (injection, broken access, sensitive data exposure, etc.)
6. Report findings by check with concrete evidence (file, line, pattern)

## Output format
- **Security Verdict**: PASS | FAIL
- **Checks performed**:
  1. Input Sanitization: PASS | FAIL (with evidence)
  2. Auth/Authz Enforcement: PASS | FAIL (with evidence)
  3. Secrets Exposure: PASS | FAIL (with evidence)
  4. OWASP Compliance: PASS | FAIL (with evidence)
- **Findings** (if any): specific violations with file paths and remediation steps

## Completion checks
- All input handling scanned
- All authentication/authorization checks verified
- No exposed secrets found or flagged
- OWASP patterns assessed

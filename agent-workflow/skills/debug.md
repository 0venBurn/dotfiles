---
name: debug
description: Diagnose and prove the root cause of a bug using a structured debug→prove→run→report process. Use this skill when the user provides a bug description or stack trace and wants to identify the root cause — NOT fix it. Triggers include phrases like "find the root cause", "debug this", "prove the issue", "diagnose this bug", or when a bug description and working context are both provided. Always follow this skill for any bug investigation task, even if the user's request seems straightforward.
---

# Debug

A structured process for diagnosing bugs and proving the root cause with a failing test — without fixing anything.

## Process

Follow these four steps in order:

### 1. Debug — Identify the most likely cause

Read the bug description and working context carefully. Form a hypothesis about the root cause. Consider:

- What code path is the failure occurring in?
- What invariant or assumption is being violated?
- Is this a data issue, logic issue, timing issue, or interface mismatch?

Do not chase multiple hypotheses at once. Commit to the most likely one first.

### 2. Prove — Write a targeted unit test

Consult `@docs/testing.md` for project-specific testing conventions before writing anything. If `docs/testing.md` does not exist, note it and use standard conventions for the detected stack.

Write a single unit test that:

- Directly exercises the suspected failure path
- Passes if the hypothesis is **wrong**
- **Fails** if the hypothesis is **correct** (i.e., it proves the bug exists)

The test should be minimal — isolate only what's needed to demonstrate the root cause. Do not write a fix. Do not refactor.

### 3. Run — Execute the test

Run the test. Evaluate the result:

- **Test fails as expected** → hypothesis confirmed, proceed to report
- **Test passes unexpectedly** → hypothesis is wrong; continue investigating with new observations until you find the actual cause

Do not stop until a test concretely proves the diagnosis.

### 4. Report — Output a short summary

Respond with only:

```
ROOT CAUSE: [Brief description]
TEST RESULT: [Pass/Fail status]
EVIDENCE: [1-2 sentences explaining how the test proves the cause]
```

Do not propose fixes. Do not include extra commentary.

## Constraints

- **Do NOT fix the bug.** Investigation only.
- **Do NOT output more than the report format** once the cause is proven.
- If the first test doesn't confirm the hypothesis, iterate — observation → new hypothesis → new test — until proven.

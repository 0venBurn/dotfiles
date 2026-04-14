---
name: test
description: Write comprehensive tests for a component, feature, or bug fix — without implementing anything. Use this skill when the user wants tests written first (TDD), wants to verify a bug exists before fixing it, or wants test coverage added to existing code. Triggers include "write tests for", "add test coverage", "test this component", "write failing tests", or any task where tests are the deliverable rather than the implementation. Always read docs/testing.md first. Do NOT implement the feature being tested.
---

# Write Tests

A TDD-style process for writing comprehensive, correctly failing tests before any implementation exists.

## Process

### 1. Read — Understand the testing conventions

Read `@docs/testing.md` first. If `docs/testing.md` does not exist, note it and use standard conventions for the detected stack (e.g. pytest for Python, Jest for TypeScript, the built-in test runner for Go). Do not write a single line of test code before completing this step.

### 2. Check — Find existing tests

Search for existing tests covering the subject. If found:

- Extend them to cover the new cases rather than creating a new file
- Match the existing style, structure, and naming exactly

If no existing tests are found, create a new test file following the conventions from `@docs/testing.md` (or the detected stack default).

### 3. Write — Cover all cases

Write tests for the cases specified by the user. At minimum cover:

| Case type       | What to cover                                         |
| --------------- | ----------------------------------------------------- |
| **Happy path**  | Expected successful behavior                          |
| **Error cases** | Known failure modes, thrown errors, rejected promises |
| **Edge cases**  | Boundaries, empty inputs, nulls, extremes             |

Each test should be self-contained and clearly named so failure messages are readable without context.

### 4. Run — Confirm tests fail

Run tests using the command documented in `@docs/testing.md`.

Tests **must fail** at this stage — there is no implementation yet. If a test passes without implementation, it is not testing anything real. Investigate and fix it before continuing.

### 5. Commit

Once all tests are confirmed failing for the right reasons, commit with a descriptive message following the project's commit convention (check `@docs/conventions.md` if unsure):

```
test: add [component] tests
```

## Constraints

- **Do NOT implement the feature.** Tests only.
- **Failing is correct.** A passing test at this stage is a broken test.
- **Extend before creating.** Always prefer adding to existing test files over creating new ones.
- **Read the docs first.** Every project has different test utilities, patterns, and runner commands — do not assume.

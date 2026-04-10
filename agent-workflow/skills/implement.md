---
name: implement
description: Implement a feature or code change following project documentation, then verify it with tests, linting, and formatting before finishing. Use this skill when the user asks to implement a component, feature, or code change and wants it done correctly end-to-end. Triggers include "implement this", "add this feature", "make the tests pass", "build this component", or any implementation task that references docs, patterns, or conventions. Always use this skill for implementation tasks — even simple ones benefit from the verification checklist.
---

# Implement and Verify

A structured process for implementing features correctly and verifying them before finishing.

## Process

Follow these steps in order:

### 1. Implement — Build the requested feature or change

Before writing code:

- Read `@docs/` for project-specific implementation requirements — this is mandatory
- Read `@docs/system_patterns.md` for architectural patterns and error handling conventions
- Read `@docs/conventions.md` for naming conventions

Then implement the requested component or change, following:

- **Patterns** from `@docs/system_patterns.md`
- **Naming** from `@docs/conventions.md`
- **Error handling** from `@docs/system_patterns.md`

### 2. Test — Run the test suite

Run tests using the command documented in `@test.md`.

If tests fail:

- Fix the implementation (not the tests) until all pass
- Do not move on with failing tests

### 3. Verify — Pre-finish checklist

Run through each item before responding:

- [ ] Linter passes — run linter, fix all errors
- [ ] Formatter applied — run formatter if documented in `@docs/formatting.md`
- [ ] All tests pass
- [ ] Code follows project conventions (naming, patterns, error handling)
- [ ] No debug code, console logs, or temporary comments left behind

Do not skip any checklist item. If a tool isn't documented, note it and continue.

## Constraints

- **Always read the docs before writing code.** Do not assume conventions.
- **Do not modify tests** to make them pass — fix the implementation.
- **Do not finish until the checklist is complete.**

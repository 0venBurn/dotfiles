---
name: plan
description: Prepare to implement a feature by reading and internalising its specs before any code is written. Use this skill when the user is about to start work on a feature that has specs in specs/[feature-name]/. Triggers include "start work on", "begin implementing", "pick up this feature", or when a task list references a feature with existing specs. Always load this skill before implement when specs exist.
---

# Plan

A structured process for reading and internalising feature specs before implementation begins — without writing any code.

## Process

### 1. Locate specs

Check `specs/` for a folder matching the feature being worked on. A complete feature folder contains:

```
specs/[feature-name]/
├── prd.md        # what and why
├── tech-spec.md  # how it's built
└── tasks.md      # ordered implementation steps
```

If none of these exist, note the absence and proceed using any context provided directly.

### 2. Read in order

Read the specs in this order — each builds on the last:

1. `prd.md` — understand the problem, goals, user stories, and non-goals
2. `tech-spec.md` — understand the data models, interfaces, data flows, and constraints
3. `tasks.md` — identify the current section to work on and what's already complete (`- [x]`)

If a file is missing, note it and continue with what's available.

### 3. Resolve ambiguities

Before handing off to the next skill:

- If anything in the specs contradicts the actual codebase, surface the conflict: `CONFLICT: spec says [X], codebase does [Y]. Which stands?`
- If a task depends on something not yet implemented, flag it before starting
- If the specs reference docs that don't exist, note it

Do not resolve ambiguities silently. Do not start implementing.

### 4. Confirm readiness

Output a brief readiness summary:

```
READY: [feature-name]
Section: [e.g. 2.0 — Auth middleware]
Specs read: prd.md, tech-spec.md, tasks.md
Conflicts: [none | list any]
Next: load implement skill
```

Then stop. The human or the workflow will trigger the next skill.

## Constraints

- **Do not write code.** This skill is preparation only.
- **Do not skip the conflict check.** Silent mismatches cause downstream bugs.
- **Do not summarise specs back at length.** The readiness summary is enough.

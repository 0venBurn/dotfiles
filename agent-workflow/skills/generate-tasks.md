---
name: generate-tasks
description: Generate a detailed implementation task list for a feature from its specs. Use this skill after a PRD and tech spec exist, or when the user wants a step-by-step task breakdown before implementing. Triggers include "generate tasks", "create a task list", "break this into tasks", or when called as part of the planning pipeline after generate-tech-spec. Final step in the planning pipeline.
---

# Generate Tasks

Produce a detailed, ordered task list that guides a developer through implementing the feature section by section.

## Pipeline mode

Task generation is always the final planning step. Stop after saving the task list regardless of whether `--auto` or "full pipeline" was specified.

**Auto mode only:** skip the Phase 1 pause (see below) and include the feature branch task by default.

## Process

### 1. Read existing specs

Check `specs/[feature-name]/` for `prd.md` and `tech-spec.md`. Use both as primary inputs if they exist. If only one exists, note the absence of the other. If neither exists, proceed from the user's description directly.

### 2. Phase 1 — Generate parent tasks

Create the file and generate the main high-level tasks. Aim for ~5 parent tasks. Always ask whether to include `0.0 Create feature branch` as the first task — unless in auto mode, in which case include it by default.

Present the parent tasks to the user and say: "High-level tasks generated. Ready to generate sub-tasks? Respond with 'Go' to proceed."

Then wait — unless in auto mode, in which case proceed immediately to Phase 2.

### 3. Phase 2 — Generate sub-tasks

Break each parent task into smaller, actionable sub-tasks. Ensure sub-tasks logically follow from the parent and cover the implementation details implied by the specs.

### 4. Identify relevant files

List files that will need to be created or modified, including test files where applicable.

### 5. Save

Save as `specs/[feature-name]/tasks.md`. Create the feature folder if it doesn't exist.

## Output Format

```markdown
## Relevant Files

- `path/to/file.ts` - Brief description of why this file is relevant.
- `path/to/file.test.ts` - Unit tests for `file.ts`.

### Notes

- Unit tests placed alongside source files they test
- See `docs/testing.md` for test runner commands and conventions

## Instructions for Completing Tasks

**IMPORTANT:** As you complete each task, check it off by changing `- [ ]` to `- [x]`.

Before starting work, read `AGENTS.md` for the full workflow. Per section:

1. Load the `plan` skill and read specs
2. Load the relevant skill for the work
3. Implement
4. Verify (tests pass, linter clean)
5. Review (skip trivial; required for business logic, auth, UI, data)
6. Commit
7. Check off all sub-tasks

Update the file after completing each sub-task, not just after completing an entire parent task.

## Tasks

- [ ] 0.0 Create feature branch
  - [ ] 0.1 Create and checkout a new branch (e.g., `git checkout -b feature/[feature-name]`)
- [ ] 1.0 Parent Task Title
  - [ ] 1.1 [Sub-task description]
  - [ ] 1.2 [Sub-task description]
- [ ] 2.0 Parent Task Title
  - [ ] 2.1 [Sub-task description]
```

## Constraints

- Do NOT implement anything.
- Do NOT skip Phase 1 pause unless `--auto` or "full pipeline" was specified.

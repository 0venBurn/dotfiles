---
name: generate-prd
description: Generate a Product Requirements Document for a new feature. Use this skill when the user wants to define what to build and why before writing any code. Triggers include "generate a PRD", "write product requirements", "I want to build [feature]", or any request to document a feature's goals, user stories, and scope before implementation. Part of the planning pipeline — runs first, followed by generate-tech-spec and generate-tasks.
---

# Generate PRD

Produce a Product Requirements Document that defines what to build and why — clear enough for a junior developer to understand the feature's purpose and core logic.

## Pipeline mode

Check whether the prompt contains `--auto` or "full pipeline":

- **Default (human-gated):** Stop after saving the PRD. Show it to the human and wait for confirmation before proceeding to `generate-tech-spec`.
- **Auto mode:** After saving the PRD, continue directly into `generate-tech-spec` without stopping. Do not re-ask questions already answered.

## Process

### 1. Ask clarifying questions

Before writing anything, ask only the most essential questions — limit to 3–5. Focus on gaps that would significantly change the PRD. Number all questions and list options as A, B, C, D so the user can respond with "1A, 2C, 3B".

Common gaps to probe:

- **Problem/Goal:** "What problem does this feature solve for the user?"
- **Core Functionality:** "What are the key actions a user should be able to perform?"
- **Scope/Boundaries:** "Are there specific things this feature should NOT do?"
- **Success Criteria:** "How will we know when this feature is successfully implemented?"

Only ask when the answer isn't reasonably inferable from the prompt.

### 2. Generate the PRD

Using the prompt and answers, produce a PRD with these sections:

1. **Introduction/Overview** — feature description, problem it solves, goal
2. **Goals** — specific, measurable objectives
3. **User Stories** — narratives describing feature usage and benefit
4. **Functional Requirements** — numbered list of specific must-have functionalities
5. **Non-Goals** — explicit scope boundaries
6. **Design Considerations** _(optional)_ — mockup links, UI/UX notes, relevant components
7. **Technical Considerations** _(optional)_ — known constraints, dependencies, integration points
8. **Success Metrics** — how success is measured
9. **Open Questions** — anything still unresolved

### 3. Save

Save as `specs/[feature-name]/prd.md`. Create the feature folder if it doesn't exist.

### 4. Pause or continue

- **Default:** Show the PRD and wait for the human to confirm before proceeding.
- **Auto mode:** Continue directly to `generate-tech-spec`.

## Constraints

- Do NOT start implementing.
- Do NOT proceed to tech spec without human confirmation unless `--auto` or "full pipeline" was specified.

---
name: observe
description: Explore and understand an existing codebase — mapping patterns, architecture, data flows, and conventions — then update docs/ with new findings. Use this skill when the user wants to understand a codebase without changing it, or as reconnaissance before starting a new feature. Triggers include "explore the codebase", "understand how this works", "map the architecture", "document what exists", or any task focused on observation and comprehension rather than implementation. Do NOT use for debugging, planning features, or proposing fixes.
---

# Observe

A structured process for understanding a codebase and keeping its docs current — without touching any code.

## What This Skill Is NOT For

Do not debug issues, create feature plans, propose fixes, or generate implementation tasks. If you find yourself doing any of those, stop.

## Process

### 1. Explore — Read and map the codebase

Work through the codebase systematically. Focus on:

- **Patterns and design decisions** — what approaches repeat? what was clearly chosen deliberately?
- **Component relationships** — what depends on what? how are modules connected?
- **Architectural choices** — layering, separation of concerns, entry points, boundaries
- **Data flows** — how does data move through the system? where does it originate and terminate?
- **Conventions and practices** — naming, file structure, error handling, testing approach
- **Module interactions** — how do different parts talk to each other?

Start broad (directory structure, entry points, config) then go deep on areas that matter.

### 2. Update Docs — Extend docs/ with new findings only

Check whether `docs/` exists:

- **If `docs/` exists:** read everything in it first, identify gaps — what's undocumented or out of date — then add only new information. Do not rewrite or restructure existing content. Place findings in the most relevant existing doc; create a new doc only if no suitable one exists.
- **If `docs/` does not exist:** create the directory and a `docs/architecture.md` as the initial document. Populate it with the findings from step 1. Note at the top that this doc was bootstrapped by the observe skill.

Do not document what's already there. Do not editorialize or suggest improvements.

## Constraints

- **Read only.** No code changes, no fixes, no plans.
- **Extend, don't rewrite.** Existing docs stay intact; you append or fill gaps.
- **Describe what is, not what should be.**

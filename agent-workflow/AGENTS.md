# AGENTS.md

## Docs

Read `docs/` before acting on any feature. Codebase knowledge lives there.

## Skills

Skills are loaded on-demand. Match the intent signal to the skill:

| Intent signal                                              | Skill                |
| ---------------------------------------------------------- | -------------------- |
| Explore codebase, map architecture, update docs            | `observe`            |
| Plan a feature, read specs, prepare to implement           | `plan`               |
| Write tests, add coverage, TDD, verify bug exists          | `test`               |
| Implement feature, build component, make tests pass        | `implement`          |
| Review diff, check changes, review PR                      | `review`             |
| Find root cause, debug this, diagnose bug, prove the issue | `debug`              |
| Generate a PRD, write product requirements                 | `generate-prd`       |
| Generate a technical specification                         | `generate-tech-spec` |
| Generate a task list from requirements                     | `generate-tasks`     |

## Commands

Commands are invoked directly by the human with a slash. Do not load them as skills.

| Command    | What it does                                |
| ---------- | ------------------------------------------- |
| `grill-me` | Stress-test a plan via structured interview |

## Planning pipeline

The planning skills (`generate-prd` → `generate-tech-spec` → `generate-tasks`) run with human review gates by default — pause after each document, show it to the human, and wait for confirmation before continuing.

**Exception:** if the prompt contains `--auto` or "full pipeline", chain all three without pausing. Clarifying questions are still asked once at the start; do not re-ask between steps.

Specs are stored under `specs/[feature-name]/`:

```
specs/
└── user-auth/
    ├── prd.md
    ├── tech-spec.md
    └── tasks.md
```

## Workflow

When instructed to work on task lists, work one **section** at a time (e.g., 1.0, 2.0). Per section:

1. Load the `plan` skill and read the relevant `specs/[feature-name]/` documents
2. Load the relevant skill for the work (implement, test, etc.)
3. Implement
4. Verify (tests pass, linter clean)
5. Review (skip for trivial changes; required for business logic, auth, UI, data handling)
6. Commit
7. Update task list (`- [ ]` → `- [x]`)

Never start the next section before committing the current one.

On unexpected failure mid-section: stop, report current state, do not attempt recovery without instruction.

## Communication

Respond terse like smart caveman. All technical substance stay. Only fluff die.

ACTIVE EVERY RESPONSE. No revert after many turns. No filler drift. Still active if unsure.

Drop: articles (a/an/the), filler (just/really/basically/actually/simply), pleasantries (sure/certainly/of course/happy to), hedging. Fragments OK. Short synonyms (big not extensive, fix not "implement a solution for"). Technical terms exact. Code blocks unchanged. Errors quoted exact.

Pattern: `[thing] [action] [reason]. [next step].`

Not: "Sure! I'd be happy to help you with that. The issue you're experiencing is likely caused by..."
Yes: "Bug in auth middleware. Token expiry check use `<` not `<=`. Fix:"

Drop caveman for: security warnings, irreversible action confirmations, multi-step sequences where fragment order risks misread, user asks to clarify or repeats question. Resume caveman after clear part done.

Example — destructive op:

> **Warning:** This will permanently delete all rows in the `users` table and cannot be undone.
>
> ```sql
> DROP TABLE users;
> ```
>
> Caveman resume. Verify backup exist first.

For Code/commits/PRs/docs/specs: write normal.

# AGENTS.md

## Docs

Read `docs/` before acting on any feature. Codebase knowledge lives there.

## Skills

Skills are loaded on-demand. Before starting each type of work, load the relevant skill:

| Trigger                | Skill       |
| ---------------------- | ----------- |
| Starting a new feature | `observe`   |
| Writing tests          | `test`      |
| Implementing code      | `implement` |
| After implementation   | `review`    |

## Workflow

When instructed to work on task lists. Work one **section** at a time (e.g., 1.0, 2.0). Per section:

1. Read `docs/` and load the relevant skill
2. Implement
3. Verify (tests pass, linter clean)
4. Review (skip for trivial changes; required for business logic, auth, UI, data handling)
5. Commit
6. Update task list (`- [ ]` → `- [x]`)

Never start the next section before committing the current one.

## Communication

Terse. Fragments ok. Technical terms exact. No filler.

Pattern: `[thing] [action] [reason]. [next step].`

Example: `Bug in auth middleware. Token check uses < not <=. Fix:`

Drop caveman for: security warnings, irreversible actions, ambiguous multi-step sequences.

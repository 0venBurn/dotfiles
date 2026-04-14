---
name: grill-me
description: Interview the user relentlessly about a plan or design until reaching a shared understanding, resolving each branch of the decision tree. Use when a user wants to stress-test a plan, get grilled on their design, or mentions "grill-me"
---

# Grill Me

Interview me relentlessly about every aspect of this plan until we reach a shared understanding. Walk down each branch of the decision tree, resolving dependencies between decisions one by one.

## Rules

- Ask one question at a time. Do not batch questions.
- If a question can be answered by exploring the codebase, explore the codebase instead of asking.
- If an answer contradicts a prior decision, surface the conflict explicitly before continuing: `CONFLICT: [decision A] vs [decision B]. Which stands?`
- Do not move to the next branch until the current one is fully resolved.

## Termination

Stop when all branches are resolved and no open questions remain. At that point, produce a **Decision Record** in this format:

```
## Decision Record

### Resolved decisions
- [Decision]: [Outcome and reasoning]
- ...

### Open questions
- [Any items deferred or explicitly left unresolved]
```

Do not produce the Decision Record until the interview is complete.

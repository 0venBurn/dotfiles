# Rule: Generating a Technical Specification Document

## Goal

To guide an AI assistant in creating a detailed Technical Specification in Markdown format, based on a PRD or feature description. The spec should define _how_ something is built — models, relationships, data flows, infrastructure choices — with enough detail that implementation is unambiguous.

## Process

1. **Receive Input:** The user provides a PRD, feature description, or direct technical requirements.
2. **Ask Clarifying Questions:** Before writing the spec, ask only the most essential questions about missing technical details. Limit to 3-5 critical gaps. Provide lettered options where possible for easy selection.
3. **Generate Tech Spec:** Based on input and answers, generate the spec using the structure below.
4. **Save Spec:** Save as `tech-spec-[feature-name].md` inside the `/tasks` directory.

## Clarifying Questions (Guidelines)

Focus on gaps that would block implementation or cause architectural mistakes. Common areas:

- **Data Model:** If unclear — "What are the core entities and their relationships?"
- **Infrastructure:** If unspecified — "Are there specific database, caching, or queue requirements?"
- **Integration Points:** If vague — "What existing services or modules does this connect to?"
- **Performance/Scale:** If unstated — "Are there specific throughput, latency, or retention requirements?"
- **Constraints:** If missing — "Are there existing patterns or conventions this must follow?"

**Important:** Only ask when the answer isn't reasonably inferable. Prioritize questions that would significantly change the implementation approach.

### Formatting Requirements

- **Number all questions** (1, 2, 3, etc.)
- **List options as A, B, C, D** for easy selection
- User should be able to respond with "1A, 2C, 3B"

### Example Format

How should this data be partitioned in TimescaleDB?
A. By created_at timestamp (default)
B. By a custom time column (specify which)
C. No time partitioning needed
D. Unsure — recommend based on query patterns
How do the core entities relate?
A. One-to-many (e.g. user has many events)
B. Many-to-many (junction table required)
C. Hierarchical (parent/child)
D. Independent (no foreign keys)
What is the expected data volume?
A. Low (< 10k rows/day)
B. Medium (10k–1M rows/day)
C. High (1M+ rows/day)
D. Unknown

## Tech Spec Structure

1. **Overview:** What is being built and why. Reference the PRD if one exists.
2. **Architecture Diagram (optional):** ASCII or description of how components connect.
3. **Data Models:** For each entity:
   - Table/collection name
   - Columns with types, constraints, and defaults
   - Indexes
   - Relationships (foreign keys, joins)
   - Any TimescaleDB specifics (hypertable, partition column, retention policy)
4. **API / Interface Design (if applicable):**
   - Endpoints or function signatures
   - Request/response shapes
   - Error cases
5. **Integration Points:** How this connects to existing services, modules, or external systems.
6. **Infrastructure & Config:** Database, caching, queues, environment variables, migrations.
7. **Data Flow:** Step-by-step description of how data moves through the system for the core use case.
8. **Error Handling & Edge Cases:** Known failure modes and how they should be handled.
9. **Performance Considerations:** Indexing strategy, query patterns, expected load, retention.
10. **Security Considerations:** Auth requirements, data sensitivity, access control.
11. **Open Questions:** Anything still unresolved that could affect implementation.

## Target Audience

Assume the primary reader is a **developer implementing the feature**. Be explicit about types, constraints, and reasoning behind decisions. Avoid leaving implementation choices ambiguous.

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `tech-spec-[feature-name].md`

## Final Instructions

1. Do NOT start implementing
2. Ask clarifying questions first
3. Incorporate answers before generating the spec
4. Reference any existing `/docs/system_patterns.md` or `/docs/conventions.md` for consistency

# Agent Operating Contract

You are working in a production-minded Python repository. Optimize for correctness, maintainability, security, testability and explainability — not maximum code generation.

## Working method

1. Read `CONTEXT.md` and the relevant spec before material changes.
2. Investigate existing code and tests before designing a change.
3. For non-trivial work, state a short plan and define how success will be verified.
4. Implement the smallest coherent vertical slice.
5. Run the narrowest useful checks while iterating, then the full verification gate before declaring completion.
6. Never claim a command/test passed unless you actually ran it and saw it pass.
7. When blocked, diagnose the root cause; do not paper over failures.
8. Keep changes within scope. Record unrelated issues instead of opportunistically rewriting them.

## Context discipline

- Prefer search, symbols, indexing and targeted reads over dumping whole directories into context.
- Load detailed skills/rules only when relevant.
- Summarize long discoveries into `PROJECT_STATUS.md` when they must survive context compaction or handoff.
- Treat specs, ADRs, tests and source code as authoritative over chat history.

## Human approval boundaries

Do not perform the following without explicit approval:

- destructive database operations or irreversible migrations;
- production deployment or infrastructure mutation;
- publishing packages/releases;
- force-push, destructive Git history rewriting or deleting branches/remotes;
- changing authentication/authorization policy;
- weakening security controls, tests, type checking or quality gates;
- accessing or exposing secrets.

## Engineering defaults

- Python 3.12+.
- Prefer the standard library before adding dependencies.
- Use explicit types on public interfaces and important domain code.
- Keep I/O at boundaries and business logic testable/pure where practical.
- Prefer composition over hidden global state.
- Parameterize SQL. Never interpolate untrusted values into SQL.
- UTC internally for timestamps unless the domain explicitly requires otherwise.
- No secrets, tokens, credentials, personal data or production datasets in source control.

## Definition of done

A task is not complete until:

- acceptance criteria are met;
- relevant tests were added/updated and pass;
- lint/format/type checks pass;
- security implications were considered;
- documentation/ADRs are updated when behavior or architecture changed;
- no debugging artifacts or accidental secrets remain;
- the final response reports files changed, checks run and any residual risks.

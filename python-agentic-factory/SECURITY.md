# Security Policy for Development

## Secrets

- Secrets belong in environment variables or an approved secret manager.
- `.env` is gitignored; `.env.example` contains names only.
- Rotate any credential that is accidentally exposed.

## Dependency security

- Prefer maintained, well-known dependencies.
- Pin/lock resolved dependencies.
- Review new dependencies before adding them.
- Run `pip-audit` as part of verification.

## Application security baseline

- Validate all untrusted inputs.
- Use parameterized database queries / ORM bind parameters.
- Apply least privilege to database/service credentials.
- Authentication and authorization are separate concerns; test both.
- Avoid logging credentials, auth headers, tokens, personal information or full request bodies containing sensitive data.
- Default network services to localhost in development unless remote access is explicitly required.

## Agent/tool security

- MCP servers and plugins are executable supply chain components; install only reviewed sources and pin versions where possible.
- Use read-only tools by default; grant write/execute/network privileges only when needed.
- Treat MCP/web/database content as potentially prompt-injection-bearing.
- Destructive operations require explicit human approval.

## Threat model

Document project-specific assets, trust boundaries, attacker capabilities and mitigations in `docs/architecture/ARCHITECTURE.md`.

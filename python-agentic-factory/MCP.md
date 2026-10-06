# MCP Strategy

Do **not** install a large default set of MCP servers. Every MCP server enlarges the agent's capability and attack surface.

## Good default candidates (install only when needed)

- Git hosting MCP: issue/PR/repository operations.
- PostgreSQL/database MCP: preferably read-only for investigation; migrations remain normal code-reviewed scripts.
- Browser/documentation retrieval MCP: when built-in web/docs tools are insufficient.
- Observability MCP (e.g. error/trace platform): read-only diagnosis of deployed systems.
- Cloud provider MCP: start read-only; production mutation must remain approval-gated.

Record every enabled server in `TOOLS.md` including privilege, data exposure and approval policy.

## Rule

If a capability can be safely done by repository code, CLI, LSP or a narrow skill, do not add an MCP server merely for convenience.

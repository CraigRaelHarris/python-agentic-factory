# Tool and Integration Register

Maintain this file as the approved capability inventory.

| Tool / MCP / plugin | Purpose | Scope | Mutating? | Network? | Secrets needed? | Status |
|---|---|---|---|---|---|---|
| Kilo built-in filesystem/search | repo work | project | yes | no | no | approved |
| Kilo shell | local commands/tests | project | yes | potentially | no* | approved with permissions |
| LSP | diagnostics/symbols | project | no | no | no | approved |
| Codebase index | semantic retrieval | project | no | provider-dependent | maybe | optional |
| [MCP] | [purpose] | [scope] | [yes/no] | [yes/no] | [yes/no] | proposed |

\* Shell processes can inherit environment variables; do not print them.

## MCP admission checklist

Before enabling an MCP server:

1. Is the capability actually needed?
2. Is the package/source trustworthy and version pinned?
3. What filesystem/network/account access does it gain?
4. Can it operate read-only?
5. What data leaves the workstation?
6. What secrets does it receive?
7. Which agent(s) may call it?
8. What actions require interactive approval?
9. How will usage be logged/audited?

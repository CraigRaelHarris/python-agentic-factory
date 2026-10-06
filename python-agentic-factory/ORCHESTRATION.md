# Orchestration Policy

## Primary pattern

Use a **conductor** interactively for ambiguous/high-judgment work and an **orchestrator** to delegate bounded independent tasks.

Default flow:

`planner -> implementer -> tester/reviewer/security reviewer -> implementer fixes -> verify -> human approval`

## Delegation rules

Delegate when a task benefits from an independent context or viewpoint:

- codebase exploration -> `investigator`
- review -> `reviewer`
- adversarial test design -> `tester`
- security-sensitive change -> `security-reviewer`
- docs after verified behavior -> `docs-writer`

Avoid subagents when the coordination overhead exceeds the work or when all delegates would need the same huge context.

## Self-investigating harness

Before asking the human for repository facts, the agent should use read-only capabilities in this order:

1. repository structure / glob;
2. exact search / grep;
3. LSP symbols/diagnostics;
4. codebase semantic index;
5. targeted file reads;
6. existing tests/specs/ADRs;
7. safe local commands;
8. external docs/web only when the answer is genuinely external/current.

The investigator must report evidence and uncertainty, not merely produce a guess.

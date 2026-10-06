# Python Agentic Engineering Factory

A reusable starter template for production-minded, AI-assisted software engineering in Python, built around **Kilo Code**, **OpenRouter** and **GLM-5.3** on Windows 11 + VS Code.

The factory replaces "remembering to tell the agent" with durable harness primitives:

1. Spec
2. Rule
3. Skill
4. Test
5. Eval
6. Hook
7. Tool

If an agent failure occurs once, fix the code. If it occurs twice, ask whether the factory itself is missing something.

## How the factory works

```
Intent/Spec
    ▼
┌─────────────────────────────────────┐
│          ENGINEERING HARNESS        │
│ AGENTS.md       Guardrails          │
│ Context         Security            │
│ Skills          Hooks               │
│ Subagents       MCP                 │
│ Workflows       LSP                 │
│ Tests           Evals               │
│ Observability   Token management    │
└─────────────────────────────────────┘
    ▼
Kilo Code → OpenRouter → GLM-5.3
    ▼
Python / tools / terminal / databases
```

Workflow per slice: **Discover → Specify → Design → Plan → Implement → Test → Eval → Independent Review → Security Review → Verify → Human Approval → Ship**

## Repository layout

- `python-agentic-factory/` — the template itself. See its [README](python-agentic-factory/README.md) for full setup, workflow and quality-gate instructions.
- `notes.md` — design notes: stack, factory model, workflow, structure, verify pipeline and PC setup.

## Quick start

1. Install Python 3.12+, Git, VS Code, the Kilo Code extension, and `uv` (Docker Desktop optional for local PostgreSQL).
2. Configure Kilo Code: provider **OpenRouter**, model **z-ai/glm-5.3**, enable LSP integration and codebase indexing.
3. Copy `python-agentic-factory/` and run:

   ```powershell
   ./scripts/bootstrap.ps1
   ```

4. Fill in `DISCOVERY.md`, `CONTEXT.md`, `docs/specs/PRODUCT_SPEC.md` and `GUARDRAILS.md`, then invoke `/project-start` in Kilo.

## Quality gate

`./scripts/verify.ps1` runs the full local gate: Ruff (format + lint), mypy (strict), pytest with coverage floor of 80%, Bandit, pip-audit, pre-commit hooks and the custom eval harness.

## Key principles

- Static, always-relevant context stays small; detailed material is loaded on demand.
- Specialized subagents (planner, implementer, reviewer, tester, security reviewer, investigator, docs-writer) keep concerns separated.
- Human approval is required for destructive, irreversible or production actions.
- Start conservative; add cloud, CI, frameworks and model routing only when a requirement justifies them.

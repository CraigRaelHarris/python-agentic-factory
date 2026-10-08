# Python Agentic Engineering Factory

A reusable starter repository for production-minded AI-assisted software engineering on Windows 11 using VS Code, Kilo Code, OpenRouter and GLM-5.3.

The repository is intentionally split into:

- **Static context**: small, always-relevant instructions (`AGENTS.md`, `CONTEXT.md`, `.kilo/rules/core.md`).
- **Dynamic context**: detailed skills, specs, architecture records, runbooks and eval material loaded only when needed.
- **Deterministic controls**: tests, linters, type checks, security scans, hooks/plugins and CI gates.
- **Agent specialization**: planner, implementer, reviewer, tester, security reviewer, investigator and documentation agents.

## 1. One-time machine setup (Windows 11)

Install:

1. Git for Windows
2. Python 3.12+
3. VS Code
4. Kilo Code VS Code extension
5. `uv` (recommended Python environment/package manager)
6. Optional: Docker Desktop if you want local PostgreSQL
7. Optional: PostgreSQL client tools (`psql`) and DBeaver/pgAdmin

Recommended VS Code extensions are listed in `.vscode/extensions.json`.

## 2. Configure Kilo + OpenRouter

In Kilo Code:

1. Settings → Providers → OpenRouter.
2. Add your OpenRouter API key there. **Do not put it in this repository.**
3. Select `z-ai/glm-5.3` through OpenRouter.
4. Enable LSP integration in Kilo experimental settings.
5. Enable codebase indexing for non-trivial projects.
6. Keep auto-compaction enabled.

The project `kilo.jsonc` sets the intended agentic defaults and permissions but does not contain credentials.

## 3. Create a new project from this template

Copy this folder, then from PowerShell:

```powershell
./scripts/bootstrap.ps1
```

Then fill in these files **before asking the coding agent to implement anything substantial**:

1. `DISCOVERY.md` — what is known, unknown and assumed.
2. `CONTEXT.md` — what this project is and who it serves.
3. `docs/specs/PRODUCT_SPEC.md` — intent, scope, requirements and acceptance criteria.
4. `docs/architecture/ARCHITECTURE.md` — initial architecture and constraints.
5. `GUARDRAILS.md` — project-specific hard constraints/risk limits.
6. `EVALS.md` — what success means beyond ordinary unit tests.
7. `.env.example` — names of required secrets/config, never real secret values.

Then invoke `/project-start` in Kilo.

## 4. Normal project workflow

Use the factory in this order:

1. **Discover** — clarify ambiguity and inspect the environment.
2. **Specify** — write/update the product/feature spec and measurable acceptance criteria.
3. **Design** — architecture, interfaces, data model, ADRs and risks.
4. **Plan** — small vertical slices with explicit verification.
5. **Implement** — agent edits code in bounded increments.
6. **Verify** — lint, types, tests, security, acceptance checks and evals.
7. **Review** — independent reviewer/security subagents inspect the diff.
8. **Observe** — inspect failures, token/cost/tool behavior, logs and drift.
9. **Ship** — human approval remains required for irreversible or production actions.
10. **Learn** — record decisions and update harness files when failure reveals a missing rule/tool/eval.

## 5. Quality commands

```powershell
uv sync --dev                # core + dev tooling only; add --extra ml/spark/postgres as needed
uv run ruff format --check .
uv run ruff check .
uv run mypy src
uv run pytest
uv run bandit -r src
uv run pip-audit
uv run python scripts/run_evals.py
```

Run the whole local gate:

```powershell
./scripts/verify.ps1
```

## 6. Database stance

- Default to **SQLite** for local/simple applications.
- Use **PostgreSQL** when concurrency, scale, advanced SQL, robust migrations or production durability justify it.
- Database changes require a migration and a rollback/forward-fix plan.
- Agents may inspect production-like schemas, but destructive database operations require explicit human approval.

## 7. Data/ML stance

Preferred stack:

- NumPy / pandas for local analytics and transformations.
- scikit-learn for conventional ML.
- PyTorch for deep learning/custom neural models.
- PySpark when data volume/distribution genuinely requires Spark.

Do not introduce Spark, a GPU stack, distributed orchestration or a separate service merely because it is available. Architecture must be justified by requirements.

## 8. Harness map

| Primitive | Location |
|---|---|
| Agent-wide instructions | `AGENTS.md` |
| Project context | `CONTEXT.md` |
| Hard project guardrails | `GUARDRAILS.md` + `.kilo/rules/security.md` |
| Coding/style rules | `.kilo/rules/python.md` |
| Architecture constraints | `ARCHITECTURAL_CONSTRAINTS.md` + `docs/architecture/ARCHITECTURE.md` |
| Specs | `docs/specs/` |
| Decisions | `docs/decisions/` |
| Skills | `.kilo/skills/*/SKILL.md` |
| Agents/subagents | `.kilo/agents/*.md` |
| Workflows | `.kilo/commands/*.md` |
| Kilo project config | `kilo.jsonc` |
| Deterministic Kilo hook/plugin | `.kilo/plugin/security-guard.ts` |
| Evals | `EVALS.md`, `evals/`, `scripts/run_evals.py` |
| Observability policy | `OBSERVABILITY.md` |
| Tool/MCP register | `TOOLS.md` |
| Security policy | `SECURITY.md` |
| Style | `STYLE.md` + `.kilo/rules/python.md` |
| Working plan | `PLAN.md` |
| Discovery | `DISCOVERY.md` |
| Plugin/hook policy | `PLUGINS.md` |
| Current state/handoff | `PROJECT_STATUS.md` |
| VS Code defaults | `.vscode/` |
| Python tooling | `pyproject.toml` |

## 9. What is intentionally *not* preconfigured

These require project-specific decisions:

- Cloud/deployment provider
- CI host (GitHub Actions, Azure DevOps, GitLab, etc.)
- Production secrets manager
- Real MCP credentials/servers
- Database selection and schema
- API/web framework
- UI framework
- Logging/telemetry backend
- LLM observability vendor
- Data classification rules beyond the safe defaults
- Model routing to cheaper/specialist models

Start conservative, then add capabilities only when a project requirement justifies them.

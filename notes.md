[stack]

os = Windows 11
ide = VS Code
harness = Kilo Code
gateway = OpenRouter
model = z-ai/glm-5.3
language = Python
libraries = NumPy, pandas, scikit-learn, PyTorch, PySpark, Pylance (language server extension for Python in vscode), pytest
databases = SQLite, PostgreSQL

[factory model]

Me
 ▼
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
Kilo Code
 ▼
OpenRouter
 ▼
GLM-5.3
 ▼
Python / tools / terminal / databases

[workflow]

DISCOVERY
    ↓
SPECIFICATION
    ↓
ARCHITECTURE
    ↓
PLAN
    ↓
IMPLEMENT SMALL SLICE
    ↓
TEST
    ↓
EVAL
    ↓
INDEPENDENT REVIEW
    ↓
SECURITY REVIEW
    ↓
VERIFY
    ↓
HUMAN APPROVAL
    ↓
SHIP

[structure]

python-agentic-factory/
│
├── AGENTS.md						<static>	{owner:should-not-change}
├── CONTEXT.md						<static>	{owner:me}
├── DISCOVERY.md								{owner:me+planner}
├── PLAN.md										{owner:planner}
├── GUARDRAILS.md								{owner:me}
├── SECURITY.md
├── EVALS.md						<dynamic>
├── OBSERVABILITY.md
├── ORCHESTRATION.md
├── TOKEN_POLICY.md					(GLM-5.3 has a very large context window but do not need to try to fill it)
├── TOOLS.md						(MCPs)
├── STYLE.md
├── ARCHITECTURAL_CONSTRAINTS.md
├── PROJECT_STATUS.md							{owner:agent}
├── MCP.md
├── PLUGINS.md
│
├── kilo.jsonc
├── pyproject.toml					(contains coverage floor of 80% for eval - I can change)
├── .env.example
├── .gitignore
├── .pre-commit-config.yaml
│
├── .kilo/
│   ├── agents/
│   │   ├── planner.md				1. READONLY, does not write production code
│   │   ├── implementer.md			2. the coding agent
│   │   ├── investigator.md			3. READONLY, self-investigating harness!
│   │   ├── reviewer.md				4. code review
│   │   ├── tester.md				5. adversarial test engineer
│   │   ├── security-reviewer.md	6. READONLY
│   │   └── docs-writer.md			7. (after verification)
│   │
│   ├── commands/					(workflow;)
│   │   ├── project-start.md		(when starting a new repository)
│   │   ├── implement.md			(for the next defined vertical slice)
│   │   ├── review.md				(before merging)
│   │   ├── verify.md
│   │   └── harness-audit.md		(environment self-improvement!)
│   │
│   ├── skills/										{owner:harness-evolution}
│   │   ├── api-design/             	<dynamic>
│   │   ├── database-change/        	<dynamic>
│   │   ├── debugging/              	<dynamic>
│   │   ├── security-review/        	<dynamic>
│   │   └── data-pipeline/          	<dynamic>
│   │
│   ├── rules/										{owner:should-not-change}
│   │   ├── core.md					<static>		{owner:should-not-change}
│   │   ├── python.md				<static>		{owner:should-not-change}
│   │   └── security.md				<static>		{owner:should-not-change}
│   │
│   └── plugin/						(kilo version of hooks)
│       └── security-guard.ts
│
├── docs/
│   ├── specs/
│   │   └── PRODUCT_SPEC.md				<dynamic>	{owner:me+planner}
│   ├── architecture/	
│   │   └── ARCHITECTURE.md				<dynamic>	{owner:me+planner}
│   ├── decisions/									{owner:me+planner}
│   │   └── ADR-000-template.md			<dynamic>	{owner:me+planner}
│   ├── evals/	
│   │   └── EVAL_CASE_TEMPLATE.md		<dynamic>
│   └── runbooks/									{owner:agent}
│       └── DEVELOPMENT.md				<dynamic>	{owner:agent}
│
├── evals/											{owner:me+agent}
│   └── cases/										{owner:agent}
│
├── scripts/
│   ├── bootstrap.ps1
│   ├── verify.ps1						(python verifications called by verify.md and listed in tasks.json - see [verify.ps1])
│   └── run_evals.py					(called by verify.ps1 or vscode or /verify workflow)
│
├── .vscode/
│   ├── settings.json
│   ├── extensions.json
│   └── tasks.json
│
├── infra/
│   └── docker-compose.postgres.yml		(so a PostgreSQL dev environment is available immediately without becoming mandatory)
│
├── src/
└── tests/											{owner: agent}

[verify.ps1]

Formatting       Ruff
Linting          Ruff
Typing           mypy
Testing          pytest
Coverage         pytest-cov
Security         Bandit
Dependencies     pip-audit
Git hooks        pre-commit
Agent evals      custom eval harness

[abbreviations]

ADR Architecture Decision Records (rationale behind technical choices)
LSP Language Server Protocol (protocol between IDEs and programming language-specific servers)

[manual checks]
1. kilo -> settings -> experimental -> LSP -> on
2. if large project, enable Kilo's codebase indexing

[pc setup]
install
- Python 3.12+
- Git
- VS Code
- Kilo Code
- uv
- Docker Desktop        optional
- DBeaver/pgAdmin        optional

config kilo
- Provider    OpenRouter
- Model       z-ai/glm-5.3

[model separation]
GLM-5.3
├── Code
├── Debug
├── Plan
├── Orchestrator
├── architecture
├── difficult review
└── difficult/security work

GLM-5.3 Flash
├── Ask
├── investigation
├── docs
├── routine test generation
├── small/background tasks
└── compaction

[starting a new project]
./scripts/bootstrap.ps1
	initializes Git
	creates the Python environment
	installs dependencies
	installs pre-commit
	creates local .env
	runs initial verification
Manually fill in 
1. DISCOVERY.md
2. CONTEXT.md
3. docs/specs/PRODUCT_SPEC.md
4. GUARDRAILS.md
Review 
1. ARCHITECTURAL_CONSTRAINTS.md
2. EVALS.md
3. SECURITY.md
in kilo;
/project-start

[important principle for agentic engineering]
Coding factory must move from me remembering to tell the agent...to 
1. SPEC
2. RULE
3. SKILL
4. TEST
5. EVAL
6. HOOK
7. TOOL
If an agent failure occurs once, fix the code. If it occurs twice, ask whether the factory itself is missing something.




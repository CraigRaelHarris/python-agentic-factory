$ErrorActionPreference = "Stop"

uv run ruff format --check .
uv run ruff check .
uv run mypy src
uv run pytest
uv run bandit -r src
uv run pip-audit
uv run python scripts/run_evals.py

Write-Host "All configured local verification checks passed."

$ErrorActionPreference = "Stop"

if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    throw "uv is not installed. Install uv, then run this script again."
}

if (-not (Test-Path .git)) {
    git init
}

# Install only core dependencies + dev tooling. Optional dependency groups
# (ml, spark, postgres) are opt-in; install them on demand with e.g.:
#   uv sync --extra ml
#   uv sync --extra spark
#   uv sync --extra postgres
uv sync --dev
uv run pre-commit install

if (-not (Test-Path .env)) {
    Copy-Item .env.example .env
}

Write-Host "Running initial verification..."
& "$PSScriptRoot/verify.ps1"

Write-Host ""
Write-Host "Bootstrap complete. Next:"
Write-Host "1. Fill CONTEXT.md"
Write-Host "2. Fill docs/specs/PRODUCT_SPEC.md"
Write-Host "3. Fill docs/architecture/ARCHITECTURE.md"
Write-Host "4. Review GUARDRAILS.md, SECURITY.md and EVALS.md"
Write-Host "5. Configure OpenRouter in Kilo (do not commit the key)"
Write-Host "6. In Kilo, run /project-start"

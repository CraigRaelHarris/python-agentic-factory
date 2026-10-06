# Development Runbook

## Bootstrap

```powershell
./scripts/bootstrap.ps1
```

## Run tests

```powershell
uv run pytest
```

## Full verification

```powershell
./scripts/verify.ps1
```

## Add a dependency

```powershell
uv add <package>
```

For a dev dependency:

```powershell
uv add --dev <package>
```

## Database

Document project-specific startup/migration commands here once persistence is selected.

## Application startup

[Add exact command once an application entry point/framework exists.]

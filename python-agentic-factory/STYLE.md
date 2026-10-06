# Style Rules

The enforced Python baseline lives in `.kilo/rules/python.md` and `pyproject.toml`.

## General

- Optimize for clarity to the next engineer, not cleverness.
- Names should express domain meaning.
- Comments explain *why* or non-obvious constraints; code should explain *what*.
- Keep functions focused and modules cohesive.
- Prefer explicit contracts and typed boundaries.
- Avoid speculative abstractions and premature generalization.
- New public behavior requires tests and concise documentation.

## Documentation

- README: how to use/run the project.
- Specs: what must be true.
- Architecture: structural choices and boundaries.
- ADRs: why consequential decisions were made.
- Runbooks: operational procedures.
- PROJECT_STATUS: current handoff state only.

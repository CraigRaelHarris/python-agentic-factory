# Python Rules

- Target Python 3.12+.
- Use `pathlib` for filesystem paths where practical.
- Public functions/classes and complex internals require type annotations.
- Prefer dataclasses or typed models over unstructured dictionaries for stable domain contracts.
- Keep modules cohesive; avoid giant utility modules.
- Keep side effects at boundaries. Separate parsing/validation, domain logic and persistence.
- Use context managers for resources.
- Raise specific exceptions; preserve causal exceptions with `raise ... from ...` when appropriate.
- Never use bare `except:`.
- Tests should be deterministic; mock external boundaries rather than internal implementation details.
- NumPy/pandas: favor vectorized operations when clear, but not at the expense of correctness/readability.
- pandas: avoid chained assignment; make joins/keys/cardinality assumptions explicit.
- PySpark: avoid unnecessary `collect()` and Python UDFs; use built-in Spark expressions where possible.
- ML: record features, target, split strategy, metrics and leakage risks.

from __future__ import annotations

import json
from pathlib import Path


def main() -> int:
    """Validate that eval case files are parseable.

    Replace/extend this with project-specific deterministic scorers and, where justified,
    model-based judges. Keep the exit code blocking for hard requirements.
    """
    cases_dir = Path("evals/cases")
    failures: list[str] = []
    for path in sorted(cases_dir.glob("*.json")):
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
            if not data.get("id"):
                failures.append(f"{path}: missing id")
        except (OSError, json.JSONDecodeError) as exc:
            failures.append(f"{path}: {exc}")

    if failures:
        print("Eval harness validation failed:")
        for failure in failures:
            print(f"- {failure}")
        return 1

    print("Eval case files valid. Add project-specific scorers before relying on this gate.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

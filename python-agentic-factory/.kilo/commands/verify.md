---
description: Run deterministic project quality gates and summarize failures.
agent: implementer
---

Run `./scripts/verify.ps1`. If it fails, identify the first causal failure rather than blindly retrying. Fix only failures caused by the scoped change unless explicitly asked to clean pre-existing issues. Never weaken a gate merely to obtain green output.

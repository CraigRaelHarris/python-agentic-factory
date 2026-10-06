---
name: debugging
description: Use when diagnosing a failing test, runtime error, unexpected behavior, performance regression or intermittent issue.
---

# Evidence-Driven Debugging

1. Reproduce or establish the exact symptom.
2. Collect the smallest useful evidence: error, stack, diagnostics, failing test, logs.
3. List plausible hypotheses.
4. Test the cheapest hypothesis that best discriminates between causes.
5. Trace data/control flow; do not patch symptoms without understanding cause.
6. Add a regression test before/with the fix when feasible.
7. Re-run both the targeted test and relevant wider checks.

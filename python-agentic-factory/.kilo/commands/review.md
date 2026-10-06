---
description: Perform an independent multi-angle review before merge or handoff.
agent: planner
---

Delegate independent reviews where relevant:

1. `reviewer`: correctness, architecture, maintainability and regressions.
2. `tester`: gaps in behavior/failure-case coverage.
3. `security-reviewer`: security/trust boundary review when inputs, auth, data, dependencies, network or persistence changed.

Consolidate findings by severity. Do not edit code during the review. Clearly separate blocking issues, non-blocking improvements and questions.

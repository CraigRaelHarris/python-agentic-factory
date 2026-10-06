---
description: Inspect whether the agent harness itself needs improvement after failures or project evolution.
agent: planner
---

Audit the harness rather than application code:

1. Review recent failures, `PROJECT_STATUS.md`, specs, test/eval gaps and recurring human corrections.
2. Classify each issue as a missing/weak instruction, context problem, missing skill/tool, permission/guardrail gap, orchestration issue, eval gap or observability gap.
3. Recommend the smallest harness change that would prevent or detect recurrence.
4. Keep static context lean; prefer a skill or targeted rule when the knowledge is task-specific.
5. Never add a tool/MCP/plugin without reviewing its privileges and supply-chain implications.

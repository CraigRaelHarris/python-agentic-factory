# Token / Context Policy

GLM-5.3 has a very large context window, but a large window is not a target.

## Rules

- Keep `AGENTS.md`, `CONTEXT.md` and always-loaded rules short and high-signal.
- Use Skills for specialist procedures and detailed guidance.
- Retrieve only relevant source ranges/files; do not ingest the entire repository by default.
- Prefer LSP/search/index results before broad reads.
- Summarize durable task state in `PROJECT_STATUS.md` before deliberate compaction/handoff.
- Compact after major milestones when history has become mostly stale.
- Never use a giant context window as a substitute for repository structure, specs or documentation.

## Cost controls

Measure and review:

- tokens/task;
- retries/tool loops;
- expensive full-repo reads;
- repeated retrieval of unchanged context;
- whether smaller/cheaper models should later handle mechanical subagents.

Initially use GLM-5.3 consistently. Introduce model routing only after you have observability showing where it is safe and worthwhile.

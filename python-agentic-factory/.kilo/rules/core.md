# Core Harness Rules

- Work from intent and measurable success criteria, not ad-hoc implementation guesses.
- Inspect before editing.
- Prefer a small vertical slice over broad speculative scaffolding.
- Keep planning and implementation traceable to a spec/acceptance criterion.
- Use tools to verify facts rather than guessing about repository state.
- Fail visibly: do not suppress exceptions, skip checks or fabricate success.
- After discovering a recurring failure mode, propose a harness improvement (test, eval, rule, skill, hook or tool) rather than relying on memory.
- Use `PROJECT_STATUS.md` for durable handoff state, not as an activity log.

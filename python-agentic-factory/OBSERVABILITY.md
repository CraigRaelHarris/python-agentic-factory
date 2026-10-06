# Observability

## Development harness

Track enough evidence to answer:

- What task was attempted?
- Which agent/model handled it?
- Which tools/subagents were invoked?
- What failed and how many retries occurred?
- How much context/token/cost was consumed?
- Did a guardrail or permission gate fire?
- Which tests/evals proved the result?

## Application baseline

For deployable software, prefer structured logs with:

- timestamp (UTC)
- severity
- service/component
- correlation/request/job ID
- operation/event name
- duration
- result/status
- error class/code (without secrets)

Add metrics and traces when the system has meaningful runtime workflows or distributed boundaries.

## Privacy

Never emit secrets or sensitive payloads into logs/traces. Prefer identifiers and metadata over raw content.

## Agentic systems

If the product itself includes agents/LLMs, record model ID/version, prompt/skill version, tool calls, retry counts, latency and token/cost metrics where policy permits. Maintain an explicit retention policy.

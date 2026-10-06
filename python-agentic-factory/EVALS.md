# Evaluation Contract

Tests answer: **does deterministic software behave correctly?**
Evals answer: **does the agent/system repeatedly make acceptable choices and produce acceptable outcomes?**

## Required eval dimensions

For any AI/agentic feature, define applicable dimensions:

- Task success
- Correct tool selection/use
- Trajectory compliance (required/forbidden steps)
- Groundedness / hallucination rate
- Safety and policy compliance
- Output/schema validity
- Robustness to malformed/adversarial input
- Latency
- Token/cost budget

## Dataset

Store small version-controlled cases in `evals/cases/`. Keep sensitive or large datasets outside Git and document how to retrieve them.

## Rubric template

| Dimension | Metric | Threshold | Blocking? |
|---|---|---:|---|
| Functional success | pass rate | [e.g. >= 95%] | yes |
| Forbidden action | count | 0 | yes |
| Schema validity | pass rate | 100% | yes |
| Hallucination | rate | [define] | yes |
| Cost | p95 tokens/cost | [define] | no/yes |
| Latency | p95 | [define] | no/yes |

## Change policy

- Add an eval case whenever a meaningful agentic failure is discovered.
- Do not lower a threshold to make a change pass without documenting why.
- Version prompts/rules/skills alongside eval changes so regressions are attributable.

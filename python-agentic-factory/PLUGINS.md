# Kilo Plugin / Hook Policy

Kilo plugins execute code inside the harness and therefore receive the same supply-chain scrutiny as development dependencies.

## Included plugin

`.kilo/plugin/security-guard.ts`

Purpose:

- block reads of likely secret files;
- block a small set of obviously destructive shell/SQL patterns;
- emit a structured harness log when the session becomes idle.

This is defense in depth, not a complete sandbox. Permission rules and human review remain authoritative.

## When to add a plugin

Use a plugin only when the behavior must happen deterministically inside the agent lifecycle, for example:

- before/after tool execution;
- permission decisions;
- structured harness telemetry;
- context injected at compaction;
- custom tool/provider integration.

Formatting/linting belongs in pre-commit/CI rather than an agent hook.

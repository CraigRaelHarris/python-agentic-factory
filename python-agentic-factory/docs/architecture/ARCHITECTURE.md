# Architecture

## Status

Draft

## Drivers

- [business/technical driver]

## Constraints

- Windows 11 development environment
- Python project
- SQLite or PostgreSQL when persistence is required
- [project-specific constraints]

## System context

[Describe users, services and trust boundaries. Add Mermaid if useful.]

## Components

| Component | Responsibility | Interfaces | Data owned |
|---|---|---|---|
| [name] | [purpose] | [API/event/etc.] | [data] |

## Data architecture

[Data model, lifecycle, classification, source-of-truth rules]

## Key interfaces/contracts

[API schemas/events/files]

## Security / trust boundaries

[Assets, identities, trust boundaries, privileges, threat considerations]

## Reliability

[Retries, idempotency, timeouts, failure handling, recovery]

## Observability

[Logs/metrics/traces and business telemetry]

## Performance/scaling assumptions

[Expected volumes and thresholds that would trigger redesign]

## Architectural constraints for agents

- Do not introduce a new service/database/framework without documenting the need.
- Architectural changes require an ADR in `docs/decisions/`.
- Preserve clear dependency direction and testable boundaries.

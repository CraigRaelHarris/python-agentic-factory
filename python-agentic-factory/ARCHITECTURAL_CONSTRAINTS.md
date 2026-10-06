# Architectural Constraints

These are defaults until a project-specific architecture explicitly overrides them through an ADR.

- Begin as a modular monolith unless requirements justify distribution.
- SQLite is the default lightweight persistence option; PostgreSQL is the default server database.
- Do not add a database if durable persistence is not required.
- Do not add Spark unless data size/distribution makes pandas/NumPy inappropriate.
- Keep external services behind narrow adapters/interfaces.
- Keep domain/business logic independent of transport and persistence where practical.
- Prefer stateless application components; make state ownership explicit.
- All schema/API/event contract changes require compatibility consideration.
- Migrations are code-reviewed artifacts.
- Cross-cutting behavior (logging, auth, retries, telemetry) should be centralized rather than duplicated.
- New services, queues, caches, vector stores, orchestration frameworks or cloud dependencies require a documented driver and ADR.

---
name: database-change
description: Use for SQLite/PostgreSQL schema changes, migrations, queries, indexes, transactions or persistence design.
---

# Database Change Skill

- Identify source-of-truth and transaction boundary.
- Prefer migrations; never hand-edit production schemas.
- Specify forward migration and rollback/forward-fix strategy.
- Preserve data or explicitly document destructive semantics.
- Parameterize SQL.
- Review indexes against actual query patterns.
- Test constraints, transaction behavior and migration on representative data.
- For PostgreSQL, consider lock duration and online migration implications.
- For SQLite, consider concurrency and file-level operational limits.

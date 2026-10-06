---
name: data-pipeline
description: Use for pandas, NumPy, PySpark, ETL/ELT, feature engineering, dataset quality, batch processing or data transformations.
---

# Data Pipeline Skill

- Define input/output contracts and schema.
- Make null, duplicate, invalid-row and late-arriving-data handling explicit.
- State units, time zones and key uniqueness assumptions.
- Validate row counts/cardinality around joins.
- Favor deterministic/idempotent transformations where possible.
- Use pandas/NumPy locally; introduce PySpark only when scale/distribution requires it.
- For Spark, avoid `collect()` on unbounded data and prefer native expressions to Python UDFs.
- Add data-quality assertions and representative fixture tests.
- Protect sensitive source data and document lineage/provenance.

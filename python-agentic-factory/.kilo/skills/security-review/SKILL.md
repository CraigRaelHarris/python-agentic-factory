---
name: security-review
description: Use when work touches authentication, authorization, secrets, untrusted input, files, SQL, network calls, deserialization, dependencies or sensitive data.
---

# Security Review Skill

Review:

- assets and trust boundaries;
- authentication vs authorization;
- validation/encoding/injection;
- SQL parameters and transaction safety;
- file/path traversal;
- SSRF/outbound network destinations;
- secret handling;
- sensitive logs/errors;
- dependency/supply-chain additions;
- least privilege;
- abuse/rate limits where relevant;
- agent/MCP prompt-injection boundaries if AI consumes external content.

Prefer concrete evidence and reproducible attack paths over generic warnings.

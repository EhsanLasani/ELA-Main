## 0. Metadata
- **Artifact ID (catalog.csv):** DOC-POL-ELA-POLICY-A
- **Version:** v1.0
- **Owner:** 
- **Linked Ticket / PR:** 

# ELA Policy Addendum: Systems Integration Blueprint Requirement

Effective Date: 2025-10-21

## Mandate
Every new ELA project must include and maintain a **Systems Integration Blueprint**:
- `Systems_Integration_Blueprint.md`
- `Systems_Integration_Blueprint.png`
- `.codex/blueprint-generator.md`

## Process Integration
1. Project Registration: Repo bootstrapped from ELA-Main includes all blueprint artifacts.
2. Code Reviews: Any integration change requires blueprint update in the same PR.
3. CI Gate: Job `blueprint-guard` validates presence and freshness (updated within last 30 days or since last release).
4. Archival: Freeze and tag blueprint with each production release.

## Roles & Responsibilities
- Architect: Owns blueprint accuracy.
- DevOps: Maintains CI gate and diagram generation.
- Developers: Keep Codex context aligned to ELA-Main/shared-libs.
- PMO: Audits compliance before stage/production gates.

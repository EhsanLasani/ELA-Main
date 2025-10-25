
# DEPLOYMENT PLAN TEMPLATE

---
```yaml
Artifact_ID: TMP-00-Deployment_Plan_Temp
Artifact_Name: DEPLOYMENT PLAN TEMPLATE
Artifact_Type: TMP
Version: v1.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Template for deployment planning in ELA projects
File_Path: 00_Policy/Templates/03_Development/Deployment_Plan_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Development/Deployment_Plan_Template.md
Phase: Development
Dependencies: None
Process_Group: Development
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25
```

| **Field**         | **Value**                                                                 |
|-------------------|---------------------------------------------------------------------------|
| Artifact ID       | TMP-00-Deployment_Plan_Temp                                               |
| Artifact Name     | DEPLOYMENT PLAN TEMPLATE                                                  |
| Artifact Type     | TMP                                                                       |
| Version           | v1.0                                                                      |
| Status            | Draft                                                                     |
| Owner             | Enterprise Architecture Office (EAO)                                      |
| Last Updated      | 2025-10-25                                                                |
| Description       | Template for deployment planning in ELA projects                          |
| File Path         | 00_Policy/Templates/03_Development/Deployment_Plan_Template.md             |
| GitHub URL        | https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Development/Deployment_Plan_Template.md |
| Phase             | Development                                                               |
| Dependencies      | None                                                                      |
| Process Group     | Development                                                               |
| Process Step      | N/A                                                                       |
| Template Source   | ELA-Template                                                              |
| Validation Status | Pending                                                                   |
| Comments          | Auto-generated on 2025-10-25                                              |

---

## How to Use This Template
- Use this template to plan, document, and communicate all deployment activities for your ELA project.
- Complete all sections before deployment. Link to related artifacts (SBOM, runbooks, test plans, etc.).
- Update and review with all stakeholders before production release.

---

## 1. Release Artifacts & Versioning
- **Artifacts:** (e.g., image tags, packages, charts)
- **Registry/Storage:** (e.g., GHCR/ECR/ACR, Nexus/Artifactory)
- **Versioning scheme:** (SemVer, build number, git tag)
- **SBOM / provenance:** (how/where generated & stored)

| Environment | Artifact | Registry | Version | SBOM/Provenance | Notes |
|-------------|---------|----------|---------|----------------|-------|
| Dev         |         |          |         |                |       |
| QA          |         |          |         |                |       |
| UAT         |         |          |         |                |       |
| Prod        |         |          |         |                |       |

> **Note:** Define pre-checks (migrations ready, feature flags default state, maintenance page toggle, etc.)

---

## 2. Verification & Quality Gates
- **Automated checks:** lint, SAST/DAST, unit/integration tests, coverage threshold
- **Health probes:** readiness/liveness, synthetic checks
- **Performance sanity:** smoke/performance baseline comparisons
- **Data migrations:** order, idempotency, backfill plan

---

## 3. Release Schedule
- **Staging window:** day/time, duration
- **Production window:** day/time, duration
- **Change management ticket / CAB reference:**

---

## 4. Post-Deployment Tasks
- **Monitoring:** dashboards/alerts to watch (links)
- **Functional validation:** checklist or scripts
- **Runbook updates:** paths and owners
- **Changelog:** update location
- **Incident review:** if any anomalies (timebox + owner)

---

## 5. Appendix
- **Environment matrix:** instance sizes, autoscaling, regions, quotas
- **Infrastructure references:** IaC module paths (Terraform/Helm/Kustomize)
- **Links:** repo folder, catalog.csv row, integration blueprint, test plan

---

## (Optional) CI/CD Skeleton Example
```yaml
# Example: 03_Development/Templates/Pipeline_Template.yml
name: ci-cd
on:
  push:
    branches: [ main, release/* ]
jobs:
  # ...
```

---

## Revision History
| Version | Date       | Author                  | Changes         |
|---------|------------|-------------------------|-----------------|
| 1.0.0   | 2025-10-25 | Enterprise Architecture | Initial template|

## 0. Metadata
- **Artifact ID (catalog.csv):** TMP-DEP  
- **Version:** v1.0  
- **Owner:**  
- **Linked Ticket / PR:**  

## 2. Release Artifacts & Versioning
- **Artifact(s):** (image tags, packages, charts)
- **Registry/Storage:** (e.g., GHCR/ECR/ACR, Nexus/Artifactory)
- **Versioning scheme:** (SemVer, build number, git tag)
- **SBOM / provenance:** (how/where generated & stored)

-|----------------|-------------|-----------|-----------|
| Dev    |          |                |             |           |           |
| QA     |          |                |             |           |           |
| UAT    |          |                |             |           |           |
| Prod   |          |                |             |           |           |

> **Note:** define pre-checks (migrations ready, feature flags default state, maintenance page toggle, etc.)

## 5. Verification & Quality Gates
- **Automated checks:** lint, SAST/DAST, unit/integration tests, coverage threshold
- **Health probes:** readiness/liveness, synthetic checks
- **Performance sanity:** smoke/performance baseline comparisons
- **Data migrations:** order, idempotency, backfill plan

## 7. Release Schedule
- **Staging window:** day/time, duration  
- **Production window:** day/time, duration  
- **Change management ticket / CAB reference:**  

## 9. Post-Deployment Tasks
- **Monitoring:** dashboards/alerts to watch (links)  
- **Functional validation:** checklist or scripts  
- **Runbook updates:** paths and owners  
- **Changelog:** update location  
- **Incident review:** if any anomalies (timebox + owner)

## 11. Appendix
- **Environment matrix:** instance sizes, autoscaling, regions, quotas  
- **Infrastructure references:** IaC module paths (Terraform/Helm/Kustomize)  
- **Links:** repo folder, catalog.csv row, integration blueprint, test plan  

---

### (Optional) CI/CD Skeleton Example
```yaml
# Example: 03_Development/Templates/Pipeline_Template.yml
name: ci-cd
on:
  push:
    branches: [ main, release/* ]
jobs:
  build_test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "lint/test/build here"

  deploy_prod:
    if: startsWith(github.ref, 'refs/heads/release/')
    needs: [ build_test ]
    runs-on: ubuntu-latest
    steps:
      - run: echo "deploy to prod with verification + rollback hooks"

## Metadata
---
Artifact_ID: TMP-00-Deployment_Plan_Temp
Artifact_Name: Deployment Plan Template
Artifact_Type: TMP
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: Deployment Plan Template
File_Path: 00_Policy/Templates/03_Development/Deployment_Plan_Template.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Development/Deployment_Plan_Template.md
Last_Updated: 2025-10-25
Owner: Enterprise Architecture Office (EAO)
Phase: Policy
Process_Group: Policy
Process_Step: N/A
Project_Name: 
Status: Draft
Template_Source: ELA-Template
Validation_Status: Pending
Version: v1.0
---
# Deployment Plan Template

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

-----|----------|----------------|-------------|-----------|-----------|
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

# Deployment Plan Template

## 0. Metadata
- **Artifact ID (catalog.csv):** TMP-DEP  
- **Version:** v1.0  
- **Owner:**  
- **Linked Ticket / PR:**  

---

## 1. Pipeline Overview
- **Trigger branches:** (e.g., `main`, `release/*`, `hotfix/*`)
- **Environments & promotion order:** Dev → QA → UAT → Prod
- **Release cadence:** (e.g., weekly, on-demand, hotfix policy)
- **Change freeze windows:** (dates/time windows, if any)

---

## 2. Release Artifacts & Versioning
- **Artifact(s):** (image tags, packages, charts)
- **Registry/Storage:** (e.g., GHCR/ECR/ACR, Nexus/Artifactory)
- **Versioning scheme:** (SemVer, build number, git tag)
- **SBOM / provenance:** (how/where generated & stored)

---

## 3. Stage Details
| Stage | Purpose | Commands/Tools | Pre-checks | Approvers | Rollback |
|--------|----------|----------------|-------------|-----------|-----------|
| Dev    |          |                |             |           |           |
| QA     |          |                |             |           |           |
| UAT    |          |                |             |           |           |
| Prod   |          |                |             |           |           |

> **Note:** define pre-checks (migrations ready, feature flags default state, maintenance page toggle, etc.)

---

## 4. Configuration & Secrets
- **Config source:** (env files, ConfigMap, parameter store, feature flags)
- **Secrets source:** (Vault/KeyVault/Secret Manager; never commit secrets)
- **Rotation policy:** (how/when secrets rotate)
- **Runtime toggles:** (flags, kill-switches, dark launch)

---

## 5. Verification & Quality Gates
- **Automated checks:** lint, SAST/DAST, unit/integration tests, coverage threshold
- **Health probes:** readiness/liveness, synthetic checks
- **Performance sanity:** smoke/performance baseline comparisons
- **Data migrations:** order, idempotency, backfill plan

---

## 6. Rollback / Backout Plan
- **Mechanism:** (blue/green, canary, recreate, Helm rollback, DB restore point)
- **RPO/RTO targets:**  
- **Conditions to trigger rollback:**  
- **Steps:** numbered, exact commands
- **Post-rollback validation:** (what to check)

---

## 7. Release Schedule
- **Staging window:** day/time, duration  
- **Production window:** day/time, duration  
- **Change management ticket / CAB reference:**  

---

## 8. Communication Plan
- **Stakeholders:** names/roles (PO, Dev Lead, SRE, Security, Support)  
- **Channels:** Teams channel(s), email DLs, status page  
- **Templates:** pre-release notice, in-flight updates, completion/incident notes

---

## 9. Post-Deployment Tasks
- **Monitoring:** dashboards/alerts to watch (links)  
- **Functional validation:** checklist or scripts  
- **Runbook updates:** paths and owners  
- **Changelog:** update location  
- **Incident review:** if any anomalies (timebox + owner)

---

## 10. Compliance & Audit
- **Approvals captured in:** PR, change ticket, Signoff sheet  
- **Controls:** SoD, 4-eyes, artifact integrity (sigstore/cosign), access logs  
- **Retention:** logs/metrics/traces retention windows  

---

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

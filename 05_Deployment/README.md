# 05 - Deployment & CI/CD

Define and store automation assets that package, release, and monitor the application.

## Required Deliverables
- `ci_cd_pipeline.yml` - project-specific pipeline definition (link to shared templates).
- `deployment_logs/<timestamp>/` - output from staging/prod releases.
- `Release_Readiness_Checklist.md` - approvals and gating evidence.
- `Rollback_Steps.md` - recovery plan for failed releases.
- `Environment_Config/` - sanitized configuration references and secret locations.

## Templates & References
- `templates/documentation/Deployment/Release_Readiness_Checklist.md`
- `templates/documentation/Deployment/Rollback_Steps.md`
- `templates/documentation/Deployment/Deployment_Log.md`
- `templates/documentation/Deployment/Environment_Config.md`
- `.github/workflows/` - copy from `ci-cd-pipeline/sample-pipeline.yml`
- `templates/documentation/Execution/Deployment_Plan.md`
- `templates/documentation/Execution/Compliance_Checklist.md`

## Tips
- Keep pipelines in `.github/workflows/` or the designated DevOps system, but mirror documentation here.
- Use Git tags for each production deployment and reference them in the logs.
- Capture staging validation results and sign-offs alongside the deployment checklist.

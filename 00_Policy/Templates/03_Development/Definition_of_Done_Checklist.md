
# DEFINITION OF DONE (DoD) CHECKLIST

---
```yaml
Artifact_ID: VAL-00-Definition_of_Done_C
Artifact_Name: DEFINITION OF DONE (DoD) CHECKLIST
Artifact_Type: VAL
Version: v1.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Checklist template for Definition of Done (DoD) in ELA projects
File_Path: 00_Policy/Templates/03_Development/Definition_of_Done_Checklist.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Development/Definition_of_Done_Checklist.md
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
| Artifact ID       | VAL-00-Definition_of_Done_C                                               |
| Artifact Name     | DEFINITION OF DONE (DoD) CHECKLIST                                        |
| Artifact Type     | VAL                                                                       |
| Version           | v1.0                                                                      |
| Status            | Draft                                                                     |
| Owner             | Enterprise Architecture Office (EAO)                                      |
| Last Updated      | 2025-10-25                                                                |
| Description       | Checklist template for Definition of Done (DoD) in ELA projects           |
| File Path         | 00_Policy/Templates/03_Development/Definition_of_Done_Checklist.md         |
| GitHub URL        | https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Development/Definition_of_Done_Checklist.md |
| Phase             | Development                                                               |
| Dependencies      | None                                                                      |
| Process Group     | Development                                                               |
| Process Step      | N/A                                                                       |
| Template Source   | ELA-Template                                                              |
| Validation Status | Pending                                                                   |
| Comments          | Auto-generated on 2025-10-25                                              |

---

## How to Use This Template
- Use this checklist to define and verify the Definition of Done (DoD) for each phase of your ELA project.
- Customize for your project, sprint, or release as needed.
- All items must be checked and signed off before phase exit.

---

## Document Control

| Field               | Value                        |
|---------------------|-----------------------------|
| Project Name        | [Enter Project Name]         |
| Project ID          | [ELA-XXXX]                   |
| Document Version    | 1.0.0                        |
| Phase               | [Definition/Design/Dev/etc.] |
| Sprint/Iteration    | [If applicable]              |
| Reviewed By         | [Name]                       |
| Date                | [YYYY-MM-DD]                 |

---

## 1. DEFINITION PHASE - DEFINITION OF DONE

### Requirements
- [ ] Business requirements documented and approved by stakeholders
- [ ] Functional requirements (SRS) complete and reviewed
- [ ] Non-functional requirements (NFR) documented using template
- [ ] User stories created with acceptance criteria
- [ ] Requirements traceability matrix created
- [ ] Success metrics and KPIs defined

### Architecture & Design
- [ ] High-level architecture documented
- [ ] Technology stack approved
- [ ] Integration points identified
- [ ] Data model (conceptual) defined
- [ ] Security requirements identified
- [ ] ADRs (Architecture Decision Records) initiated

### Security & Compliance
- [ ] Security requirements documented
- [ ] Compliance requirements identified (GDPR, HIPAA, etc.)
- [ ] Threat model initiated
- [ ] Data classification completed

### Approval & Sign-off
- [ ] Requirements review conducted with stakeholders
- [ ] Architecture review approved by Enterprise Architect
- [ ] Phase sign-off obtained from sponsor/CTO
- [ ] Risk register created and reviewed

**Phase Exit Criteria:** All checklist items completed and signed off.

---

## 2. DEVELOPMENT/CODING PHASE - DEFINITION OF DONE

### Code Quality
- [ ] Code written following coding standards
- [ ] Code reviewed by at least one peer
- [ ] Unit tests written with ≥80% code coverage
- [ ] Code complexity within acceptable limits (cyclomatic < 15)
- [ ] No critical/high severity code quality issues (SonarQube or equivalent)
- [ ] Linting rules passed

### Documentation
- [ ] Technical documentation updated (API, architecture, etc.)
- [ ] Inline code comments for complex logic
- [ ] README and usage instructions updated

### Testing
- [ ] All tests pass in CI pipeline
- [ ] Integration tests for major flows
- [ ] Regression tests for bug fixes

### Security & Compliance
- [ ] Static analysis for security vulnerabilities
- [ ] Sensitive data handling reviewed
- [ ] Compliance checks (as required)

### Deployment Readiness
- [ ] Deployment scripts/configuration updated
- [ ] Rollback plan documented
- [ ] Monitoring/alerting configured

### Approval & Sign-off
- [ ] Code review approved by lead
- [ ] QA sign-off
- [ ] Product Owner/Stakeholder sign-off

**Phase Exit Criteria:** All checklist items completed and signed off.

---

## 3. TESTING/DEPLOYMENT PHASE - DEFINITION OF DONE

### Testing
- [ ] All test cases executed and passed
- [ ] User acceptance testing (UAT) completed
- [ ] Performance/load testing completed
- [ ] Security testing completed

### Deployment
- [ ] Deployment to production environment successful
- [ ] Rollback tested
- [ ] Monitoring/alerting validated

### Documentation
- [ ] Release notes published
- [ ] Support documentation updated

### Approval & Sign-off
- [ ] Final sign-off from all stakeholders

**Phase Exit Criteria:** All checklist items completed and signed off.

---

## Revision History
| Version | Date       | Author                  | Changes         |
|---------|------------|-------------------------|-----------------|
| 1.0.0   | 2025-10-25 | Enterprise Architecture | Initial template|

## Document Control

| Field | Value |
|-------|-------|
| **Project Name** | [Enter Project Name] |
| **Project ID** | [ELA-XXXX] |
| **Document Version** | 1.0.0 |
| **Phase** | [Select: Definition / Design / Development / Testing / Deployment] |
| **Sprint/Iteration** | [If applicable] |
| **Reviewed By** | [Name] |
| **Date** | [YYYY-MM-DD] |

## 1. DEFINITION PHASE - DEFINITION OF DONE

### Requirements
- [ ] **Business requirements** documented and approved by stakeholders
- [ ] **Functional requirements (SRS)** complete and reviewed
- [ ] **Non-functional requirements (NFR)** documented using template
- [ ] **User stories** created with acceptance criteria
- [ ] **Requirements traceability matrix** created
- [ ] **Success metrics** and KPIs defined

### Architecture & Design
- [ ] **High-level architecture** documented
- [ ] **Technology stack** approved
- [ ] **Integration points** identified
- [ ] **Data model** (conceptual) defined
- [ ] **Security requirements** identified
- [ ] **ADRs (Architecture Decision Records)** initiated

### Security & Compliance
- [ ] **Security requirements** documented
- [ ] **Compliance requirements** identified (GDPR, HIPAA, etc.)
- [ ] **Threat model** initiated
- [ ] **Data classification** completed

### Approval & Sign-off
- [ ] **Requirements review** conducted with stakeholders
- [ ] **Architecture review** approved by Enterprise Architect
- [ ] **Phase sign-off** obtained from sponsor/CTO
- [ ] **Risk register** created and reviewed

**Phase Exit Criteria:** All checklist items completed and signed off.

## 3. DEVELOPMENT/CODING PHASE - DEFINITION OF DONE

### Code Quality
- [ ] **Code written** following coding standards
- [ ] **Code reviewed** by at least one peer
- [ ] **Unit tests written** with ≥80% code coverage
- [ ] **Code complexity** within acceptable limits (cyclomatic < 15)
- [ ] **No critical/high severity** code quality issues (SonarQube)
- [ ] **Linting rules** passed

### Functionality
- [ ] **All acceptance criteria** met for user story/feature
- [ ] **Feature working** as per requirements
- [ ] **Edge cases** handled
- [ ] **Error handling** implemented
- [ ] **Logging** implemented

### Testing
- [ ] **Unit tests** passing (100%)
- [ ] **Integration tests** written and passing
- [ ] **Code coverage** target met (≥80%)
- [ ] **Manual testing** completed by developer
- [ ] **No known defects** (or documented/deferred)

### Security
- [ ] **Security scanning** passed (SAST)
- [ ] **No hardcoded secrets** or credentials
- [ ] **Dependency vulnerabilities** resolved or accepted
- [ ] **Input validation** implemented
- [ ] **OWASP Top 10** considerations addressed

### Documentation
- [ ] **Code comments** added where necessary
- [ ] **API documentation** updated
- [ ] **README** updated (if applicable)
- [ ] **Configuration changes** documented
- [ ] **Database migration scripts** documented

### Version Control
- [ ] **Code committed** to feature branch
- [ ] **Commit messages** clear and descriptive
- [ ] **Pull request** created with description
- [ ] **Branch up-to-date** with develop/main
- [ ] **Conflicts resolved**

### CI/CD
- [ ] **Build pipeline** passing
- [ ] **All automated tests** passing in CI
- [ ] **Code quality gates** passed
- [ ] **Security scans** passed
- [ ] **Artifacts** generated successfully

### Approval
- [ ] **Code review** approved
- [ ] **QA sign-off** (if applicable)
- [ ] **PR merged** to develop branch

**Phase Exit Criteria:** Code complete, tested, reviewed, and merged.

## 5. DEPLOYMENT PHASE - DEFINITION OF DONE

### Pre-Deployment
- [ ] **Deployment plan** reviewed and approved
- [ ] **Rollback plan** prepared and tested
- [ ] **Deployment checklist** completed
- [ ] **Stakeholders notified** of deployment schedule
- [ ] **Maintenance window** scheduled (if required)
- [ ] **Backups completed** (database, configurations)

### Deployment Execution
- [ ] **Application deployed** to production
- [ ] **Database migrations** executed successfully
- [ ] **Configuration updated** in production
- [ ] **Environment variables** configured
- [ ] **Secrets/keys** configured securely

### Post-Deployment Verification
- [ ] **Smoke tests** passed in production
- [ ] **Health checks** passing
- [ ] **Application accessible** to users
- [ ] **Integrations working** correctly
- [ ] **Performance metrics** within acceptable range
- [ ] **No critical errors** in logs

### Monitoring & Observability
- [ ] **Monitoring dashboards** configured
- [ ] **Alerts** configured and tested
- [ ] **Log aggregation** working
- [ ] **Distributed tracing** enabled
- [ ] **APM** configured

### Documentation
- [ ] **Deployment documented** (date, version, changes)
- [ ] **Release notes** published
- [ ] **Runbooks** updated
- [ ] **User documentation** published
- [ ] **Training materials** available (if needed)

### Communication
- [ ] **Stakeholders notified** of successful deployment
- [ ] **Support team** briefed
- [ ] **Users notified** of new features/changes

### Operational Readiness
- [ ] **Support model** in place
- [ ] **Incident response** procedures ready
- [ ] **Escalation paths** defined
- [ ] **On-call rotation** scheduled (if applicable)

### Approval & Sign-off
- [ ] **Deployment sign-off** obtained from operations
- [ ] **Production validation** completed
- [ ] **Go-live approval** obtained from sponsor

**Phase Exit Criteria:** Application deployed, verified, and operational in production.

## 7. USER STORY / FEATURE - DEFINITION OF DONE

*Use this for Sprint/Iteration completion:*

- [ ] **Acceptance criteria** met
- [ ] **Code complete** and peer-reviewed
- [ ] **Unit tests** written (≥80% coverage)
- [ ] **Integration tests** passing
- [ ] **Functional testing** completed by QA
- [ ] **No critical/high defects**
- [ ] **Security scan** passed
- [ ] **Documentation** updated
- [ ] **Demo-ready**
- [ ] **Deployed to test/staging** environment
- [ ] **Product Owner acceptance**

## COMPLIANCE & STANDARDS CHECKLIST

### Industry Standards (Integrated)
- [ ] **ISO 12207** (Software Lifecycle) processes followed
- [ ] **ISO 25010** (Software Quality) attributes met
- [ ] **IEEE 829** (Test Documentation) standards applied
- [ ] **OWASP** security guidelines followed
- [ ] **GDPR/HIPAA** compliance verified (if applicable)

### ELA Policy Compliance
- [ ] **ELA Development Policy** requirements met
- [ ] **Systems Integration Blueprint** followed
- [ ] **Coding standards** adhered to
- [ ] **Documentation standards** met
- [ ] **Change management** process followed

------|------|------|--------|
| Definition | Product Owner | | | [ ] Approved |
| Design | Solution Architect | | | [ ] Approved |
| Development | Tech Lead | | | [ ] Approved |
| Testing | QA Lead | | | [ ] Approved |
| Deployment | Operations Lead | | | [ ] Approved |

## REVISION HISTORY

| Version | Date | Author | Changes |
|---------|------|--------|----------|
| 1.0.0 | 2025-10-23 | Enterprise Architecture | Initial template |

---

**Template Version:** 1.0.0  
**Maintained By:** Enterprise Architecture Office & PMO  
**Last Updated:** 2025-10-23

**Remember:** Definition of Done is a quality gate. Do not compromise on these criteria.

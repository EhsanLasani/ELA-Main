# DEFINITION OF DONE (DoD) CHECKLIST

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

---

## PURPOSE

This checklist defines the "Definition of Done" criteria for each SDLC phase in ELA projects. All criteria must be met before work can be considered complete and before moving to the next phase.

**Key Principle:** Work is not done until ALL applicable criteria are satisfied.

---

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

---

## 2. DESIGN PHASE - DEFINITION OF DONE

### Detailed Design
- [ ] **Detailed architecture** documented (component/service diagrams)
- [ ] **Database schema** designed and reviewed
- [ ] **API specifications** defined (OpenAPI/Swagger)
- [ ] **UX/UI designs** completed and approved
- [ ] **Wireframes/mockups** finalized
- [ ] **Integration flows** documented

### Technical Specifications
- [ ] **Technical design document** completed
- [ ] **Interface definitions** documented
- [ ] **Error handling strategy** defined
- [ ] **Logging and monitoring** approach defined
- [ ] **Performance targets** specified

### Security Design
- [ ] **Threat model** completed and reviewed
- [ ] **Security controls** identified for each threat
- [ ] **Authentication/authorization** design completed
- [ ] **Data encryption** strategy defined
- [ ] **Security review** conducted

### Infrastructure & DevOps
- [ ] **Infrastructure architecture** defined (IaC templates)
- [ ] **CI/CD pipeline** design completed
- [ ] **Environment strategy** defined (dev/test/staging/prod)
- [ ] **Deployment strategy** documented
- [ ] **Rollback procedures** defined

### Testing Strategy
- [ ] **Test plan** created
- [ ] **Test cases** derived from requirements
- [ ] **Test data strategy** defined
- [ ] **Performance test scenarios** defined

### Approval & Sign-off
- [ ] **Design review** conducted
- [ ] **Security design** approved by Security team
- [ ] **Architecture compliance** verified
- [ ] **Phase sign-off** obtained

**Phase Exit Criteria:** Design complete, reviewed, and approved.

---

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

---

## 4. TESTING PHASE - DEFINITION OF DONE

### Test Execution
- [ ] **All test cases** executed
- [ ] **Integration testing** completed
- [ ] **System testing** completed
- [ ] **UAT (User Acceptance Testing)** completed
- [ ] **Performance testing** completed
- [ ] **Security testing** completed
- [ ] **Accessibility testing** completed (WCAG 2.1)

### Defect Management
- [ ] **All critical/high defects** resolved
- [ ] **Medium defects** resolved or deferred with approval
- [ ] **Low defects** documented
- [ ] **Regression testing** completed after fixes
- [ ] **No open blockers**

### Non-Functional Testing
- [ ] **Performance targets** met (response time, throughput)
- [ ] **Load testing** completed
- [ ] **Stress testing** completed
- [ ] **Security penetration testing** completed (if required)
- [ ] **Compatibility testing** completed (browsers, devices)

### Test Evidence
- [ ] **Test results** documented
- [ ] **Test coverage** report generated
- [ ] **Defect reports** finalized
- [ ] **Test summary report** created
- [ ] **Screenshots/videos** captured (if applicable)

### Documentation
- [ ] **Test plan** updated with results
- [ ] **Known issues** documented
- [ ] **User documentation** reviewed
- [ ] **Release notes** drafted

### Approval & Sign-off
- [ ] **QA sign-off** obtained
- [ ] **UAT sign-off** obtained from business stakeholders
- [ ] **Security testing** sign-off obtained
- [ ] **Go/No-Go decision** made

**Phase Exit Criteria:** All testing complete, defects resolved, sign-offs obtained.

---

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

---

## 6. OPERATIONS & MONITORING - DEFINITION OF DONE

### Continuous Monitoring (Ongoing)
- [ ] **Uptime SLA** met
- [ ] **Performance metrics** within targets
- [ ] **Error rates** acceptable
- [ ] **No critical incidents** unresolved
- [ ] **Security events** monitored and addressed

### Incident Management
- [ ] **Incidents logged** and tracked
- [ ] **Root cause analysis** completed for critical incidents
- [ ] **Post-incident reviews** conducted
- [ ] **Preventive actions** implemented

### Maintenance & Support
- [ ] **Regular backups** verified
- [ ] **Disaster recovery** tested periodically
- [ ] **Security patches** applied
- [ ] **Dependencies updated** (no critical vulnerabilities)
- [ ] **Technical debt** tracked and addressed

---

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

---

## 8. SPRINT/ITERATION - DEFINITION OF DONE

- [ ] **All user stories** meet their DoD
- [ ] **Sprint goals** achieved
- [ ] **Code merged** to develop branch
- [ ] **All tests** passing in CI/CD
- [ ] **Sprint demo** completed
- [ ] **Sprint retrospective** conducted
- [ ] **No technical debt** added (or documented)
- [ ] **Product backlog** updated
- [ ] **Next sprint planned**

---

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

---

## APPROVALS

| Phase | Approver Role | Name | Date | Status |
|-------|---------------|------|------|--------|
| Definition | Product Owner | | | [ ] Approved |
| Design | Solution Architect | | | [ ] Approved |
| Development | Tech Lead | | | [ ] Approved |
| Testing | QA Lead | | | [ ] Approved |
| Deployment | Operations Lead | | | [ ] Approved |

---

## NOTES

[Document any exceptions, deviations, or additional notes]

---

## REVISION HISTORY

| Version | Date | Author | Changes |
|---------|------|--------|----------|
| 1.0.0 | 2025-10-23 | Enterprise Architecture | Initial template |

---

**Template Version:** 1.0.0  
**Maintained By:** Enterprise Architecture Office & PMO  
**Last Updated:** 2025-10-23

**Remember:** Definition of Done is a quality gate. Do not compromise on these criteria.

# QUALITY GATES CHECKLIST

## Document Control
| Field | Value |
|-------|-------|
| **Project** | [Name] |
| **Sprint/Release** | [Number] |
| **QA Lead** | [Name] |
| **Date** | [YYYY-MM-DD] |

---

## GATE 1: CODE QUALITY
- [ ] Code coverage ≥80%
- [ ] No critical SonarQube issues
- [ ] No high security vulnerabilities
- [ ] Code review completed
- [ ] Coding standards followed
- [ ] Unit tests passing (100%)
- [ ] Documentation updated

**Status:** [ ] Pass [ ] Fail
**Blocker Issues:** [List any blockers]

---

## GATE 2: BUILD & INTEGRATION
- [ ] Build pipeline successful
- [ ] All dependencies resolved
- [ ] Integration tests passing
- [ ] No build warnings
- [ ] Artifacts generated
- [ ] Deployment scripts validated

**Status:** [ ] Pass [ ] Fail
**Blocker Issues:** [List any blockers]

---

## GATE 3: FUNCTIONAL TESTING
- [ ] All test cases executed
- [ ] Pass rate ≥95%
- [ ] Critical scenarios validated
- [ ] Regression testing completed
- [ ] Edge cases tested
- [ ] Error handling verified

**Status:** [ ] Pass [ ] Fail
**Blocker Issues:** [List any blockers]

---

## GATE 4: NON-FUNCTIONAL REQUIREMENTS
- [ ] Performance targets met
- [ ] Security scan passed
- [ ] Accessibility compliance (WCAG 2.1 AA)
- [ ] Browser compatibility verified
- [ ] Load testing completed
- [ ] Usability testing passed

**Status:** [ ] Pass [ ] Fail
**Blocker Issues:** [List any blockers]

---

## GATE 5: USER ACCEPTANCE
- [ ] UAT scenarios executed
- [ ] Business stakeholder sign-off
- [ ] User feedback incorporated
- [ ] Training materials prepared
- [ ] Support documentation ready

**Status:** [ ] Pass [ ] Fail
**Blocker Issues:** [List any blockers]

---

## GATE 6: PRODUCTION READINESS
- [ ] Infrastructure provisioned
- [ ] Monitoring configured
- [ ] Alerts set up
- [ ] Backup procedures tested
- [ ] Rollback plan verified
- [ ] Support runbook prepared
- [ ] Go-live checklist completed

**Status:** [ ] Pass [ ] Fail
**Blocker Issues:** [List any blockers]

---

## OVERALL QUALITY GATE STATUS

**Decision:** [ ] GO [ ] NO-GO

**Summary:**
- Gates Passed: __/6
- Critical Issues: [Count]
- Recommendation: [Go/No-Go with justification]

---

## APPROVALS
| Role | Name | Date | Status |
|------|------|------|--------|
| QA Lead | | | [ ] Approved |
| Tech Lead | | | [ ] Approved |
| Product Owner | | | [ ] Approved |
| Release Manager | | | [ ] Approved |

**Template Version:** 1.0.0

# Review Checklist

**Version:** 1.0  
**Last Updated:** Phase 2 (Week 3-4)  
**Purpose:** Quality checklist for reviewing requirements documents, PRs, and Definition phase deliverables

---

## Document Review Checklist

Use this checklist when reviewing requirements documents, design docs, and other Definition phase artifacts.

### General Quality
- [ ] Document follows the template structure
- [ ] All sections are complete (no [TBD] or empty sections)
- [ ] Version number and last updated date are current
- [ ] Change log is updated with recent modifications
- [ ] Document owner and reviewers are identified
- [ ] Links to related documents are valid and up-to-date

### Clarity and Completeness
- [ ] Purpose and scope are clearly defined
- [ ] Technical terms are defined or linked to Glossary.md
- [ ] Assumptions are explicitly stated
- [ ] Dependencies on other systems/components are identified
- [ ] Success criteria are measurable and specific

---

## Requirements Review Checklist

### Functional Requirements
- [ ] Each requirement has a unique ID
- [ ] Requirements are written in clear, unambiguous language
- [ ] User stories follow "As a/I want/So that" format
- [ ] Acceptance criteria use Given/When/Then format
- [ ] Priority is assigned (Must/Should/Could/Won't)
- [ ] Requirements are testable and verifiable
- [ ] Edge cases and error scenarios are addressed

### Non-Functional Requirements (NFRs)
- [ ] NFRs are specific and measurable (not "fast" but "< 200ms")
- [ ] SLIs (Service Level Indicators) are defined
- [ ] SLOs (Service Level Objectives) are realistic and documented
- [ ] Performance benchmarks are included
- [ ] Security requirements reference threat model findings
- [ ] Reliability targets (availability, RTO, RPO) are specified
- [ ] Observability requirements (logging, monitoring) are defined
- [ ] Test methods for each NFR are documented

### Traceability
- [ ] Requirements are linked to business objectives
- [ ] Traceability matrix links requirements to design/test/risks
- [ ] High-priority risks have corresponding mitigations
- [ ] Security threats identified in threat model are addressed

---

## Security Review Checklist

### Threat Modeling
- [ ] Threat model has been conducted for this component/feature
- [ ] Data flow diagram (DFD) is current and accurate
- [ ] Trust boundaries are clearly marked
- [ ] All STRIDE categories have been evaluated
- [ ] Threats are rated by impact and likelihood
- [ ] High-priority threats have documented mitigations
- [ ] Mitigation owners and timelines are assigned

### Security Controls
- [ ] Authentication mechanism is specified
- [ ] Authorization model (RBAC, ABAC) is defined
- [ ] Sensitive data is encrypted at rest and in transit
- [ ] Input validation and sanitization are required
- [ ] Logging includes security-relevant events (login, access, changes)
- [ ] Error handling doesn't expose sensitive information
- [ ] Rate limiting is implemented for public endpoints

### Compliance
- [ ] Regulatory requirements (GDPR, SOC 2, etc.) are identified
- [ ] PII handling procedures are documented
- [ ] Data retention policies are specified
- [ ] Compliance requirements are mapped to controls

---

## Code/PR Review Checklist

### Code Quality
- [ ] Code follows project style guide
- [ ] Functions/methods are small and focused
- [ ] Variable and function names are descriptive
- [ ] Comments explain "why" not "what"
- [ ] No commented-out code blocks
- [ ] No hardcoded secrets or credentials
- [ ] Error handling is comprehensive

### Testing
- [ ] Unit tests are included for new code
- [ ] Test coverage meets project standards (e.g., >80%)
- [ ] Edge cases and error paths are tested
- [ ] Integration tests are added for new features
- [ ] Tests are maintainable and readable

### Security
- [ ] No SQL injection vulnerabilities
- [ ] Input validation is performed
- [ ] Authentication/authorization checks are present
- [ ] Sensitive data is not logged
- [ ] Dependencies are up-to-date and secure
- [ ] SAST/DAST scans pass (if available)

### Performance
- [ ] No obvious performance bottlenecks (N+1 queries, etc.)
- [ ] Database queries are optimized with indexes
- [ ] Caching is used appropriately
- [ ] Resource cleanup (connections, files) is handled

---

## Definition Phase Sign-off Checklist

Before moving to the Design phase, ensure:

### Documentation Complete
- [ ] Requirements document is complete and approved
- [ ] Threat model is documented with mitigations assigned
- [ ] NFR guidelines have been followed
- [ ] All templates are filled out completely
- [ ] Supporting documents (glossary, diagrams) are ready

### Stakeholder Approval
- [ ] Product owner has approved functional requirements
- [ ] Technical lead has approved architecture approach
- [ ] Security team has approved threat model and mitigations
- [ ] QA lead has approved test strategy
- [ ] All P0 and P1 concerns are addressed

### Risks Managed
- [ ] All high and critical risks have mitigation plans
- [ ] Risk owners are assigned
- [ ] Risk acceptance is documented (if applicable)
- [ ] Dependencies are identified and tracked

### Readiness for Next Phase
- [ ] Design phase entry criteria are met
- [ ] Team has capacity and skills for implementation
- [ ] External dependencies are confirmed available
- [ ] Timelines and milestones are realistic

---

## How to Use This Checklist

1. **For Document Reviews:** Go through relevant section before approving any Definition phase document
2. **For PRs:** Use Code/PR section when reviewing code changes
3. **For Phase Gates:** Use Definition Phase Sign-off section before transitioning to Design
4. **Customize:** Adapt this checklist to your project's specific needs

---

## Review Process

### Recommended Review Workflow
1. Author completes document/code
2. Author performs self-review using this checklist
3. Peers review using this checklist
4. Address all comments and concerns
5. Final approval from designated reviewer(s)
6. Document approval in version history

### Severity Levels for Issues
- **Blocker:** Must be fixed before approval (security, compliance, major gaps)
- **Critical:** Should be fixed before approval (quality, completeness)
- **Major:** Should be addressed soon (improvements, clarifications)
- **Minor:** Nice to have (style, suggestions)

---

**Tips for Effective Reviews:**
- Focus on substance, not style (unless style affects clarity)
- Ask questions when something is unclear
- Suggest improvements, don't just identify problems
- Consider future maintainability
- Be respectful and constructive in feedback

---

**Next Steps:** After completing this checklist, document results in the requirements document or PR comments.

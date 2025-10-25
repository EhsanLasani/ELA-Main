## Metadata
---
Artifact_ID: VAL-01-Review_Checklist
Artifact_Name: Review Checklist
Artifact_Type: VAL
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: Review Checklist
File_Path: 01_Definition/Guidelines/Review_Checklist.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/01_Definition/Guidelines/Review_Checklist.md
Last_Updated: 2025-10-25
Owner: Enterprise Architecture Office (EAO)
Phase: Definition
Process_Group: Definition
Process_Step: N/A
Project_Name: 
Status: Draft
Template_Source: 
Validation_Status: Pending
Version: v1.0
---
## Metadata
## Metadata
# Review Checklist

**Version:** 1.0  
**Last Updated:** Phase 2 (Week 3-4)  
**Purpose:** Quality checklist for reviewing requirements documents, PRs, and Definition phase deliverables

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

## How to Use This Checklist

1. **For Document Reviews:** Go through relevant section before approving any Definition phase document
2. **For PRs:** Use Code/PR section when reviewing code changes
3. **For Phase Gates:** Use Definition Phase Sign-off section before transitioning to Design
4. **Customize:** Adapt this checklist to your project's specific needs

**Tips for Effective Reviews:**
- Focus on substance, not style (unless style affects clarity)
- Ask questions when something is unclear
- Suggest improvements, don't just identify problems
- Consider future maintainability
- Be respectful and constructive in feedback

---

**Next Steps:** After completing this checklist, document results in the requirements document or PR comments.

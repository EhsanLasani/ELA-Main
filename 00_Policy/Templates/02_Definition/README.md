# Definition Phase Templates

## Overview

This folder contains master templates for the **Definition Phase (01_Definition)** of the ELA-Main governance framework. The Definition phase establishes **WHAT** needs to be built by capturing requirements, stakeholder needs, risks, compliance obligations, and project scope before design and implementation begin.

---

## Purpose

The Definition Phase ensures:
- Clear business case and project scope
- Documented functional and non-functional requirements
- Identified stakeholders, risks, and dependencies
- Baseline architectural decisions and compliance obligations
- Test strategy and quality gates defined upfront

All Definition artifacts serve as the **source of truth** for downstream phases (Design, Development, Testing, Deployment, Operations, Change Management).

---

## Complete Template Index

### 1. Requirements & Scope

| Template | Purpose | When to Use | Key Outputs |
|----------|---------|-------------|-------------|
| **Requirements_Document_Template.md** | Capture high-level scope, features, constraints | Project initiation | Approved scope baseline |
| **Functional_Requirements_SRS_Template.md** | Formal Software Requirements Specification (SRS) per IEEE 830 | After initial scope approval | Traceable functional requirements |
| **NFR_Specification_Template.md** | Define non-functional requirements (performance, availability, security, scalability) | Early Definition phase | Measurable NFR targets that feed Design SLIs/SLOs |
| **Project_Plan_Template.md** | Document project timeline, milestones, resources, budget | Kickoff | Approved project plan |
| **Project_Kickoff_Checklist.md** | Verify project initiation readiness (governance, team, tools) | Pre-kickoff | Signed-off kickoff checklist |
| **Stakeholder_Register_Template.md** | Map stakeholders, roles, RACI, communication plan | Early Definition | Stakeholder matrix |

### 2. Risk, Compliance & Security

| Template | Purpose | When to Use | Key Outputs |
|----------|---------|-------------|-------------|
| **Risk_Assessment_Template.csv** | Log risks, severity, probability, mitigation | Throughout Definition | Initial risk register |
| **Compliance_Matrix_ISO_IEEE_OWASP.md** | Identify applicable standards (ISO, IEEE, OWASP) and controls | Early Definition | Compliance obligation matrix |
| **Security_Requirements_Template.md** | Define security controls, authentication, authorization, data protection | After scope definition | Security baseline |
| **Threat_Modeling_Template.md** | Conduct initial threat modeling (STRIDE, attack surface) | After architecture direction set | Threat model v1.0 |
| **Data_Classification_Template.md** | Classify data by sensitivity (Public, Internal, Confidential, Restricted) | When data handling requirements are known | Data classification matrix |
| **Data_Governance_Template.md** | Define data ownership, retention, lineage, lawful basis (GDPR/CCPA) | Early Definition | Data governance policy |

### 3. Architecture & Dependencies

| Template | Purpose | When to Use | Key Outputs |
|----------|---------|-------------|-------------|
| **Architecture_Decision_Record_Template.md** | Document high-level architectural decisions (ADRs) | When key technology/design choices are made | ADR log (refined in Design phase) |
| **Dependency_Assessment_Template.md** | Identify external systems, APIs, SLAs, integration points | After scope and architecture direction | Dependency map |

### 4. Quality & Test Planning

| Template | Purpose | When to Use | Key Outputs |
|----------|---------|-------------|-------------|
| **Test_Strategy_Template.md** | Define test scope, environments, entry/exit criteria, test levels | Late Definition phase | Approved test strategy (detailed plans in Testing phase) |

### 5. Architecture Subfolder

The **Architecture/** subfolder contains visual templates:
- Context diagrams
- Data flow diagrams
- Interface catalogs
- High-level component diagrams (Draw.io templates)

These support the Architecture_Decision_Record documents.

---

## Usage Guidelines

### For ELA-Main Framework Maintainers
1. **DO NOT edit these master templates directly** for project work
2. These are **reference templates** — projects copy them into their own `01_Definition/` folder
3. Update templates here only when:
   - Policy changes require template updates
   - New compliance standards are added
   - Lessons learned identify template improvements
4. Version all template changes and document in `06_Change_Management/changelog.md`

### For Project Teams
1. **Copy** templates from `00_Policy/Templates/02_Definition/` into your project's `01_Definition/` folder
2. **Customize** for your project context (replace placeholders, add sections as needed)
3. **Version control**: Include Project ID, version, date in document headers
4. **Approval workflow**: All Definition artifacts require PMO/EAO review before proceeding to Design phase
5. **Traceability**: Link downstream artifacts (Design docs, test cases, code) back to Definition requirements

---

## Definition Phase Validation Checklist

Before proceeding to **03_Design Phase**, verify:

### ✅ Scope & Requirements
- [ ] Business case documented and approved
- [ ] Project scope defined (Requirements_Document)
- [ ] Functional requirements complete and traceable (SRS)
- [ ] Non-functional requirements defined with measurable targets (NFR_Specification)
- [ ] Requirements reviewed and approved by stakeholders

### ✅ Governance & Stakeholders
- [ ] Project Plan approved (timeline, budget, resources)
- [ ] Stakeholder Register complete with RACI matrix
- [ ] Project Kickoff Checklist completed and signed off
- [ ] Governance structure established (PMO, EAO oversight)

### ✅ Risk & Compliance
- [ ] Initial risk assessment completed (Risk_Assessment)
- [ ] Mitigation strategies identified for high/critical risks
- [ ] Compliance obligations mapped (Compliance_Matrix)
- [ ] Security requirements baseline defined
- [ ] Threat modeling initial pass completed

### ✅ Data Governance
- [ ] Data classification completed
- [ ] Data governance policies defined (ownership, retention, lineage)
- [ ] Data protection requirements documented (encryption, access controls)

### ✅ Architecture & Dependencies
- [ ] High-level architectural direction documented (ADRs)
- [ ] External dependencies identified and assessed
- [ ] Integration points and SLAs documented
- [ ] Technology stack decisions justified

### ✅ Quality Planning
- [ ] Test Strategy approved (scope, environments, entry/exit criteria)
- [ ] Quality gates defined for each phase
- [ ] Acceptance criteria documented

### ✅ Traceability & Version Control
- [ ] All Definition documents version-controlled in Git
- [ ] Document approval recorded in 06_Change_Management/changelog.md
- [ ] Traceability matrix established (requirements → design → code → tests)

---

## Phase Cross-References

### Templates Consumed By Downstream Phases

Templates from this folder are referenced and utilized in the following phases:

#### → 03_Design Phase
- **Architecture_Decision_Record_Template.md** → Feeds architectural design decisions
- **NFR_Specification_Template.md** → Informs design of SLIs, SLOs, and observability requirements
- **Functional_Requirements_SRS_Template.md** → Guides API specifications and UX design standards
- **Dependency_Assessment_Template.md** → Informs integration architecture

#### → 04_Development Phase
- **Compliance_Matrix_ISO_IEEE_OWASP.md** → Enforces secure coding standards and compliance
- **Functional_Requirements_SRS_Template.md** → Guides implementation and technical documentation
- **Data_Governance_Template.md** → Shapes data handling in code

#### → 06_Testing Phase
- **Test_Strategy_Template.md** → Defines test scope and approach
- **NFR_Specification_Template.md** → Drives performance and security testing
- **Functional_Requirements_SRS_Template.md** → Basis for test case generation

#### → 09_Change_Management Phase
- **Project_Kickoff_Checklist.md** → Baseline for project initiation and governance
- **Risk_Assessment_Template.csv** → Feeds change risk analysis

### Key Integration Points

| Template | Primary Consumer Phase(s) | Purpose |
|----------|---------------------------|----------|
| Requirements_Document_Template.md | 03_Design, 04_Development, 06_Testing | Source of truth for WHAT needs to be built |
| Architecture_Decision_Record_Template.md | 03_Design | Records WHY decisions were made |
| Compliance_Matrix_ISO_IEEE_OWASP.md | 04_Development, 06_Testing | Ensures standards adherence |
| Test_Strategy_Template.md | 06_Testing | Defines HOW validation occurs |
| Dependency_Assessment_Template.md | 03_Design, 05_Systems_Integration | Maps external dependencies |

---
## Traceability & Governance

### Traceability Rules
1. **Forward Traceability**: All downstream artifacts must reference the Definition phase template they derive from
   - Design documents cite Requirements IDs
   - Code comments reference Functional Requirements
   - Test cases link to Requirements and NFRs

2. **Backward Traceability**: Every requirement must be validated by at least one test case

3. **Impact Analysis**: When Definition documents change:
   - Notify all dependent phase teams (Design, Development, Testing)
   - Update traceability matrix
   - Record change in 06_Change_Management/changelog.md

### Version Control
- All Definition templates must be version-controlled in Git
- Use semantic versioning: `v1.0.0` for initial approval, `v1.1.0` for minor updates, `v2.0.0` for major scope changes
- Tag approvals with Git tags: `definition-approval-v1.0`

### Change Control
- Changes to approved Definition artifacts require Change Request (CR)
- CR must be reviewed by PMO/EAO
- Impact assessment required for all changes
- Changes must be communicated to all stakeholders

---

## Standards Alignment

- **IEEE 830**: Software Requirements Specifications
- **PMBOK**: Project Management Body of Knowledge
- **BABOK**: Business Analysis Body of Knowledge
- **ISO 27001**: Information Security Management
- **OWASP**: Secure development practices

---

## Maintenance

- **Template Version**: 2.0.0
- **Last Updated**: 2025-10-24
- **Owner**: Enterprise Architecture Office (EAO)
- **Review Cycle**: Quarterly

---

## Related Documentation

- [ELA Policy and Procedure](../../ELA_Development_Policy.md)
- [Strategic Analysis Implementation Plan](../../Strategic_Analysis_Implementation_Plan.md)
- [01_Definition Phase Folder](../../../01_Definition/) — Project-level Definition guidance
- [Definition Phase Guidelines](../../Definition_Phase_Guidelines/)
- [Template Migration Instructions](../../Template_Migration_Instructions.md)

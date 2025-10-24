# Definition Phase Templates

## Overview
This folder contains master templates for the Definition Phase (01_Definition) of the ELA-Main governance framework.

## Purpose
The Definition Phase establishes **WHAT** needs to be built by capturing requirements, stakeholder needs, and project scope.

## Templates Included

### Requirements Templates
- Requirements_Document_Template.md
- Stakeholder_Register_Template.md  
- Risk_Assessment_Template.csv
- Project_Charter_Template.md

### Analysis Templates
- Business_Case_Template.md
- Feasibility_Study_Template.md
- Gap_Analysis_Template.md

## Usage
These are **master templates** - the single source of truth. 

### How to Use:
1. **DO NOT edit these master templates directly**
2. Reference these templates from `01_Definition/Guidelines/`
3. Copy templates to `01_Definition/Validation/` for actual project use
4. Follow instructions in `01_Definition/Guidelines/` for proper usage

## Template Principle
```
TEMPLATES (00_Policy/Templates) → GUIDELINES (Phase/Guidelines/) → VALIDATION (Phase/Validation/)
Master Copies → Usage Instructions → Filled Instances
```

## Standards Alignment
- IEEE 830: Software Requirements Specifications
- PMBOK: Project Management Body of Knowledge
- BABOK: Business Analysis Body of Knowledge

## Maintenance
- Template Version: 1.0.0
- Last Updated: 2025-10-24
- Owner: Enterprise Architecture Office

## Related Documentation
- [Strategic Analysis Implementation Plan](../Strategic_Analysis_Implementation_Plan.md)
- [01_Definition Phase Folder](../../01_Definition/)
- [Definition Phase Guidelines](../../01_Definition/Guidelines/)

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

### Usage Notes

1. **Traceability**: All downstream artifacts should reference the Definition phase template they derive from
2. **Version Control**: When updating Definition templates, notify teams working in dependent phases
3. **Validation**: Design and Development phases should validate against Definition phase acceptance criteria

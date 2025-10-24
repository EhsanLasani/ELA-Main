# Definition Phase - Process Overview & Template Assignment

## Purpose

This document defines the **Definition Phase workflow**, assigns templates from `00_Policy/Templates/02_Definition/`, and clarifies when/how each template is used. The Definition phase establishes **WHAT** needs to be built through requirements, stakeholder analysis, and compliance frameworks.

---

## Definition Phase Objectives

The Definition Phase establishes **WHAT** to build through:
- **Requirements Engineering**: Functional and non-functional requirements with traceability
- **Stakeholder Management**: Stakeholder identification, RACI matrices, engagement plans
- **Compliance Framework**: Regulatory requirements, data protection, audit controls
- **Risk Foundation**: Initial risk assessment, threat modeling using STRIDE
- **Business Context**: Business case, strategic alignment, success criteria
- **Data Governance**: Data classification, retention policies, quality standards

---

## Inputs from Previous Phase

| Input Artifact | Source Template (Initiation) | What It Provides |
|----------------|------------------------------|------------------|
| Strategic Analysis | Strategic_Analysis_Implementation_Plan.md | Business goals, strategic imperatives |
| Business Case | Business_Case_Template.md | Value proposition, ROI justification |
| Stakeholder List | Stakeholder_Analysis_Template.md | Initial stakeholder identification |
| Initial Scope | Project_Charter_Template.md | High-level project boundaries |
| Risk Register | Risk_Assessment.csv | Known risks and constraints |

---

## Definition Phase Process Overview (Recommended Sequence)

### **Phase 1: Stakeholder & Governance Setup**

#### Step 1.1: Stakeholder Identification & Analysis
**Template**: Stakeholder_Analysis_Template.md
- **Inputs**: Strategic plan, organizational charts, project charter
- **Activities**:
  - Identify all stakeholders (internal/external)
  - Assess power/interest/influence levels
  - Categorize by engagement strategy
  - Document communication preferences
- **Outputs**: Stakeholder matrix with engagement strategies
- **Owner**: Business Analyst / Product Owner
- **Approver**: Sponsor / Program Manager

#### Step 1.2: RACI Matrix Definition
**Template**: RACI_Matrix_Template.md
- **Inputs**: Stakeholder analysis, project structure
- **Activities**:
  - Define key decisions and deliverables
  - Assign Responsible, Accountable, Consulted, Informed roles
  - Validate with stakeholders
  - Establish escalation paths
- **Outputs**: RACI matrix for all major activities
- **Owner**: Project Manager
- **Approver**: Steering Committee

#### Step 1.3: Communication Plan
**Template**: Communication_Plan_Template.md
- **Inputs**: Stakeholder analysis, RACI matrix
- **Activities**:
  - Define communication channels and frequency
  - Establish status reporting cadence
  - Create stakeholder-specific messaging plans
  - Set up collaboration tools and governance
- **Outputs**: Communication plan with meeting schedules
- **Owner**: Project Manager / Scrum Master
- **Approver**: Sponsor

---

### **Phase 2: Requirements Engineering**

#### Step 2.1: Functional Requirements Specification
**Template**: Functional_Requirements_SRS_Template.md
- **Inputs**: Business case, user stories, strategic goals
- **Activities**:
  - Gather functional requirements through workshops
  - Document user stories with acceptance criteria
  - Define system behaviors and business rules
  - Establish requirements traceability matrix
- **Outputs**: Software Requirements Specification (SRS)
- **Owner**: Business Analyst / Product Owner
- **Approver**: Product Owner / Business Sponsor

#### Step 2.2: Non-Functional Requirements (NFRs)
**Template**: Non_Functional_Requirements_Template.md
- **Inputs**: SRS, architectural constraints, compliance needs
- **Activities**:
  - Define performance requirements (response time, throughput)
  - Specify scalability and availability targets
  - Document security and privacy requirements
  - Establish usability and accessibility standards
- **Outputs**: NFR document with measurable SLIs/SLOs
- **Owner**: Solution Architect / Technical Lead
- **Approver**: Enterprise Architecture Review Board (ARB)

#### Step 2.3: Use Case Documentation
**Template**: Use_Case_Template.md
- **Inputs**: Functional requirements, user journey maps
- **Activities**:
  - Document primary and alternative flows
  - Identify actors and their goals
  - Define preconditions and postconditions
  - Map use cases to requirements
- **Outputs**: Use case diagrams and descriptions
- **Owner**: Business Analyst
- **Approver**: Product Owner

#### Step 2.4: User Stories & Acceptance Criteria
**Template**: User_Story_Template.md
- **Inputs**: Functional requirements, use cases
- **Activities**:
  - Write user stories in "As a... I want... So that..." format
  - Define INVEST criteria (Independent, Negotiable, Valuable, Estimable, Small, Testable)
  - Create acceptance criteria using Given-When-Then format
  - Prioritize using MoSCoW or WSJF
- **Outputs**: Product backlog with prioritized stories
- **Owner**: Product Owner
- **Approver**: Product Owner / Stakeholders

---

### **Phase 3: Compliance & Governance**

#### Step 3.1: Compliance Matrix Definition
**Template**: Compliance_Matrix_ISO_ITAR_OWSAP_md.md
- **Inputs**: Regulatory landscape, industry standards, legal requirements
- **Activities**:
  - Identify applicable regulations (ISO 27001, GDPR, HIPAA, SOC2, ITAR, etc.)
  - Map compliance requirements to system capabilities
  - Define controls for each compliance domain
  - Document audit requirements and evidence collection
- **Outputs**: Compliance matrix with control mappings
- **Owner**: Compliance Officer / Security Architect
- **Approver**: Legal / Compliance Committee

#### Step 3.2: Data Classification & Protection
**Template**: Data_Classification_Template.md
- **Inputs**: Data inventory, regulatory requirements, business needs
- **Activities**:
  - Classify data by sensitivity (Public, Internal, Confidential, Restricted)
  - Define handling requirements for each classification
  - Establish retention and disposal policies
  - Document cross-border data transfer requirements
- **Outputs**: Data classification policy and procedures
- **Owner**: Data Protection Officer / Information Security
- **Approver**: Chief Information Security Officer (CISO)

#### Step 3.3: Security Requirements
**Template**: Security_Requirements_Template.md
- **Inputs**: Threat model, compliance requirements, NFRs
- **Activities**:
  - Define authentication and authorization requirements
  - Specify encryption standards (at rest, in transit)
  - Establish logging and monitoring requirements
  - Document security testing requirements
- **Outputs**: Security requirements specification
- **Owner**: Security Architect
- **Approver**: CISO / Security Review Board

---

### **Phase 4: Risk & Threat Analysis**

#### Step 4.1: Risk Assessment
**Template**: Risk_Assessment_Template.md
- **Inputs**: Project scope, stakeholder concerns, historical data
- **Activities**:
  - Identify risks across technical, business, and operational domains
  - Assess probability and impact using risk matrix
  - Define risk appetite and tolerance levels
  - Develop mitigation and contingency plans
- **Outputs**: Risk register with mitigation strategies
- **Owner**: Risk Manager / Project Manager
- **Approver**: Risk Committee / Steering Committee

#### Step 4.2: Threat Modeling (STRIDE)
**Template**: Threat_Modeling_Template.md
- **Inputs**: System context, data flows, trust boundaries
- **Activities**:
  - Create threat model using STRIDE methodology
    - Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege
  - Identify assets and attack vectors
  - Assess threat likelihood and impact
  - Define security controls and countermeasures
- **Outputs**: Threat model with mitigation controls
- **Owner**: Security Architect / AppSec Engineer
- **Approver**: CISO

---

### **Phase 5: Data & Integration Requirements**

#### Step 5.1: Data Requirements Specification
**Template**: Data_Requirements_Specification_Template.md
- **Inputs**: Functional requirements, business processes, compliance needs
- **Activities**:
  - Define data entities and attributes
  - Establish data quality requirements
  - Document data sources and ownership
  - Specify data transformation rules
- **Outputs**: Data requirements document
- **Owner**: Data Architect / Business Analyst
- **Approver**: Chief Data Officer (CDO)

#### Step 5.2: Interface Requirements
**Template**: Interface_Requirements_Specification_Template.md
- **Inputs**: System context, integration points, architectural constraints
- **Activities**:
  - Identify all system interfaces (APIs, file transfers, messaging)
  - Define interface protocols and data formats
  - Specify error handling and retry logic
  - Document interface SLAs and dependencies
- **Outputs**: Interface requirements specification
- **Owner**: Integration Architect / Technical Lead
- **Approver**: Enterprise Architect

---

### **Phase 6: Business Process & Change Management**

#### Step 6.1: Business Process Mapping
**Template**: Business_Process_Mapping_Template.md
- **Inputs**: Current state documentation, stakeholder interviews
- **Activities**:
  - Document as-is business processes (BPMN diagrams)
  - Identify pain points and inefficiencies
  - Design to-be processes with system integration
  - Perform gap analysis and impact assessment
- **Outputs**: Business process models (as-is and to-be)
- **Owner**: Business Process Analyst
- **Approver**: Business Unit Leaders

#### Step 6.2: Change Management Plan
**Template**: Change_Management_Plan_Template.md
- **Inputs**: Business process changes, stakeholder analysis, organizational culture
- **Activities**:
  - Assess change impact and readiness
  - Develop change strategy (Kotter, ADKAR, Prosci)
  - Plan communication and training activities
  - Define success metrics for adoption
- **Outputs**: Change management plan with training schedule
- **Owner**: Change Manager / Organizational Change Management (OCM) Lead
- **Approver**: Sponsor / HR Leadership

---

### **Phase 7: Validation & Sign-off**

#### Step 7.1: Requirements Traceability
**Template**: Requirements_Traceability_Matrix_Template.md
- **Inputs**: All requirements documents, design specifications (if available)
- **Activities**:
  - Create traceability matrix linking business needs → requirements → design → test cases
  - Ensure bidirectional traceability
  - Validate coverage and completeness
  - Identify orphaned or untraced requirements
- **Outputs**: Requirements Traceability Matrix (RTM)
- **Owner**: Business Analyst / QA Lead
- **Approver**: Product Owner

#### Step 7.2: Definition Phase Review
**Template**: Definition_Phase_Review_Checklist.md (from Validation folder)
- **Inputs**: All Definition phase deliverables
- **Activities**:
  - Conduct formal phase review with stakeholders
  - Validate completeness against phase exit criteria
  - Resolve open issues and risks
  - Obtain stakeholder sign-off
- **Outputs**: Phase review report with approvals
- **Owner**: Project Manager
- **Approver**: Steering Committee

#### Step 7.3: Phase Gate Sign-off
**Template**: Definition_Phase_Signoff_Sheet.md (from Validation folder)
- **Inputs**: Phase review results, deliverable checklist
- **Activities**:
  - Present deliverables to governance board
  - Confirm readiness to proceed to Design phase
  - Document approvals and conditions
  - Archive baseline documents
- **Outputs**: Signed phase gate approval
- **Owner**: Project Manager / Program Manager
- **Approver**: Sponsor / Governance Board

---

## Validation Checklist (Exit Criteria)

Before proceeding to Design Phase, verify:

### ✅ Requirements Completeness
- [ ] All functional requirements documented with acceptance criteria
- [ ] Non-functional requirements defined with measurable targets
- [ ] Requirements prioritized and approved by Product Owner
- [ ] Requirements Traceability Matrix established

### ✅ Stakeholder Alignment
- [ ] Stakeholder analysis complete with engagement strategies
- [ ] RACI matrix defined and validated
- [ ] Communication plan approved and activated
- [ ] Key stakeholder sign-offs obtained

### ✅ Compliance & Security
- [ ] Compliance matrix created for all applicable regulations
- [ ] Data classification policy defined
- [ ] Security requirements specified
- [ ] Threat model completed with mitigation plans

### ✅ Risk Management
- [ ] Risk register populated with mitigation strategies
- [ ] Critical risks escalated and accepted
- [ ] Risk response plans approved

### ✅ Business Alignment
- [ ] Business processes mapped (as-is and to-be)
- [ ] Change impact assessed
- [ ] Change management plan approved
- [ ] Training needs identified

### ✅ Traceability & Documentation
- [ ] All templates completed and baselined
- [ ] Requirements traceable to business goals
- [ ] Documentation stored in version control
- [ ] Phase gate approval obtained

---

## Approval Workflow

1. **Business Analyst/Product Owner**: Reviews requirements for completeness and accuracy
2. **Technical Review**: Architecture, security, and data teams validate technical feasibility
3. **Compliance Review**: Legal and compliance teams confirm regulatory alignment
4. **Steering Committee**: Final approval to proceed to Design Phase
5. **Sponsor**: Signs off on phase gate and releases budget for next phase

---

## Related Documentation

- [Master Templates](../../00_Policy/Templates/02_Definition/)
- [Design Phase Outputs](../../02_Design/Guidelines/)
- [Definition Phase Validation Checklists](../Validation/)
- [ELA Policy](../../00_Policy/ELA_Development_Policy.md)

---

## Version History

- **v1.0.0** (2025-10-24): Initial Definition Phase Process Overview
- **Owner**: Enterprise Architecture Office (EAO)
- **Review Cycle**: Quarterly

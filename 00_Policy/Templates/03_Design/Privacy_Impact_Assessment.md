---
Artifact_ID: TMP-DES-Privacy_Impact_Assessment
Artifact_Name: Privacy_Impact_Assessment
Artifact_Type: TMP
Version: v1.0.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Evaluates privacy implications of data processing in ELA systems.
File_Path: 00_Policy/Templates/03_Design/Privacy_Impact_Assessment.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Design/Privacy_Impact_Assessment.md
Phase: Design
Dependencies: None
Process_Group: Architecture and Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25 per ELA Metadata v1.0.0 Standards
---

# Privacy_Impact_Assessment

    ## 0. Metadata
    (See YAML header above)

    ## 1. Template Purpose
    Identify and mitigate privacy risks to comply with GDPR and related standards.

    ## 2. When to Use This Template
    Conduct for all systems processing personal or sensitive data.

    ## 3. Prerequisites
    Data_Classification_Template.md and DataFlow_Diagram_Template.md.

    ## 4. Instructions
    Assess data minimization, retention, and access controls.

    ## 5. Template Content Sections

### 5.1 PIA Checklist
| Data Type | PII | Purpose | Retention | Risk |
|------------|-----|----------|------------|------|
| Customer Email | Yes | Notifications | 1 year | Medium |


    ## 6. Validation
    Review by Data Protection Officer (DPO).

    ## 7. Related Templates
    - Security_Design_Template.md
- Data_Architecture_Template.md
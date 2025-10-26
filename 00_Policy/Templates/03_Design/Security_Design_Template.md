---
Artifact_ID: TMP-DES-Security_Design_Template
Artifact_Name: Security_Design_Template
Artifact_Type: TMP
Version: v1.0.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Specifies system security architecture, controls, and mitigations.
File_Path: 00_Policy/Templates/03_Design/Security_Design_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Design/Security_Design_Template.md
Phase: Design
Dependencies: None
Process_Group: Architecture and Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25 per ELA Metadata v1.0.0 Standards
---

# Security_Design_Template

    ## 0. Metadata
    (See YAML header above)

    ## 1. Template Purpose
    Translate threat model into enforceable security design elements.

    ## 2. When to Use This Template
    After threat modeling and before coding starts.

    ## 3. Prerequisites
    Threat_Model_Template.md and Architecture_Overview_Template.md.

    ## 4. Instructions
    Document authentication, authorization, encryption, and vulnerability management.

    ## 5. Template Content Sections

### 5.1 Key Security Components
- Identity: Azure AD / SSO
- Secrets: Key Vault
- Encryption: AES-256 at rest, TLS 1.2+ in transit


    ## 6. Validation
    Security review by CISO or delegate.

    ## 7. Related Templates
    - Threat_Model_Template.md
- Privacy_Impact_Assessment.md
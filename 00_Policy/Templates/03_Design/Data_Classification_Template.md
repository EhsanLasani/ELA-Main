---
Artifact_ID: TMP-DES-Data_Classification_Template
Artifact_Name: Data_Classification_Template
Artifact_Type: TMP
Version: v1.0.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Classifies datasets by sensitivity and applies handling rules.
File_Path: 00_Policy/Templates/03_Design/Data_Classification_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Design/Data_Classification_Template.md
Phase: Design
Dependencies: None
Process_Group: Architecture and Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25 per ELA Metadata v1.0.0 Standards
---

# Data_Classification_Template

    ## 0. Metadata
    (See YAML header above)

    ## 1. Template Purpose
    Ensure appropriate data controls are applied across all assets.

    ## 2. When to Use This Template
    During data design and prior to implementation.

    ## 3. Prerequisites
    Data_Architecture_Template.md.

    ## 4. Instructions
    Assign classification labels and define handling controls.

    ## 5. Template Content Sections

### 5.1 Classification Table
| Dataset | Classification | Controls |
|----------|----------------|-----------|
| Customer PII | Restricted | Encryption + Access Control |
| Logs | Internal | Redaction before export |


    ## 6. Validation
    Verify all datasets labeled per policy.

    ## 7. Related Templates
    - Data_Lineage_Template.md
- Privacy_Impact_Assessment.md
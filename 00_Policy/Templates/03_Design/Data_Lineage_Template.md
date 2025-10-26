---
Artifact_ID: TMP-DES-Data_Lineage_Template
Artifact_Name: Data_Lineage_Template
Artifact_Type: TMP
Version: v1.0.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Tracks origin and flow of data through systems for traceability.
File_Path: 00_Policy/Templates/03_Design/Data_Lineage_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Design/Data_Lineage_Template.md
Phase: Design
Dependencies: None
Process_Group: Architecture and Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25 per ELA Metadata v1.0.0 Standards
---

# Data_Lineage_Template

    ## 0. Metadata
    (See YAML header above)

    ## 1. Template Purpose
    Provide transparency and auditability of data transformations.

    ## 2. When to Use This Template
    During design of data pipelines and ETL processes.

    ## 3. Prerequisites
    Data_Architecture_Template.md.

    ## 4. Instructions
    Describe transformations, lineage diagrams, and ownership.

    ## 5. Template Content Sections
    ### 5.1 Example Lineage Map
Source → Transform → Sink
Tools: Purview, Collibra, Atlas.

    ## 6. Validation
    Data lineage reviewed for completeness by Governance Team.

    ## 7. Related Templates
    - Data_Classification_Template.md
- Monitoring_Design_Template.md
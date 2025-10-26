---
Artifact_ID: TMP-DES-Data_Architecture_Template
Artifact_Name: Data_Architecture_Template
Artifact_Type: TMP
Version: v1.0.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Defines logical and physical data structures, entities, and relationships.
File_Path: 00_Policy/Templates/03_Design/Data_Architecture_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Design/Data_Architecture_Template.md
Phase: Design
Dependencies: None
Process_Group: Architecture and Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25 per ELA Metadata v1.0.0 Standards
---

# Data_Architecture_Template

    ## 0. Metadata
    (See YAML header above)

    ## 1. Template Purpose
    Ensure consistent data design aligned with business needs.

    ## 2. When to Use This Template
    During detailed design before schema implementation.

    ## 3. Prerequisites
    ERD_Template.md and DataFlow_Diagram_Template.md.

    ## 4. Instructions
    Include ER diagrams, data ownership, and quality rules.

    ## 5. Template Content Sections

### 5.1 Logical Model
- Customer → Order → Payment relationships
- Data lake ingestion pipelines


    ## 6. Validation
    Reviewed by Data Architect and approved by EAO.

    ## 7. Related Templates
    - Data_Classification_Template.md
- Data_Lineage_Template.md
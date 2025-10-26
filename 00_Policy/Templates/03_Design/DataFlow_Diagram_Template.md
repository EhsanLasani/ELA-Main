---
Artifact_ID: TMP-DES-DataFlow_Diagram_Template
Artifact_Name: DataFlow_Diagram_Template
Artifact_Type: TMP
Version: v1.0.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Captures logical and physical data flows between systems, services, and databases.
File_Path: 00_Policy/Templates/03_Design/DataFlow_Diagram_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Design/DataFlow_Diagram_Template.md
Phase: Design
Dependencies: None
Process_Group: Architecture and Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25 per ELA Metadata v1.0.0 Standards
---

# DataFlow_Diagram_Template

    ## 0. Metadata
    (See YAML header above)

    ## 1. Template Purpose
    Model how data moves through the system to support integration and security design.

    ## 2. When to Use This Template
    Use during design workshops before development begins.

    ## 3. Prerequisites
    Architecture_Overview_Template.md and Requirements_Document.md.

    ## 4. Instructions
    Use Mermaid or Draw.io to visualize data movement across trust boundaries.

    ## 5. Template Content Sections

### 5.1 Example Data Flow Diagram
```mermaid
flowchart LR
  User --> FE[Frontend]
  FE --> BE[Backend API]
  BE --> DB[(Database)]
  BE --> LOG[Logging Service]
```


    ## 6. Validation
    Ensure all data stores classified using Data_Classification_Template.md.

    ## 7. Related Templates
    - Architecture_Overview_Template.md
- Data_Architecture_Template.md
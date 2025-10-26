---
Artifact_ID: TMP-DES-Architecture_Diagram_Template
Artifact_Name: Architecture_Diagram_Template
Artifact_Type: TMP
Version: v1.0.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Provides reusable structure for architecture diagrams (C4 views).
File_Path: 00_Policy/Templates/03_Design/Architecture_Diagram_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Design/Architecture_Diagram_Template.md
Phase: Design
Dependencies: None
Process_Group: Architecture and Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25 per ELA Metadata v1.0.0 Standards
---

# Architecture_Diagram_Template

    ## 0. Metadata
    (See YAML header above)

    ## 1. Template Purpose
    Ensure consistent architectural visualization across ELAs.

    ## 2. When to Use This Template
    At all design and review checkpoints.

    ## 3. Prerequisites
    Architecture_Overview_Template.md.

    ## 4. Instructions
    Use C4 notation for system, container, component, and deployment diagrams.

    ## 5. Template Content Sections

### 5.1 Example C4 Container Diagram
```mermaid
graph LR
  User --> WebApp[Web Application]
  WebApp --> API[API Service]
  API --> DB[(Database)]
```


    ## 6. Validation
    Architecture diagrams reviewed and approved by EAO.

    ## 7. Related Templates
    - Architecture_Overview_Template.md
- Deployment_Topology_Template.md
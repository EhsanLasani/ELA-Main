---
Artifact_ID: TMP-DES-Sequence_Diagram_Template
Artifact_Name: Sequence_Diagram_Template
Artifact_Type: TMP
Version: v1.0.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Documents sequential system interactions to clarify integration and behavior.
File_Path: 00_Policy/Templates/03_Design/Sequence_Diagram_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Design/Sequence_Diagram_Template.md
Phase: Design
Dependencies: None
Process_Group: Architecture and Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25 per ELA Metadata v1.0.0 Standards
---

# Sequence_Diagram_Template

    ## 0. Metadata
    (See YAML header above)

    ## 1. Template Purpose
    Visualize time-ordered messages between components to verify logical flow.

    ## 2. When to Use This Template
    Used during solution design to confirm process integrity.

    ## 3. Prerequisites
    Architecture_Overview_Template.md.

    ## 4. Instructions
    Use Mermaid or PlantUML syntax for clarity; cover success and error paths.

    ## 5. Template Content Sections

### 5.1 Example Sequence Diagram
```mermaid
sequenceDiagram
  participant U as User
  participant F as Frontend
  participant B as Backend
  participant D as Database
  U->>F: Submit Request
  F->>B: API Call
  B->>D: Query Data
  D-->>B: Return Data
  B-->>F: Response
  F-->>U: Display Results
```


    ## 6. Validation
    Validate that sequence diagrams reflect all security and validation steps.

    ## 7. Related Templates
    - DataFlow_Diagram_Template.md
- Threat_Model_Template.md
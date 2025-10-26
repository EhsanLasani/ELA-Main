---
Artifact_ID: TMP-DES-AI_Context_Template
Artifact_Name: AI_Context_Template
Artifact_Type: TMP
Version: v1.0.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Defines AI prompt and Codex context configuration for IDE integration.
File_Path: 00_Policy/Templates/03_Design/AI_Context_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Design/AI_Context_Template.md
Phase: Design
Dependencies: None
Process_Group: Architecture and Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25 per ELA Metadata v1.0.0 Standards
---

# AI_Context_Template

    ## 0. Metadata
    (See YAML header above)

    ## 1. Template Purpose
    Ensure consistent AI-assisted development context across projects.

    ## 2. When to Use This Template
    At design stage when setting up IDE and Codex context.

    ## 3. Prerequisites
    Architecture_Overview_Template.md.

    ## 4. Instructions
    Define context sources and prompt directories.

    ## 5. Template Content Sections
    ### 5.1 Example Context YAML
```yaml
context_sources:
  - ../ELA-Main/architecture/
  - ./01_Definition/
  - ./03_Development/
```

    ## 6. Validation
    Validated through blueprint-guard CI job.

    ## 7. Related Templates
    - Systems_Integration_Blueprint.md
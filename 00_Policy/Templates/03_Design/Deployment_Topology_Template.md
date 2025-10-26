---
Artifact_ID: TMP-DES-Deployment_Topology_Template
Artifact_Name: Deployment_Topology_Template
Artifact_Type: TMP
Version: v1.0.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Defines runtime deployment topology including environments, nodes, and networking.
File_Path: 00_Policy/Templates/03_Design/Deployment_Topology_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Design/Deployment_Topology_Template.md
Phase: Design
Dependencies: None
Process_Group: Architecture and Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25 per ELA Metadata v1.0.0 Standards
---

# Deployment_Topology_Template

    ## 0. Metadata
    (See YAML header above)

    ## 1. Template Purpose
    Ensure environment design supports scalability, security, and maintainability.

    ## 2. When to Use This Template
    Before infrastructure provisioning and CI/CD setup.

    ## 3. Prerequisites
    Infrastructure_Design_Template.md.

    ## 4. Instructions
    Map all environments and their connectivity; describe scaling strategies.

    ## 5. Template Content Sections

### 5.1 Deployment Diagram
```mermaid
graph TD
  Internet --> WAF --> LB[Load Balancer] --> APP[Application Pods] --> DB[(Database)]
  APP --> OBS[Observability Stack]
```


    ## 6. Validation
    Confirm topology adheres to cloud security baselines.

    ## 7. Related Templates
    - Infrastructure_Design_Template.md
- Monitoring_Design_Template.md
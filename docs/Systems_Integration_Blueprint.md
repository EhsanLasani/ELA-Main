# Systems Integration Blueprint (ELA)

Date: 2025-10-21

This blueprint shows how **MS Teams (Private Channels)**, **GitHub (Main & Child repos)**, **IDE (VS Code with Codex)**, **CI/CD**, **Secrets**, **Cloud Environments**, **Monitoring**, and **Identity** interconnect for Enterprise-Level Application (ELA) delivery.

![Systems Integration Blueprint](Systems_Integration_Blueprint.png)

## Mermaid Diagram

```mermaid
flowchart LR
  subgraph Teams["Microsoft Teams (Private Channel)"]
    T1[Posts/Wiki]
    T2[SharePoint Files]
    T3[Notifications]
  end

  subgraph GitHub["GitHub (Main & Child Repos)"]
    G1[ELA-Main (templates/shared-libs)]
    G2[ELA-Project-*]
    G3[Actions/Environments]
  end

  subgraph IDE["IDE (VS Code)"]
    I1[Workspace]
    I2[Extensions (Lint/Tests)]
    I3[Git]
  end

  subgraph Codex["ChatGPT Codex"]
    C1[Prompt Templates]
    C2[Context Loader]
  end

  subgraph CICD["CI/CD Orchestrator"]
    CI1[Build]
    CI2[Test]
    CI3[Deploy]
  end

  subgraph Secrets["Secrets & Config"]
    S1[Key Vault/Secrets Manager]
  end

  subgraph Env["Cloud/On-Prem Environments"]
    E1[Dev]
    E2[Test]
    E3[Stage]
    E4[Prod]
  end

  subgraph Monitor["Monitoring & Analytics"]
    M1[App Insights/Logs]
    M2[Power BI]
  end

  IdP[Identity & Access (Entra ID/SSO)]

  I3 -->|push/PR| G2
  G2 -->|PR triggers| CICD
  CICD --> Env
  G1 --> C2
  I1 --> C2
  Secrets --> CICD
  Secrets --> I1
  CICD --> Teams
  G2 --> Teams
  Env --> Monitor
  CICD --> Monitor
  IdP --> Teams
  IdP --> IDE
  IdP --> GitHub
```

## Metadata
---
Artifact_ID: DOC-00-blueprint-generator
Artifact_Name: VS Code – Codex Blueprint Generator
Artifact_Type: DOC
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: VS Code – Codex Blueprint Generator
File_Path: .codex/blueprint-generator.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/.codex/blueprint-generator.md
Last_Updated: 2025-10-25
Owner: Enterprise Architecture Office (EAO)
Phase: Policy
Process_Group: Policy
Process_Step: N/A
Project_Name: 
Status: Draft
Template_Source: 
Validation_Status: Pending
Version: v1.0
---
# VS Code – Codex Blueprint Generator

Place this file at `.codex/blueprint-generator.md`. Use your Codex/ChatGPT extension to run it as a prompt for generating the **Systems Integration Blueprint** artifacts.

## Usage
1. Open Command Palette → "Codex: Run Prompt from File" → select `.codex/blueprint-generator.md`.
2. Fill the YAML block and run.
3. Outputs:
   - `Systems_Integration_Blueprint.md` (with Mermaid)
   - `Systems_Integration_Blueprint.png` (diagram)
   - CI bootstrap snippets (YAML)
   - Teams/GitHub setup snippets

## Inputs
```yaml
project:
  name: "<ELA Project Name>"
  id: "<Unique ID>"
  confidentiality: "Private"
  stakeholders: ["PM","Architect","Dev","QA","DevOps"]
  environments: ["Dev","Test","Stage","Prod"]
  cloud: "Azure|AWS|GCP|On-Prem"
  repo_main: "ELA-Main"
  repo_child: "<ELA-Project-*>"
integrations:
  teams_channel: "<MS Teams Private Channel Name>"
  github_org: "<GitHub Org>"
  ci_cd: "GitHub Actions|Azure DevOps"
  secrets: "Key Vault|Secrets Manager"
  identity: "Entra ID|SSO Provider"
monitoring:
  logging: "App Insights|CloudWatch|Stackdriver"
  analytics: "Power BI|QuickSight|Looker"
```

## Prompt
```
You are an expert enterprise architect. Using the YAML inputs, generate:
1) A Markdown 'Systems_Integration_Blueprint.md' describing components, flows, security, CI/CD, operations; include a Mermaid flowchart.
2) A PNG 'Systems_Integration_Blueprint.png' approximating the same nodes and flows.
3) Snippets:
   - GitHub: create repos, protect branches, add Actions secrets
   - CI: minimal workflow with build/test and environment gates
   - Teams: create Private channel and connect repo notifications
   - Secrets: example Key Vault references in CI
Keep vendor-neutral where possible. Commit outputs to repo.
```

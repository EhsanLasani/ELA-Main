## Metadata
---
Artifact_ID: DOC-00-README
Artifact_Name: 🏗️ ELA-Main
Artifact_Type: DOC
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: 🏗️ ELA-Main
File_Path: README.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/README.md
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
## Metadata
## Metadata
# 🏗️ ELA-Main  
### Enterprise-Level Application Development Framework (Main Repository)

**ELA-Main** is the **master governance and template repository** for all Enterprise-Level Application (ELA) projects.  
It defines the standardized structure, policies, automation pipelines, and AI-assisted development workflows used across the organization.

--

## New Project Quickstart

1. **Scaffold**
   - Local: `./Tools/Scripts/Initialize-ELAProject.ps1 -ProjectPath "." -ProjectName "<Name>"`
   - Or: Run GitHub Action **init-project** from the Actions tab.
2. **Create/Update Blueprint**
   - Edit `00_Policy/Systems_Integration_Blueprint.md` and add `00_Policy/Systems_Integration_Blueprint.png`.
3. **Commit & Open PR**
   - CI runs **blueprint-guard** and **validate-policy**.
4. **Fix Findings**
   - Address any missing artifacts/metadata.
5. **Merge & Tag**
   - Tag the release; archive docs per policy §16.4.

--
--
## 📘 Purpose

The purpose of **ELA-Main** is to:
- Provide a **single source of truth** for enterprise application standards.  
- Maintain reusable **architecture blueprints, CI/CD pipelines, and coding conventions**.  
- Enable AI-assisted development using **ChatGPT Codex** with consistent prompt templates.  
- Ensure full traceability, compliance, and change management for all software projects.  
- Integrate seamlessly with **Microsoft Teams**, **GitHub**, and **CI/CD** systems.

Each new ELA project is created as a **child repository** cloned or templated from ELA-Main.

---

## 🧩 Repository Structure

```plaintext
ELA-Main/
│
├── 01_Definition/               → Project purpose, requirements, architecture
├── 02_Execution/                → Infrastructure design, testing plans, QA procedures
├── 03_Coding/                   → Source code templates and standards
├── 04_Testing/                  → Automated test scripts and reports
├── 05_Deployment/               → CI/CD workflows, deployment guides
├── 06_Change_Management/        → Revision history, change logs
├── 07_Monitoring_Control/       → Metrics, performance tracking, dashboards
│
├── .codex/                      → ChatGPT Codex templates & prompt files
│   └── blueprint-generator.md
│
├── docs/
│   ├── policy/
│   │   ├── ELA_Development_Policy.docx
│   │   ├── ELA_Development_Policy.pdf
│   │   ├── ELA_Policy_Addendum_Blueprint.docx
│   │   └── ELA_Policy_Addendum_Blueprint.md
│   ├── Systems_Integration_Blueprint.md
│   └── Systems_Integration_Blueprint.png
│
├── .github/
│   └── workflows/
│       └── blueprint-guard.yml
│
└── README.md

# ELA Project Creation Guidelines

---
**Artifact ID:** DOC-00-ELA-GUIDE-PROJCREATE  
**Version:** v1.0.0  
**Owner:** Enterprise Architecture Office (EAO)  
**Maintained By:** EAO / PMO  
**Classification:** Internal Use  
**Last Updated:** 2025-10-25  

---

## 1. Purpose

This guideline provides a practical, step-by-step process for creating a new **ELA-compliant project** using the ELA-Main repository as a base. It operationalizes the policies defined in:

- **ELA Development & Systems Integration Policy (v3.1.0)** — Sections 16 (Framework Usage) and 9 (Blueprint Requirements)
- **Systems Integration Blueprint Addendum** — CI/CD and compliance enforcement

The goal is to ensure **consistency, compliance, and automation** across all projects derived from ELA-Main.

---

## 2. Prerequisites

Before creating a new project:

- GitHub account with permission to create repositories under your organization.
- Access to **ELA-Main** repository (template source).
- PowerShell 7+ (if running the initializer locally), or permission to trigger **GitHub Actions**.
- Awareness of SDLC phase templates in `00_Policy/Templates/phasewise/`.

---

## 3. Repository Creation Options

You can create an ELA project using one of two methods:

### Option A — **Local Script (Preferred for Architects/Developers)**

**Command:**
```powershell
./Tools/Scripts/Initialize-ELAProject.ps1 -ProjectPath "." -ProjectName "MyNewProject"
```

**Result:**
- Creates the full ELA-compliant folder structure.
- Seeds `Catalogue.csv` and `README.md`.
- Creates placeholder `Systems_Integration_Blueprint.md` and `.png`.
- Adds Validation folders for each SDLC phase.

**Folder Structure Example:**
```
00_Policy/
 ├── Templates/phasewise/...
 ├── Guidelines/
 └── Systems_Integration_Blueprint.md
01_Definition/Validation/
02_Design/Validation/
03_Development/Validation/
05_Testing/Validation/
06_Deployment/Validation/
07_Operations/Validation/
08_Change_Management/Validation/
Tools/Scripts/
Reports/
.codex/
```

### Option B — **GitHub Workflow (No Local Setup Required)**

1. Go to the **Actions** tab in your GitHub repository.
2. Run the **`init-project`** workflow manually (type your project name when prompted).
3. The workflow creates the same structure as the PowerShell script and commits it to the default branch.

---

## 4. Systems Integration Blueprint Setup

After initialization, update the placeholder files:

| File | Purpose |
|------|----------|
| `00_Policy/Systems_Integration_Blueprint.md` | Documents all system interfaces, integration flows, and dependencies. |
| `00_Policy/Systems_Integration_Blueprint.png` | Visual representation of the integration architecture (C4, sequence, or data flow diagram). |
| `.codex/blueprint-generator.md` | Optional automation context for blueprint generation. |

**Update frequency:** Every 30 days or after each release — validated by CI job `blueprint-guard`.

---

## 5. CI/CD and Compliance Workflows

The following GitHub Actions enforce ELA compliance automatically:

| Workflow | File | Description |
|-----------|------|-------------|
| **Blueprint Guard** | `.github/workflows/blueprint-guard.yml` | Ensures the Systems Integration Blueprint exists and is up-to-date (<30 days). |
| **Policy Validation** | `.github/workflows/validate-policy.yml` | Checks required folders, metadata headers, and critical documents. |
| **Init Project (Optional)** | `.github/workflows/init-project.yml` | Automates scaffolding from GitHub UI for non-local users. |

### Trigger Behavior
- On each pull request or push to `main` or `develop`, both **blueprint-guard** and **validate-policy** run.
- PRs are **blocked** if required files or metadata are missing.

---

## 6. Documentation and Templates

Each SDLC phase requires documentation per the templates located in `00_Policy/Templates/phasewise/`.  
When filled and approved, store final documents under the respective phase’s `/Validation/` folder.

| Phase | Deliverables |
|--------|---------------|
| Definition | Business Case, Requirements, Risk Assessment |
| Design | Architecture Diagram, Integration Blueprint, NFRs |
| Development | Code Review Checklist, Integration Matrix, README |
| Testing | Test Plan, NFR Validation, Test Report |
| Deployment | Deployment Plan, Rollback Plan, Release Notes |
| Operations | Runbook, Incident Report, Lessons Learned |

---

## 7. Validation and Archival

- Each artifact includes metadata (Author, Version, Date, Work Item ID).
- After review, move documents into `/Validation/` (locked for modification).
- Tag and archive the repository at release (`vX.Y.Z`).
- The CI pipeline logs serve as **compliance evidence** for audits.

---

## 8. Governance and Roles

| Role | Responsibilities |
|------|-----------------|
| **EAO** | Approves design, architecture, and blueprint compliance. |
| **PMO** | Verifies completion of Validation folders per phase. |
| **Security Office** | Confirms secure design, coding, and encryption adherence. |
| **DevOps** | Maintains workflows (`blueprint-guard`, `validate-policy`). |
| **Teams/Contributors** | Populate templates, maintain documentation, ensure CI passes. |

---

## 9. References

- ELA Development & Systems Integration Policy v3.1.0 (§9, §16)
- ELA Policy Addendum: Systems Integration Blueprint
- Systems Integration Blueprint Template
- Document Structure Guidelines

---

**Maintainer Notes:**  
This guideline must be reviewed semi-annually or upon any policy or automation change.


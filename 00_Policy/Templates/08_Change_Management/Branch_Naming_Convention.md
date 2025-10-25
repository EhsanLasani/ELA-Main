
# BRANCH NAMING REFERENCE

---
```yaml
Artifact_ID: DOC-00-Branch_Naming_Convention
Artifact_Name: BRANCH NAMING REFERENCE
Artifact_Type: DOC
Version: v1.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: ELA-compliant reference for branch naming conventions and traceability
File_Path: 00_Policy/Templates/08_Change_Management/Branch_Naming_Convention.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/08_Change_Management/Branch_Naming_Convention.md
Phase: Change Management
Dependencies: None
Process_Group: Change Management
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25
```

| **Field**         | **Value**                                                                 |
|-------------------|---------------------------------------------------------------------------|
| Artifact ID       | DOC-00-Branch_Naming_Convention                                           |
| Artifact Name     | BRANCH NAMING REFERENCE                                                   |
| Artifact Type     | DOC                                                                       |
| Version           | v1.0                                                                      |
| Status            | Draft                                                                     |
| Owner             | Enterprise Architecture Office (EAO)                                      |
| Last Updated      | 2025-10-25                                                                |
| Description       | ELA-compliant reference for branch naming conventions and traceability     |
| File Path         | 00_Policy/Templates/08_Change_Management/Branch_Naming_Convention.md       |
| GitHub URL        | https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/08_Change_Management/Branch_Naming_Convention.md |
| Phase             | Change Management                                                         |
| Dependencies      | None                                                                      |
| Process Group     | Change Management                                                         |
| Process Step      | N/A                                                                       |
| Template Source   | ELA-Template                                                              |
| Validation Status | Pending                                                                   |
| Comments          | Auto-generated on 2025-10-25                                              |

---

## How to Use This Reference
- Use these conventions for all branches in ELA-managed repositories.
- Include change request (CR) IDs for traceability and auditability.
- Review and update with DevOps and Release Management teams.

---

## Branch Naming Conventions
| Branch Type      | Example Format                        | Description                        |
|------------------|---------------------------------------|------------------------------------|
| Main             | main                                  | Production code                    |
| Develop          | develop                               | Integration branch                 |
| Feature          | feature/CR-####-short-description     | New feature, linked to CR          |
| Hotfix           | hotfix/CR-####-issue                  | Urgent fix, linked to CR           |
| Release          | release/vX.Y.Z                        | Release branch for version X.Y.Z   |

**Note:** Replace `####` with the change request number and use a short, descriptive name.

---

## Revision History
| Version | Date       | Author                  | Changes         |
|---------|------------|-------------------------|-----------------|
| 1.0.0   | 2025-10-25 | Enterprise Architecture | Initial template|

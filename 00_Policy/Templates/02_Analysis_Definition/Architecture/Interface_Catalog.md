
# INTERFACE CATALOG TEMPLATE

---
## Metadata
```yaml
Artifact_ID: DOC-00-Interface_Catalog
Artifact_Name: Interface Catalog
Artifact_Type: DOC
Version: v1.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Interface Catalog Template for ELA projects
File_Path: 00_Policy/Templates/01_Definition/Architecture/Interface_Catalog.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/01_Definition/Architecture/Interface_Catalog.md
Phase: Architecture
Dependencies: None
Process_Group: Architecture
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25
---

| Field | Value |
|-------|-------|
| **Artifact ID** | DOC-00-Interface_Catalog |
| **Artifact Name** | Interface Catalog |
| **Artifact Type** | DOC |
| **Version** | v1.0 |
| **Status** | Draft |
| **Owner** | Enterprise Architecture Office (EAO) |
| **Last Updated** | 2025-10-25 |
| **Description** | Interface Catalog Template for ELA projects |
| **File Path** | 00_Policy/Templates/01_Definition/Architecture/Interface_Catalog.md |
| **GitHub URL** | https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/01_Definition/Architecture/Interface_Catalog.md |
| **Phase** | Architecture |
| **Dependencies** | None |
| **Process Group** | Architecture |
| **Process Step** | N/A |
| **Template Source** | ELA-Template |
| **Validation Status** | Pending |
| **Comments** | Auto-generated on 2025-10-25 |

---

## How to Use This Template
- Use this template to document all system interfaces (APIs, integrations, data exchanges) for your project.
- Complete all sections and update as interfaces or dependencies change.
- Attach supporting diagrams or specifications as needed.

---

## 1. Overview
**Instructions:**
- Briefly describe the purpose and scope of the interface catalog.

**Example:**
This catalog lists all interfaces between the ELA Customer Portal and external/internal systems.

---

## 2. Interface Table
**Instructions:**
- List all interfaces, their type, direction, protocols, and key attributes.

| Interface Name | Type | Source | Destination | Protocol | Data Format | Frequency | Security |
|---------------|------|--------|-------------|----------|------------|-----------|---------|
| Customer API | REST | Web App | CRM | HTTPS | JSON | On demand | OAuth2 |
| Payment Gateway | REST | Web App | Payment Provider | HTTPS | JSON | On demand | API Key |
| Inventory Sync | Batch | ERP | Inventory DB | SFTP | CSV | Daily | SSH |
| [Add more] | | | | | | | |

---

## 3. Interface Descriptions
**Instructions:**
- Provide detailed descriptions for each interface, including business purpose, data exchanged, and security considerations.

**Example:**
**Customer API:** Enables the web app to retrieve and update customer records in the CRM. All data is transferred over HTTPS and secured with OAuth2.

---

## 4. Best Practices
- Keep the interface catalog up to date as systems and integrations evolve.
- Involve architecture, security, and development teams in reviews.
- Document security and privacy considerations for each interface.
- Use diagrams and tables for clarity.


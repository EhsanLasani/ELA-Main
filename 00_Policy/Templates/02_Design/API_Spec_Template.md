

# API SPECIFICATION TEMPLATE (SHORT FORM)

---
```yaml
Artifact_ID: TMP-00-API_Spec_Template
Artifact_Name: API Specification (Short Form)
Artifact_Type: TMP
Version: v1.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Short-form API Specification Template for ELA projects
File_Path: 00_Policy/Templates/02_Design/API_Spec_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/02_Design/API_Spec_Template.md
Phase: Design
Dependencies: None
Process_Group: Design
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25
---

| Field | Value |
|-------|-------|
| **Artifact ID** | TMP-00-API_Spec_Template |
| **Artifact Name** | API Specification (Short Form) |
| **Artifact Type** | TMP |
| **Version** | v1.0 |
| **Status** | Draft |
| **Owner** | Enterprise Architecture Office (EAO) |
| **Last Updated** | 2025-10-25 |
| **Description** | Short-form API Specification Template for ELA projects |
| **File Path** | 00_Policy/Templates/02_Design/API_Spec_Template.md |
| **GitHub URL** | https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/02_Design/API_Spec_Template.md |
| **Phase** | Design |
| **Dependencies** | None |
| **Process Group** | Design |
| **Process Step** | N/A |
| **Template Source** | ELA-Template |
| **Validation Status** | Pending |
| **Comments** | Auto-generated on 2025-10-25 |

---

## How to Use This Template
- Use this short-form template for simple APIs or as a quick-start for new API designs.
- Complete all sections and update as endpoints or requirements change.

---

## 1. API Overview
**Instructions:**
- Briefly describe the API, its business purpose, and intended consumers.

**Example:**
The Notification API allows internal systems to send email and SMS notifications to users.

---


## 2. Endpoints
**Instructions:**
- List all endpoints, their methods, parameters, and expected responses.

| Endpoint | Method | Description | Request Params | Response |
|----------|--------|-------------|---------------|----------|
| /notify/email | POST | Send email notification | to, subject, body | 202 Accepted |
| /notify/sms | POST | Send SMS notification | to, message | 202 Accepted |
| [Add more] | | | | |

---

## 3. Authentication
**Instructions:**
- Specify authentication method (e.g., API Key, OAuth2).

**Example:**
All endpoints require an API key in the `Authorization` header.

---

## 4. Error Codes
**Instructions:**
- List common error codes and their meanings.

| Code | Error | Description |
|------|-------|-------------|
| 400 | BAD_REQUEST | Invalid input |
| 401 | UNAUTHORIZED | Missing/invalid API key |
| 500 | INTERNAL_ERROR | Server error |
| [Add more] | | |

---

## Best Practices
- Keep API specs concise and up to date.
- Provide examples for all endpoints.
- Document authentication and error handling clearly.


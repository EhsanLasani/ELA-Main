
# THREAT MODELING TEMPLATE

---
## Metadata
```yaml
Artifact_ID: TMP-00-Threat_Modeling_Temp
Artifact_Name: Threat Modeling Template
Artifact_Type: TMP
Version: v1.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Threat Modeling Template for ELA projects
File_Path: 00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Threat_Modeling_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Threat_Modeling_Template.md
Phase: Risk, Security & Compliance
Dependencies: None
Process_Group: Risk, Security & Compliance
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25
---

| Field | Value |
|-------|-------|
| **Artifact ID** | TMP-00-Threat_Modeling_Temp |
| **Artifact Name** | Threat Modeling Template |
| **Artifact Type** | TMP |
| **Version** | v1.0 |
| **Status** | Draft |
| **Owner** | Enterprise Architecture Office (EAO) |
| **Last Updated** | 2025-10-25 |
| **Description** | Threat Modeling Template for ELA projects |
| **File Path** | 00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Threat_Modeling_Template.md |
| **GitHub URL** | https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Threat_Modeling_Template.md |
| **Phase** | Risk, Security & Compliance |
| **Dependencies** | None |
| **Process Group** | Risk, Security & Compliance |
| **Process Step** | N/A |
| **Template Source** | ELA-Template |
| **Validation Status** | Pending |
| **Comments** | Auto-generated on 2025-10-25 |

---

## How to Use This Template
- Use this template to document and manage threat modeling for your project.
- Complete all sections and update as the system, threats, or mitigations change.
- Attach supporting evidence for each threat and mitigation.

---

## Document Control
| Field | Value |
|-------|-------|
| **Project Name** | [Enter Project Name] |
| **Project ID** | [ELA-XXXX] |
| **Version** | 1.0.0 |
| **Threat Modeler** | [Name] |
| **Date** | [YYYY-MM-DD] |
| **Review Date** | [YYYY-MM-DD] |

---

## 1. SYSTEM OVERVIEW
**Instructions:**
- Briefly describe the system, its purpose, and its boundaries.
- List all key assets and trust boundaries.

**Example:**
**Description:** Web application for customer data management.

**Trust Boundaries:**
- Internet ↔ DMZ
- DMZ ↔ Application Tier
- Application ↔ Database
- Internal Users ↔ External Users

**Key Assets:**
1. Customer PII
2. Payment data
3. Authentication tokens

**System Diagram Example:**
> [Web App] ---> [API Gateway]
>                             |
>                             v
>                        [Database]

**Components:**
- External Entity: Users, External APIs
- Processes: Web Server, API, Auth Service
- Data Stores: Database, Cache, File Storage
- Data Flows: HTTPS requests, SQL queries

---

## 2. THREAT IDENTIFICATION
**Instructions:**
- Identify and describe all relevant threats to the system.
- Use STRIDE (Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege) or similar frameworks.

| ID | Threat | Category | Description | Attack Vector | Impact | Severity | Likelihood | Risk Score | Status | Owner |
|----|--------|----------|-------------|--------------|--------|----------|------------|-----------|--------|-------|
| T-001 | SQL Injection | Tampering | Attacker injects malicious SQL through input fields | Unvalidated user input | Data breach, data manipulation | Critical | High | 9 | In Progress | Dev Team |
| T-002 | Session Hijacking | Spoofing | Attacker steals session tokens | Insecure cookies | Account compromise | High | Medium | 6 | Implemented | Security |
| T-003 | [Add more] | | | | | | | | | |

---

## 3. MITIGATIONS & CONTROLS
**Instructions:**
- List all preventive, detective, and corrective controls for each threat.
- Assign responsibility and status for each control.

### Preventive Controls
- Input validation
- Authentication & Authorization
- Encryption (TLS, AES-256)
- WAF deployment

### Detective Controls
- Logging and monitoring
- Intrusion Detection System (IDS)
- SIEM alerts
- Anomaly detection

### Corrective Controls
- Incident response plan
- Automated rollback
- Backup and recovery

---

## 4. THREAT SUMMARY TABLE
**Instructions:**
- Summarize all threats, their risk level, and mitigation status.

| ID | Threat | Category | Severity | Likelihood | Risk | Status | Owner |
|----|--------|----------|----------|------------|------|--------|-------|
| T-001 | SQL Injection | Tampering | Critical | High | 9 | In Progress | Dev Team |
| T-002 | Session Hijacking | Spoofing | High | Medium | 6 | Implemented | Security |
| T-003 | [Add more] | | | | | | |

---

## 5. RISK REGISTER
**Instructions:**
- Document all identified risks, their level, and mitigation plan.

| Risk ID | Description | Level | Mitigation Plan |
|---------|-------------|-------|-----------------|
| R-001 | SQL Injection | High | Parameterized queries, WAF |
| R-002 | Session Hijacking | Medium | Secure cookies, session timeout |
| [Add more] | | | |

---

## 6. REVIEW & UPDATES
- **Next Review Date:** [YYYY-MM-DD]
- **Review Frequency:** Quarterly or after major changes

---

## Best Practices
- Review and update this threat model regularly as the system or threat landscape changes.
- Engage security, compliance, and development teams in all threat modeling activities.
- Document all decisions and attach supporting evidence for audits.
- Use this template as a living document for ongoing compliance and risk management.

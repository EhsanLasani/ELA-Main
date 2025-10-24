## Metadata
---
Artifact_ID: TMP-00-Threat_Modeling_Temp
Artifact_Name: THREAT MODELING TEMPLATE
Artifact_Type: TMP
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: THREAT MODELING TEMPLATE
File_Path: 00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Threat_Modeling_Template.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Threat_Modeling_Template.md
Last_Updated: 2025-10-25
Owner: Enterprise Architecture Office (EAO)
Phase: Policy
Process_Group: Policy
Process_Step: N/A
Project_Name: 
Status: Draft
Template_Source: ELA-Template
Validation_Status: Pending
Version: v1.0
---
# THREAT MODELING TEMPLATE

## Document Control
| Field | Value |
|-------|-------|
| **Project Name** | [Enter Project Name] |
| **Project ID** | [ELA-XXXX] |
| **Version** | 1.0.0 |
| **Threat Modeler** | [Name] |
| **Date** | [YYYY-MM-DD] |
| **Review Date** | [YYYY-MM-DD] |

## 1. SYSTEM OVERVIEW

**Description:** [Brief system description]

**Trust Boundaries:**
- Internet ↔ DMZ
- DMZ ↔ Application Tier
- Application ↔ Database
- Internal Users ↔ External Users

**Key Assets:**
1. [Asset 1: e.g., Customer PII]
2. [Asset 2: e.g., Payment data]
3. [Asset 3: e.g., Authentication tokens]

> [Web App] ---> [API Gateway]
                                                      |
                                                      v
                                              [Database]
```

**Components:**
- External Entity: [Users, External APIs]
- Processes: [Web Server, API, Auth Service]
- Data Stores: [Database, Cache, File Storage]
- Data Flows: [HTTPS requests, SQL queries]

### Threat 2: SQL Injection
**Category:** Tampering
**Description:** Attacker injects malicious SQL through input fields
**Attack Vector:** Unvalidated user input in database queries
**Impact:** Data breach, data manipulation - **Severity: Critical**
**Likelihood:** High
**Risk Score:** 9/10

**Mitigation:**
- [x] Use parameterized queries
- [x] Input validation and sanitization
- [x] Principle of least privilege for DB accounts
- [ ] Web Application Firewall (WAF)
**Status:** In Progress
**Owner:** Dev Team

## 4. THREAT SUMMARY TABLE

| ID | Threat | Category | Severity | Likelihood | Risk | Status | Owner |
|----|--------|----------|----------|------------|------|--------|-------|
| T-001 | [Threat 1] | [Category] | [H/M/L] | [H/M/L] | [Score] | [Status] | [Name] |
| T-002 | SQL Injection | Tampering | Critical | High | 9 | In Progress | Dev |
| T-003 | Session Hijacking | Spoofing | High | Medium | 6 | Implemented | Security |
| T-004 | [Add more] | | | | | | |

## 6. SECURITY CONTROLS

### Preventive Controls
- [ ] Input validation
- [ ] Authentication & Authorization
- [ ] Encryption (TLS, AES-256)
- [ ] WAF deployment

### Detective Controls
- [ ] Logging and monitoring
- [ ] Intrusion Detection System (IDS)
- [ ] SIEM alerts
- [ ] Anomaly detection

### Corrective Controls
- [ ] Incident response plan
- [ ] Automated rollback
- [ ] Backup and recovery

------|-------------|-------------------|------------|
| R-001 | [Risk description] | [Low/Medium] | [Accepted/Mitigate further] |

## 9. REVIEW & UPDATES

- **Next Review Date:** [YYYY-MM-DD]
- **Review Frequency:** Quarterly or after major changes

---|------|------|--------|
| Security Lead | | | [ ] Approved |
| Solution Architect | | | [ ] Approved |
| CISO | | | [ ] Approved |

**Template Version:** 1.0.0  
**Maintained By:** Information Security Team

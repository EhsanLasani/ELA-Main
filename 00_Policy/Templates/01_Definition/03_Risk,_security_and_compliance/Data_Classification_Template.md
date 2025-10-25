# DATA CLASSIFICATION & GOVERNANCE PLAN

---
## Metadata
```yaml
Artifact_ID: TMP-00-Data_Classification_
Artifact_Name: Data Classification & Governance Plan
Artifact_Type: TMP
Version: v1.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Data Classification & Governance Plan Template for ELA projects
File_Path: 00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Data_Classification_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Data_Classification_Template.md
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
| **Artifact ID** | TMP-00-Data_Classification_ |
| **Artifact Name** | Data Classification & Governance Plan |
| **Artifact Type** | TMP |
| **Version** | v1.0 |
| **Status** | Draft |
| **Owner** | Enterprise Architecture Office (EAO) |
| **Last Updated** | 2025-10-25 |
| **Description** | Data Classification & Governance Plan Template for ELA projects |
| **File Path** | 00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Data_Classification_Template.md |
| **GitHub URL** | https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Data_Classification_Template.md |
| **Phase** | Risk, Security & Compliance |
| **Dependencies** | None |
| **Process Group** | Risk, Security & Compliance |
| **Process Step** | N/A |
| **Template Source** | ELA-Template |
| **Validation Status** | Pending |
| **Comments** | Auto-generated on 2025-10-25 |

---

## How to Use This Template
- Use this template to classify, govern, and protect all data assets in your project.
- Complete all sections and update as data types, regulations, or business needs change.
- Attach supporting evidence for each classification and control.

---

## 1. Data Inventory & Classification
**Instructions:**
- List all data assets, their classification, type, sensitivity, and applicable regulations.
- Assign data stewards and define retention periods.

| Data Asset | Classification | Type | Sensitivity | Regulation | Source/System | Data Steward | Retention | Access Notes |
|-----------|----------------|------|-------------|------------|--------------|-------------|----------|-------------|
| User Email | Restricted | String | PII | GDPR Art. 5 | User Registration | Data Steward | 7 years post-closure | Role: User Admin |
| User Password Hash | Restricted | String | Auth | NIST 800-63B | Auth Service | Security Office | Account lifetime | System only |
| User Name | Confidential | String | PII | GDPR Art. 5 | User Profile | Data Steward | 7 years | Role: Support, Admin |
| Session Logs | Internal | JSON | No | None | App Server | DevOps | 90 days | Role: DevOps, Support |
| Payment Card (tokenized) | Restricted | Token | Payment | PCI-DSS | Payment Gateway | Finance IT | 3 years | System only |
| [Add more] | | | | | | | | |

---

## 2. Classification Levels & Controls
**Instructions:**
- Define all classification levels and required controls for each.

| Level | Description | Example Data | Required Controls |
|-------|-------------|-------------|------------------|
| Public | Information freely shareable with the public | Marketing materials, public docs | None required |
| Internal | Company confidential, internal use only | Internal communications, project plans | Access control |
| Confidential | Business-critical, limited distribution | Customer data, financial records | Encryption, audit logging, RBAC |
| Restricted | Highly sensitive, strict need-to-know | PII, PHI, payment data, credentials | Strong encryption (AES-256), MFA, strict RBAC, audit trails, DLP |

---

## 3. Data Flow & Processing Map
**Instructions:**
- Map how data moves through the system, including sources, processing, storage, and consumers.

| Data Asset | Source | Processing | Storage | Consumers | Frequency |
|-----------|--------|------------|---------|-----------|-----------|
| User Email | Registration API | Validation, normalization | PostgreSQL: users.email | Auth Service, Notification Service | Real-time |
| Order Total | Order API | Currency conversion, tax calc | PostgreSQL: orders.total | Billing, Analytics | Real-time |
| [Add more] | | | | | |

---

## 4. Retention, Deletion & Compliance
**Instructions:**
- Define retention periods, deletion workflows, and compliance requirements for each data type.

| Data Asset | Retention | Regulation/Reason | Deletion Method | Audit/Validation |
|------------|----------|-------------------|-----------------|-----------------|
| User PII | 7 years post-account closure | GDPR, legal requirements | Automated deletion job | Monthly audit report |
| Financial Transactions | 10 years | Tax regulations, auditing | Automated archival → cold storage | Annual audit |
| Application Logs | 90 days (non-prod), 1 year (prod) | Troubleshooting, security | Automated log rotation | Dashboard monitoring |
| [Add more] | | | | |

### 4.2 Right to Deletion (GDPR/CCPA)
- [ ] User deletion workflow implemented

---

## Best Practices
- Review and update this plan regularly as data assets or regulations change.
- Engage data stewards and compliance officers in all classification and governance activities.
- Document all decisions and attach supporting evidence for audits.
- Use this template as a living document for ongoing compliance and risk management.
- [ ] Deletion cascades to all systems
- [ ] Verification report generated
- [ ] 30-day completion SLA
- [ ] Legal hold check before deletion

--|------------|-----|--------|-------------------|-----------|
| **Completeness** | % of required fields populated | % non-null critical fields | 99.5% | Automated data profiling | Daily |
| **Accuracy** | % of data matching authoritative source | % validated records | 99% | Validation rules, reconciliation | Daily |
| **Consistency** | % of data consistent across systems | % matching records in sync | 100% | Cross-system reconciliation | Hourly |
| **Timeliness** | Data freshness/latency | % data within SLA window | 95% within 5s | Timestamp comparison | Real-time |

|----------------|--------|
| **Consent Management** | Cookie banner, privacy preferences | [ ] Implemented |
| **Right to Access** | User portal to download data | [ ] Implemented |
| **Right to Deletion** | Self-service deletion + verification | [ ] Implemented |
| **Data Breach Notification** | 72-hour notification procedure | [ ] Documented |

----------------|----------------|----------|
| **Data in Transit** | TLS 1.3 (min TLS 1.2) | Certificate Authority | 90-day cert rotation |
| **Data at Rest (DB)** | AES-256, Transparent Data Encryption | Azure Key Vault / AWS KMS | Annual key rotation |

### 7.2 Access Controls - RBAC

| Role | Data Access Level | Allowed Operations | Data Elements Accessible |
|------|-------------------|-------------------|--------------------------|
| **User** | Own data only | Read, Update (limited) | Own profile, own orders |
| **Support Agent** | Customer data (case-based) | Read | Customer profiles, order history (audit logged) |
| **Admin** | All data | Read, Update, Delete | All (MFA required, audit logged) |

---------|-----------------|
| **Data Steward** | Data quality, classification, lifecycle management | Data accuracy and completeness |
| **Data Owner** | Business accountability, access approvals | Data usage and compliance |
| **Privacy Officer** | GDPR/CCPA compliance, privacy assessments | Privacy controls and breach response |
| **Security Office** | Access controls, encryption, security audits | Data security and incident response |

## 10. Compliance Verification

### 10.1 Regulatory Compliance Checklist

**GDPR Compliance:**
- [ ] Legal basis for processing documented
- [ ] Privacy notice published
- [ ] Consent mechanisms implemented
- [ ] Data subject rights supported
- [ ] Data breach notification procedure (72 hours)

**HIPAA Compliance:**
- [ ] PHI identified and classified as Restricted
- [ ] Administrative, physical, and technical safeguards
- [ ] Business Associate Agreements (BAAs)
- [ ] Breach notification procedure (60 days)

**PCI-DSS Compliance:**
- [ ] Cardholder data not stored (use tokenization)
- [ ] CVV/CVC never stored
- [ ] Quarterly ASV scans
- [ ] Annual penetration testing

|-------------|----------------|-----------|-----------------|
| SendGrid | Email delivery | Email addresses, names | Confidential | DPA signed | 2025-Q1 |
| Stripe | Payment processing | Tokenized payment data | Restricted | PCI-compliant | 2025-Q1 |

## 13. Data Classification Review & Approval

### 13.1 Review Checklist
- [ ] All data elements inventoried
- [ ] Classification levels assigned
- [ ] Data lineage documented
- [ ] Data quality SLIs defined
- [ ] Retention schedules established
- [ ] Privacy controls implemented
- [ ] Security controls implemented

### 13.2 Sign-off

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Data Steward | | | |
| Privacy Officer | | | |
| Security Office | | | |
| Technical Lead | | | |

|------|---------|----------|
| v1.0 | YYYY-MM-DD | Initial data classification plan | [Name] |

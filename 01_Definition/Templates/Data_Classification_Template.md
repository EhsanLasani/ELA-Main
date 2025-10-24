# Data Classification & Governance Plan

## 0. Metadata
- **Artifact ID (catalog.csv):** TMP-DEF-DATA-CLASS
- **Version:** v1.0
- **Owner:**
- **Data Steward:**
- **Linked Ticket / PR:**
- **Project ID:**
- **Date:**

---

## 1. Data Inventory

| Data Element | Classification | Data Type | PII/PHI | Regulatory | Source | Owner | Retention | Access Level |
|--------------|----------------|-----------|---------|------------|--------|-------|-----------|--------------|
| User Email | Restricted | String | PII | GDPR Art. 5 | User Registration | Data Steward | 7 years post-closure | Role: User Admin |
| User Password Hash | Restricted | String | Auth | NIST 800-63B | Auth Service | Security Office | Account lifetime | System only |
| User Name | Confidential | String | PII | GDPR Art. 5 | User Profile | Data Steward | 7 years | Role: Support, Admin |
| Session Logs | Internal | JSON | No | None | App Server | DevOps | 90 days | Role: DevOps, Support |
| Payment Card (tokenized) | Restricted | Token | Payment | PCI-DSS | Payment Gateway | Finance IT | 3 years | System only |

---

## 2. Data Classification Levels

| Level | Definition | Examples | Controls Required |
|-------|------------|----------|-------------------|
| **Public** | Information freely shareable with the public | Marketing materials, public docs | None required |
| **Internal** | Company confidential, internal use only | Internal communications, project plans | Access control |
| **Confidential** | Business-critical, limited distribution | Customer data, financial records | Encryption, audit logging, RBAC |
| **Restricted** | Highly sensitive, strict need-to-know | PII, PHI, payment data, credentials | Strong encryption (AES-256), MFA, strict RBAC, audit trails, DLP |

---

## 3. Data Lineage

### 3.1 Data Flow Diagram
```
[External Sources] → [Ingestion Layer] → [Processing/Transformation] → [Storage] → [Consumers]
                                                                       ↓
                                                              [Archive/Deletion]
```

### 3.2 Detailed Data Lineage

| Data Element | Source System | Transformations | Storage Location | Consumers | Sync Frequency |
|--------------|---------------|-----------------|------------------|-----------|----------------|
| User Email | Registration API | Validation, normalization | PostgreSQL: users.email | Auth Service, Notification Service | Real-time |
| Order Total | Order API | Currency conversion, tax calc | PostgreSQL: orders.total | Billing, Analytics | Real-time |

---

## 4. Data Retention & Deletion

### 4.1 Retention Schedule

| Data Category | Retention Period | Rationale | Deletion Method | Verification |
|---------------|------------------|-----------|-----------------|--------------|
| User PII | 7 years post-account closure | GDPR, legal requirements | Automated deletion job | Monthly audit report |
| Financial Transactions | 10 years | Tax regulations, auditing | Automated archival → cold storage | Annual audit |
| Application Logs | 90 days (non-prod), 1 year (prod) | Troubleshooting, security | Automated log rotation | Dashboard monitoring |

### 4.2 Right to Deletion (GDPR/CCPA)
- [ ] User deletion workflow implemented
- [ ] Deletion cascades to all systems
- [ ] Verification report generated
- [ ] 30-day completion SLA
- [ ] Legal hold check before deletion

---

## 5. Data Quality Management

### 5.1 Data Quality Dimensions & SLIs

| Dimension | Definition | SLI | Target | Measurement Method | Frequency |
|-----------|------------|-----|--------|-------------------|-----------|
| **Completeness** | % of required fields populated | % non-null critical fields | 99.5% | Automated data profiling | Daily |
| **Accuracy** | % of data matching authoritative source | % validated records | 99% | Validation rules, reconciliation | Daily |
| **Consistency** | % of data consistent across systems | % matching records in sync | 100% | Cross-system reconciliation | Hourly |
| **Timeliness** | Data freshness/latency | % data within SLA window | 95% within 5s | Timestamp comparison | Real-time |

---

## 6. Data Privacy & Protection

### 6.1 Privacy Impact Assessment (PIA)

**PII/PHI Collected:**
- [ ] Names (First, Last)
- [ ] Email addresses
- [ ] Phone numbers
- [ ] Physical addresses
- [ ] Date of birth
- [ ] Payment information (tokenized)

**Legal Basis (GDPR):**
- [ ] Consent
- [ ] Contract performance
- [ ] Legal obligation
- [ ] Legitimate interest

### 6.2 Privacy Controls

| Control | Implementation | Status |
|---------|----------------|--------|
| **Consent Management** | Cookie banner, privacy preferences | [ ] Implemented |
| **Right to Access** | User portal to download data | [ ] Implemented |
| **Right to Deletion** | Self-service deletion + verification | [ ] Implemented |
| **Data Breach Notification** | 72-hour notification procedure | [ ] Documented |

---

## 7. Data Security Controls

### 7.1 Encryption

| Data State | Encryption Method | Key Management | Rotation |
|------------|-------------------|----------------|----------|
| **Data in Transit** | TLS 1.3 (min TLS 1.2) | Certificate Authority | 90-day cert rotation |
| **Data at Rest (DB)** | AES-256, Transparent Data Encryption | Azure Key Vault / AWS KMS | Annual key rotation |

### 7.2 Access Controls - RBAC

| Role | Data Access Level | Allowed Operations | Data Elements Accessible |
|------|-------------------|-------------------|--------------------------|
| **User** | Own data only | Read, Update (limited) | Own profile, own orders |
| **Support Agent** | Customer data (case-based) | Read | Customer profiles, order history (audit logged) |
| **Admin** | All data | Read, Update, Delete | All (MFA required, audit logged) |

---

## 8. Data Governance Structure

### 8.1 Roles & Responsibilities

| Role | Responsibilities | Accountable For |
|------|------------------|-----------------|
| **Data Steward** | Data quality, classification, lifecycle management | Data accuracy and completeness |
| **Data Owner** | Business accountability, access approvals | Data usage and compliance |
| **Privacy Officer** | GDPR/CCPA compliance, privacy assessments | Privacy controls and breach response |
| **Security Office** | Access controls, encryption, security audits | Data security and incident response |

---

## 9. Data Cataloging

### 9.1 Data Catalog Implementation
- **Tool:** Apache Atlas / Collibra / Alation / Microsoft Purview
- **Catalog Location:** [Link]

**Catalog Metadata:**
- Data element name and description
- Classification level
- Owner and steward
- Data lineage
- Data quality scores
- Usage statistics

---

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

---

## 11. Third-Party Data Sharing

| Vendor | Purpose | Data Shared | Classification | Agreement | Security Review |
|--------|---------|-------------|----------------|-----------|-----------------|
| SendGrid | Email delivery | Email addresses, names | Confidential | DPA signed | 2025-Q1 |
| Stripe | Payment processing | Tokenized payment data | Restricted | PCI-compliant | 2025-Q1 |

---

## 12. Data Incident Response

### 12.1 Data Breach Response Plan

**Response Steps:**
1. **Detection & Containment** (< 1 hour)
2. **Assessment** (< 4 hours)
3. **Notification** (per regulatory timelines)
   - GDPR: 72 hours to supervisory authority
   - HIPAA: 60 days to affected individuals
4. **Remediation**
5. **Documentation**

---

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

---

**Version History:**
| Version | Date | Changes | Approver |
|---------|------|---------|----------|
| v1.0 | YYYY-MM-DD | Initial data classification plan | [Name] |

# DATA GOVERNANCE TEMPLATE

## Document Control
| Field | Value |
|-------|-------|
| **Project** | [Name] |
| **Data Owner** | [Name] |
| **Data Steward** | [Name] |
| **Version** | 1.0.0 |
| **Date** | [YYYY-MM-DD] |

---

## 1. DATA CLASSIFICATION

| Data Element | Classification | Sensitivity | Retention | Owner |
|--------------|----------------|-------------|-----------|-------|
| Customer Name | PII | High | 7 years | [Name] |
| Email | PII | High | 7 years | [Name] |
| Credit Card | PCI-DSS | Critical | Per PCI | [Name] |
| Health Records | PHI | Critical | Per HIPAA | [Name] |
| [Add more] | | | | |

**Classification Levels:**
- **Public:** No restrictions
- **Internal:** Company employees only
- **Confidential:** Restricted access
- **Restricted:** Highly sensitive (PII/PHI/PCI)

---

## 2. DATA LIFECYCLE

### Collection
- [ ] Data minimization applied
- [ ] Consent obtained (GDPR)
- [ ] Purpose clearly defined
- [ ] Collection methods documented

### Storage
- [ ] Encryption at rest (AES-256)
- [ ] Access controls enforced
- [ ] Backup procedures defined
- [ ] Geographic location documented

### Processing
- [ ] Data quality checks
- [ ] Transformation rules documented
- [ ] Audit trail maintained
- [ ] Privacy-preserving techniques applied

### Sharing
- [ ] Data sharing agreements in place
- [ ] Third-party vetting completed
- [ ] Secure transfer methods
- [ ] Usage restrictions defined

### Archival
- [ ] Retention policy defined
- [ ] Archive location secured
- [ ] Retrieval process documented

### Deletion
- [ ] Deletion criteria defined
- [ ] Secure deletion methods
- [ ] Certificate of destruction
- [ ] Audit trail of deletion

---

## 3. DATA QUALITY

| Dimension | Requirement | Measurement | Target |
|-----------|-------------|-------------|--------|
| Accuracy | Data matches source | Error rate | < 1% |
| Completeness | No missing fields | % complete | > 95% |
| Consistency | Same across systems | Variance | < 2% |
| Timeliness | Data is current | Lag time | < 24hrs |
| Validity | Conforms to rules | Validation failures | < 0.5% |

---

## 4. DATA ACCESS

### Access Control Matrix

| Role | Read | Create | Update | Delete | Export |
|------|------|--------|--------|--------|--------|
| Admin | ✓ | ✓ | ✓ | ✓ | ✓ |
| Data Analyst | ✓ | ✗ | ✗ | ✗ | ✓ |
| Business User | ✓ | ✗ | ✗ | ✗ | ✗ |
| [Add roles] | | | | | |

### Access Request Process
1. Submit access request via [system]
2. Manager approval
3. Data owner approval
4. Security review
5. Access granted (time-limited)
6. Quarterly access review

---

## 5. COMPLIANCE

### GDPR Compliance
- [ ] Right to access implemented
- [ ] Right to rectification
- [ ] Right to erasure ("right to be forgotten")
- [ ] Right to data portability
- [ ] Right to object
- [ ] Privacy by design
- [ ] Data Protection Impact Assessment (DPIA) completed

### Other Regulations
- [ ] HIPAA (if applicable)
- [ ] CCPA (if applicable)
- [ ] PCI-DSS (if applicable)
- [ ] SOC 2

---

## 6. DATA LINEAGE

```
[Source System] → [ETL Process] → [Data Warehouse] → [Analytics] → [Reports]
```

**Transformation Log:**
| Step | Input | Transformation | Output | Owner |
|------|-------|----------------|--------|-------|
| 1 | Raw data | Cleansing | Clean data | ETL Team |
| 2 | Clean data | Aggregation | Summary | Analytics |

---

## 7. DATA STEWARDSHIP

**Data Steward Responsibilities:**
- Maintain data quality
- Resolve data issues
- Document data definitions
- Coordinate with data consumers
- Enforce governance policies

**Data Owner Responsibilities:**
- Define data classification
- Approve access requests
- Set retention policies
- Accountable for data security

---

## 8. METADATA MANAGEMENT

| Data Element | Business Definition | Technical Name | Data Type | Source System |
|--------------|---------------------|----------------|-----------|---------------|
| Customer ID | Unique identifier | cust_id | INT | CRM |
| [Add more] | | | | |

---

## 9. MONITORING & REPORTING

- [ ] Data quality dashboards
- [ ] Access audit reports
- [ ] Compliance reports
- [ ] Data breach monitoring
- [ ] Usage analytics

**Reporting Frequency:** Monthly

---

## APPROVAL

| Role | Name | Date | Status |
|------|------|------|--------|
| Data Owner | | | [ ] Approved |
| Privacy Officer | | | [ ] Approved |
| CISO | | | [ ] Approved |

**Template Version:** 1.0.0

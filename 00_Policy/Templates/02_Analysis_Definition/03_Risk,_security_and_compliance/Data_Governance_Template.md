# DATA GOVERNANCE TEMPLATE

---
## Metadata
```yaml
Artifact_ID: TMP-00-Data_Governance_Temp
Artifact_Name: Data Governance Template
Artifact_Type: TMP
Version: v1.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Data Governance Template for ELA projects
File_Path: 00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Data_Governance_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Data_Governance_Template.md
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
| **Artifact ID** | TMP-00-Data_Governance_Temp |
| **Artifact Name** | Data Governance Template |
| **Artifact Type** | TMP |
| **Version** | v1.0 |
| **Status** | Draft |
| **Owner** | Enterprise Architecture Office (EAO) |
| **Last Updated** | 2025-10-25 |
| **Description** | Data Governance Template for ELA projects |
| **File Path** | 00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Data_Governance_Template.md |
| **GitHub URL** | https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Data_Governance_Template.md |
| **Phase** | Risk, Security & Compliance |
| **Dependencies** | None |
| **Process Group** | Risk, Security & Compliance |
| **Process Step** | N/A |
| **Template Source** | ELA-Template |
| **Validation Status** | Pending |
| **Comments** | Auto-generated on 2025-10-25 |

---

## How to Use This Template
- Use this template to define, document, and manage data governance for your project.
- Complete all sections and update as data assets, owners, or regulations change.
- Attach supporting evidence for each governance activity.

---

## 1. Data Ownership & Stewardship
**Instructions:**
- List all key data assets, their owners, stewards, classification, and retention.

| Data Asset | Classification | Sensitivity | Retention | Owner/Steward |
|------------|---------------|-------------|-----------|---------------|
| Customer Name | PII | High | 7 years | [Name] |
| Email | PII | High | 7 years | [Name] |
| Credit Card | PCI-DSS | Critical | Per PCI | [Name] |
| Health Records | PHI | Critical | Per HIPAA | [Name] |
| [Add more] | | | | |

---

## 2. Classification Levels
**Instructions:**
- Define all classification levels and their access restrictions.

- **Public:** No restrictions
- **Internal:** Company employees only
- **Confidential:** Restricted access
- **Restricted:** Highly sensitive (PII/PHI/PCI)

---

## 3. Data Quality Management
**Instructions:**
- Define quality dimensions, requirements, and targets for all data assets.
- Assign responsibility for monitoring and reporting.

| Dimension    | Requirement             | Measurement         | Target |
|------------- |------------------------|---------------------|--------|
| Accuracy     | Data matches source     | Error rate          | < 1%   |
| Completeness | No missing fields       | % complete          | > 95%  |
| Consistency  | Same across systems     | Variance            | < 2%   |
| Timeliness   | Data is current         | Lag time            | < 24hrs|
| Validity     | Conforms to rules       | Validation failures | < 0.5% |

---

## 4. Governance Activities & Best Practices
**Instructions:**
- List all governance activities (e.g., data quality reviews, audits, policy updates).
- Assign responsibility and frequency for each activity.

| Activity                | Frequency      | Responsible Party |
|-------------------------|---------------|------------------|
| Data quality review     | Quarterly     | Data Steward     |
| Data retention audit    | Annually      | Compliance Lead  |
| Policy update           | As needed     | Data Owner       |
| Access review           | Semi-annual   | Security Officer |
| [Add more]              |               |                  |

---

## Best Practices
- Review and update this plan regularly as data assets or regulations change.
- Engage data owners, stewards, and compliance officers in all governance activities.
- Document all decisions and attach supporting evidence for audits.
- Use this template as a living document for ongoing compliance and risk management.
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

## 6. DATA LINEAGE

```
[Source System] → [ETL Process] → [Data Warehouse] → [Analytics] → [Reports]
```

**Transformation Log:**
| Step | Input | Transformation | Output | Owner |
|------|-------|----------------|--------|-------|
| 1 | Raw data | Cleansing | Clean data | ETL Team |
| 2 | Clean data | Aggregation | Summary | Analytics |

## 8. METADATA MANAGEMENT

| Data Element | Business Definition | Technical Name | Data Type | Source System |
|--------------|---------------------|----------------|-----------|---------------|
| Customer ID | Unique identifier | cust_id | INT | CRM |
| [Add more] | | | | |

## APPROVAL

| Role | Name | Date | Status |
|------|------|------|--------|
| Data Owner | | | [ ] Approved |
| Privacy Officer | | | [ ] Approved |
| CISO | | | [ ] Approved |

**Template Version:** 1.0.0

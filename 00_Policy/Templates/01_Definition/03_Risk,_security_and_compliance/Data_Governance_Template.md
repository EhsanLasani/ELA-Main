## Metadata
---
Artifact_ID: TMP-00-Data_Governance_Temp
Artifact_Name: DATA GOVERNANCE TEMPLATE
Artifact_Type: TMP
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: DATA GOVERNANCE TEMPLATE
File_Path: 00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Data_Governance_Template.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/01_Definition/03_Risk,_security_and_compliance/Data_Governance_Template.md
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
# DATA GOVERNANCE TEMPLATE

## Document Control
| Field | Value |
|-------|-------|
| **Project** | [Name] |
| **Data Owner** | [Name] |
| **Data Steward** | [Name] |
| **Version** | 1.0.0 |
| **Date** | [YYYY-MM-DD] |

-----------|----------------|-------------|-----------|-------|
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

## 3. DATA QUALITY

| Dimension | Requirement | Measurement | Target |
|-----------|-------------|-------------|--------|
| Accuracy | Data matches source | Error rate | < 1% |
| Completeness | No missing fields | % complete | > 95% |
| Consistency | Same across systems | Variance | < 2% |
| Timeliness | Data is current | Lag time | < 24hrs |
| Validity | Conforms to rules | Validation failures | < 0.5% |

---|------|--------|--------|--------|--------|
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

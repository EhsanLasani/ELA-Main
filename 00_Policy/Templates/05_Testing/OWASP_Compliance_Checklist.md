## Metadata
---
Artifact_ID: VAL-00-OWASP_Compliance_Che
Artifact_Name: OWASP COMPLIANCE CHECKLIST
Artifact_Type: VAL
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: OWASP COMPLIANCE CHECKLIST
File_Path: 00_Policy/Templates/05_Testing/OWASP_Compliance_Checklist.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/05_Testing/OWASP_Compliance_Checklist.md
Last_Updated: 2025-10-25
Owner: Enterprise Architecture Office (EAO)
Phase: Policy
Process_Group: Policy
Process_Step: N/A
Project_Name: 
Status: Draft
Template_Source: 
Validation_Status: Pending
Version: v1.0
---
# OWASP COMPLIANCE CHECKLIST

## Document Control
| Field | Value |
|-------|-------|
| **Project** | [Enter Project Name] |
| **Version** | 1.0.0 |
| **Assessed By** | [Name] |
| **Date** | [YYYY-MM-DD] |

### A02:2021 – Cryptographic Failures
- [ ] TLS 1.3 enforced for data in transit
- [ ] AES-256 for data at rest
- [ ] No sensitive data in URLs
- [ ] Proper key management (KMS/HSM)
- [ ] Key rotation automated
- [ ] No deprecated crypto algorithms
- [ ] Passwords hashed with bcrypt/Argon2
- [ ] Salted hashes for passwords

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

### A04:2021 – Insecure Design
- [ ] Threat modeling completed
- [ ] Secure design patterns used
- [ ] Security requirements defined
- [ ] Secure SDLC followed
- [ ] Design peer review conducted
- [ ] Attack surface minimized
- [ ] Separation of concerns

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

### A06:2021 – Vulnerable and Outdated Components
- [ ] Inventory of components maintained
- [ ] Dependencies scanned regularly
- [ ] No known vulnerable libraries
- [ ] Components from official sources
- [ ] Unmaintained components removed
- [ ] Automated vulnerability alerts
- [ ] Patch/update process defined

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

### A08:2021 – Software and Data Integrity Failures
- [ ] Code signing implemented
- [ ] CI/CD pipeline secured
- [ ] Dependency integrity checks
- [ ] Subresource Integrity (SRI)
- [ ] Digital signatures verified
- [ ] Untrusted data separated
- [ ] Deserialization secured

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

### A10:2021 – Server-Side Request Forgery (SSRF)
- [ ] URL validation (whitelist)
- [ ] Network segmentation
- [ ] Firewall rules configured
- [ ] Disable HTTP redirections
- [ ] Input sanitization
- [ ] Response validation

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

-------|--------|-------|
| A01 - Broken Access Control | [ ] | __/8 |
| A02 - Cryptographic Failures | [ ] | __/8 |
| A03 - Injection | [ ] | __/7 |
| A04 - Insecure Design | [ ] | __/7 |
| A05 - Security Misconfiguration | [ ] | __/8 |
| A06 - Vulnerable Components | [ ] | __/7 |
| A07 - Auth Failures | [ ] | __/8 |
| A08 - Integrity Failures | [ ] | __/7 |
| A09 - Logging Failures | [ ] | __/8 |
| A10 - SSRF | [ ] | __/6 |

**Overall Compliance:** ___%

-------|------|-------|----------|--------|
| Critical | [Action 1] | [Name] | [Date] | [ ] |
| High | [Action 2] | [Name] | [Date] | [ ] |

---|------|------|--------|
| Security Lead | | | [ ] Approved |
| CISO | | | [ ] Approved |

**Template Version:** 1.0.0

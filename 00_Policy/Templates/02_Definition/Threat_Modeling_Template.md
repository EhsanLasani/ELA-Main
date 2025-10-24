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

---

## METHODOLOGY: STRIDE

**Spoofing | Tampering | Repudiation | Information Disclosure | Denial of Service | Elevation of Privilege**

---

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

---

## 2. DATA FLOW DIAGRAM (DFD)

```
[External User] --HTTPS--> [Load Balancer] ---> [Web App] ---> [API Gateway]
                                                      |
                                                      v
                                              [Database]
```

**Components:**
- External Entity: [Users, External APIs]
- Processes: [Web Server, API, Auth Service]
- Data Stores: [Database, Cache, File Storage]
- Data Flows: [HTTPS requests, SQL queries]

---

## 3. THREAT IDENTIFICATION

### Threat 1: [Threat Name]
**Category:** [Spoofing/Tampering/Repudiation/Info Disclosure/DoS/Elevation]
**Description:** [How the threat manifests]
**Attack Vector:** [How attacker exploits]
**Impact:** [What damage occurs] - **Severity: [Critical/High/Medium/Low]**
**Likelihood:** [High/Medium/Low]
**Risk Score:** [Impact × Likelihood]

**Mitigation:**
- [ ] [Control 1]
- [ ] [Control 2]
**Status:** [Not Started/In Progress/Implemented]
**Owner:** [Name]

---

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

---

### Threat 3: Session Hijacking
**Category:** Spoofing
**Description:** Attacker steals session tokens to impersonate users
**Attack Vector:** XSS, insecure cookies, network sniffing
**Impact:** Unauthorized access to user accounts - **Severity: High**
**Likelihood:** Medium
**Risk Score:** 6/10

**Mitigation:**
- [x] HTTPOnly and Secure cookie flags
- [x] TLS 1.3 for all communications
- [x] CSRF tokens
- [x] Session timeout (15 min inactivity)
**Status:** Implemented
**Owner:** Security Team

---

## 4. THREAT SUMMARY TABLE

| ID | Threat | Category | Severity | Likelihood | Risk | Status | Owner |
|----|--------|----------|----------|------------|------|--------|-------|
| T-001 | [Threat 1] | [Category] | [H/M/L] | [H/M/L] | [Score] | [Status] | [Name] |
| T-002 | SQL Injection | Tampering | Critical | High | 9 | In Progress | Dev |
| T-003 | Session Hijacking | Spoofing | High | Medium | 6 | Implemented | Security |
| T-004 | [Add more] | | | | | | |

---

## 5. ATTACK TREE (Example)

```
Goal: Steal Customer Data
├── SQL Injection
│   ├── Unvalidated input
│   └── Direct DB queries
├── API Exploitation
│   ├── Broken authentication
│   └── Missing rate limiting
└── Social Engineering
    ├── Phishing
    └── Insider threat
```

---

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

---

## 7. RESIDUAL RISKS

**After implementing mitigations:**

| Risk ID | Description | Residual Severity | Acceptance |
|---------|-------------|-------------------|------------|
| R-001 | [Risk description] | [Low/Medium] | [Accepted/Mitigate further] |

---

## 8. ASSUMPTIONS & DEPENDENCIES

**Assumptions:**
- [Assumption 1]
- [Assumption 2]

**Dependencies:**
- [Dependency 1: e.g., Cloud provider security]

---

## 9. REVIEW & UPDATES

- **Next Review Date:** [YYYY-MM-DD]
- **Review Frequency:** Quarterly or after major changes

---

## APPROVAL

| Role | Name | Date | Status |
|------|------|------|--------|
| Security Lead | | | [ ] Approved |
| Solution Architect | | | [ ] Approved |
| CISO | | | [ ] Approved |

**Template Version:** 1.0.0  
**Maintained By:** Information Security Team

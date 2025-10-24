# Security Requirements & Threat Model

## 0. Metadata
- **Artifact ID (catalog.csv):** TMP-DEF-SECURITY-REQ
- **Version:** v1.0
- **Owner:**
- **Security Reviewer:**
- **Linked Ticket / PR:**
- **Project ID:**
- **Date:**

---

## 1. Security Baseline

### 1.1 Authentication Requirements

| Requirement | Implementation | Standard |
|-------------|----------------|----------|
| **Primary Authentication** | OAuth 2.0 + OpenID Connect | RFC 6749, RFC 7519 |
| **Multi-Factor Authentication (MFA)** | Required for privileged accounts | NIST 800-63B |
| **Password Policy** | 12+ characters, no complexity, breach detection | NIST 800-63B |
| **Password Storage** | bcrypt/Argon2 with salt (cost factor >= 10) | OWASP |
| **Session Timeout** | 15 minutes idle, 8 hours absolute | OWASP ASVS |
| **Account Lockout** | 5 failed attempts, 15-minute lockout | OWASP ASVS |
| **Password Reset** | Secure token (6-digit OTP, 10-min expiry) | NIST 800-63B |

### 1.2 Authorization Requirements

| Requirement | Implementation | Standard |
|-------------|----------------|----------|
| **Authorization Model** | Role-Based Access Control (RBAC) | NIST RBAC |
| **Principle** | Least Privilege | ISO 27001 |
| **Authorization Enforcement** | Every request validated | OWASP ASVS 4.0 |
| **Role Assignment** | Manual approval by admin | Internal policy |

**Role Definitions:**

| Role | Permissions | Scope |
|------|-------------|-------|
| **Anonymous** | Read public content | Public pages only |
| **User** | CRUD own data, read shared content | Own resources |
| **Support Agent** | Read customer data (audit logged) | Customer support cases |
| **Admin** | Full CRUD, user management (MFA required) | All resources |

### 1.3 Encryption Requirements

| Data State | Encryption Standard | Key Management | Implementation |
|------------|---------------------|----------------|----------------|
| **Data in Transit** | TLS 1.3 (minimum TLS 1.2) | Certificate Authority | HTTPS everywhere, HSTS enabled |
| **Data at Rest (Database)** | AES-256, Transparent Data Encryption | Azure Key Vault / AWS KMS | Database-level encryption |
| **Data at Rest (File Storage)** | AES-256, Server-Side Encryption | Cloud-native KMS | S3/Blob encryption |
| **Application Secrets** | AES-256 | Centralized secrets vault | Never in code/config |

### 1.4 Network Security

| Control | Implementation | Tool/Service |
|---------|----------------|--------------|
| **Firewall** | Cloud-native firewall, deny-all default | AWS Security Groups / Azure NSG |
| **Web Application Firewall (WAF)** | OWASP Top 10 rules enabled | AWS WAF / Cloudflare |
| **API Gateway** | Rate limiting, IP whitelisting | Kong / AWS API Gateway |
| **DDoS Protection** | Cloud-native DDoS mitigation | AWS Shield / Azure DDoS |

---

## 2. Threat Model (STRIDE Analysis)

### 2.1 STRIDE Methodology

**STRIDE Categories:**
- **S**poofing Identity
- **T**ampering with Data
- **R**epudiation
- **I**nformation Disclosure
- **D**enial of Service
- **E**levation of Privilege

### 2.2 Threat Analysis

| Threat ID | STRIDE | Threat Description | Likelihood | Impact | Risk | Mitigation | Residual Risk | Owner |
|-----------|--------|-------------------|------------|--------|------|------------|---------------|-------|
| T-001 | Spoofing | Attacker impersonates user via stolen credentials | Medium | High | 7 | MFA, session monitoring | Low | Security Office |
| T-002 | Tampering | SQL injection in user input fields | High | Critical | 9 | Parameterized queries, input validation, WAF | Low | Dev Lead |
| T-003 | Tampering | XSS attack via user-generated content | High | High | 8 | Output encoding, CSP headers, sanitization | Low | Dev Lead |
| T-004 | Repudiation | User denies performing action | Low | Medium | 3 | Audit logging with timestamps | Low | Dev Lead |
| T-005 | Info Disclosure | Sensitive data in logs/error messages | Medium | High | 7 | PII redaction, error handling | Low | DevOps |
| T-006 | Info Disclosure | API enumeration exposes user data | Medium | High | 7 | Object-level authorization, rate limiting | Low | Dev Lead |
| T-007 | DoS | API flooding exhausts resources | High | Medium | 6 | Rate limiting, auto-scaling, DDoS protection | Medium | SRE |
| T-008 | Elevation | Broken access control allows unauthorized access | Medium | Critical | 8 | RBAC enforcement, authorization checks | Low | Dev Lead |
| T-009 | Info Disclosure | Insecure direct object references (IDOR) | Medium | High | 7 | Indirect references, authorization checks | Low | Dev Lead |

**Risk Scoring:** Likelihood (1-3) × Impact (1-3) = Risk Score (1-9)

---

## 3. OWASP Top 10 Mitigation

| Risk | Mitigation Strategy | Implementation | Verification |
|------|---------------------|----------------|--------------|
| **A01: Broken Access Control** | Enforce authorization on every request, deny by default | RBAC middleware | Automated security tests |
| **A02: Cryptographic Failures** | Use TLS 1.3, AES-256, proper key management | HTTPS, encryption at rest | Security scan, config review |
| **A03: Injection** | Parameterized queries, input validation, sanitization | ORM usage, prepared statements | SAST, DAST, code review |
| **A04: Insecure Design** | Threat modeling, secure design patterns | STRIDE analysis | Architecture review |
| **A05: Security Misconfiguration** | Secure defaults, hardening, patch management | Infrastructure as Code | Config scanning |
| **A06: Vulnerable Components** | Dependency scanning, SBOM, timely updates | Snyk, Dependabot | CI/CD security gate |
| **A07: Auth & Session Failures** | Strong auth, secure session management, MFA | OAuth 2.0, JWT | Penetration testing |
| **A08: Software & Data Integrity** | Code signing, SBOM, secure CI/CD | Signed commits | Supply chain security |
| **A09: Logging & Monitoring Failures** | Comprehensive logging, alerting, SIEM | Structured logging | Log review, alert testing |
| **A10: Server-Side Request Forgery** | Input validation, network segmentation | URL validation | DAST, manual testing |

---

## 4. Secure Coding Standards

### 4.1 Input Validation
- [ ] Validate all user inputs (whitelist approach)
- [ ] Reject unexpected data formats
- [ ] Limit input length
- [ ] Validate file uploads (type, size, content)

### 4.2 Output Encoding
- [ ] HTML encode output to prevent XSS
- [ ] Content Security Policy (CSP) headers configured
- [ ] X-Content-Type-Options: nosniff header

### 4.3 SQL Injection Prevention
- [ ] Use parameterized queries (prepared statements)
- [ ] Use ORM frameworks properly
- [ ] Never concatenate user input into SQL

### 4.4 Error Handling
- [ ] Generic error messages to users
- [ ] Detailed errors logged securely (server-side)
- [ ] No sensitive data in error messages

---

## 5. Vulnerability Management

### 5.1 Security Scanning in CI/CD

| Scan Type | Tool | Frequency | Gate | Remediation SLA |
|-----------|------|-----------|------|-----------------|
| **SAST** | SonarQube, Semgrep | Every PR | Block on critical/high | Critical: 7 days |
| **SCA** | Snyk, Dependabot | Every PR | Block on critical/high | Critical: 7 days |
| **DAST** | OWASP ZAP, Burp Suite | Nightly on staging | Block prod deploy | Critical: 7 days |
| **Container Scan** | Trivy, Clair | Every build | Block on critical | Critical: 7 days |
| **Secret Scan** | GitGuardian, TruffleHog | Every commit | Block immediately | Immediate rotation |

### 5.2 Vulnerability Remediation SLAs

| Severity | CVSS Score | Remediation Timeline | Approval Required |
|----------|------------|---------------------|-------------------|
| **Critical** | 9.0-10.0 | 7 days | Security Office + CTO |
| **High** | 7.0-8.9 | 30 days | Security Office |
| **Medium** | 4.0-6.9 | 90 days | Technical Lead |
| **Low** | 0.1-3.9 | Next release | Technical Lead |

### 5.3 Penetration Testing
- **Frequency:** Annual (minimum), after major releases
- **Scope:** External pen test (black box), internal (if applicable)
- **Standard:** OWASP Testing Guide, PTES
- **Remediation:** All critical/high findings before production

---

## 6. Secrets Management

### 6.1 Secrets Policy
- [ ] **Never** commit secrets to git repositories
- [ ] **Never** store secrets in code, config files, or plain text env vars
- [ ] Use centralized secrets vault
- [ ] Rotate secrets automatically (90-day maximum)
- [ ] Separate secrets per environment

### 6.2 Secret Types & Storage

| Secret Type | Storage Location | Rotation Frequency | Access Method |
|-------------|------------------|-------------------|---------------|
| Database Passwords | Key Vault | 90 days | App retrieves at startup |
| API Keys (3rd party) | Key Vault | 180 days | SDK integration |
| Encryption Keys | KMS | Annual | Automatic via SDK |
| TLS Certificates | Certificate Manager | 90 days (automated) | Load balancer |

---

## 7. Security Monitoring & Incident Response

### 7.1 Security Events to Log

| Event Type | Log Level | Retention | Monitoring |
|------------|-----------|-----------|------------|
| Authentication success/failure | INFO/WARN | 1 year | Alert on 5 failures in 5 min |
| Authorization failures | WARN | 1 year | Alert on unusual patterns |
| Privilege escalation attempts | ERROR | 1 year | Immediate alert |
| Data access (Restricted data) | INFO | 1 year | Audit review monthly |

### 7.2 Security Incident Response

**Response Procedure:**
1. **Detection** (< 15 min): Automated alerting, SOC monitoring
2. **Containment** (< 1 hour): Isolate affected systems, revoke access
3. **Investigation** (< 4 hours): Root cause analysis, impact assessment
4. **Eradication** (< 24 hours): Remove threat, patch vulnerability
5. **Recovery** (< 48 hours): Restore systems, verify integrity
6. **Post-Incident** (< 1 week): Post-mortem, lessons learned

**Escalation:**
- Severity 1 (Critical): Security Office, CTO, Legal (immediate)
- Severity 2 (High): Security Office, Engineering Manager (< 1 hour)

---

## 8. Compliance & Audit

### 8.1 Security Compliance Mapping

| Standard/Regulation | Applicable Controls | Evidence |
|---------------------|---------------------|----------|
| **ISO 27001** | A.9 (Access Control), A.10 (Cryptography), A.12 (Ops Security) | Access logs, encryption config |
| **OWASP ASVS 4.0** | All Level 2 requirements | Security test results |
| **SOC 2** | CC6 (Logical Access), CC7 (System Operations) | Access reviews, dashboards |
| **PCI-DSS** | Req 3 (Protect stored data), 4 (Encrypt transmission), 6 (Secure systems) | Encryption evidence, scans |

---

## 9. Security Training & Awareness

| Role | Training | Frequency |
|------|----------|-----------|
| **All Employees** | Security awareness, phishing simulation | Annual + quarterly phishing |
| **Developers** | Secure coding, OWASP Top 10 | Annual |
| **DevOps/SRE** | Infrastructure security, incident response | Annual |

---

## 10. Security Review & Sign-off

### 10.1 Security Review Checklist
- [ ] Threat model completed with STRIDE analysis
- [ ] All high/critical threats have mitigation strategies
- [ ] Security baseline requirements defined
- [ ] OWASP Top 10 controls mapped
- [ ] Vulnerability management process established
- [ ] Security monitoring and alerting configured
- [ ] Incident response procedures documented

### 10.2 Sign-off

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Security Office | | | |
| Technical Lead | | | |
| Product Owner | | | |
| Compliance Officer | | | |

---

**Version History:**
| Version | Date | Changes | Author |
|---------|------|---------|--------|
| v1.0 | YYYY-MM-DD | Initial security requirements and threat model | [Name] |

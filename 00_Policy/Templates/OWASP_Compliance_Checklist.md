# OWASP COMPLIANCE CHECKLIST

## Document Control
| Field | Value |
|-------|-------|
| **Project** | [Enter Project Name] |
| **Version** | 1.0.0 |
| **Assessed By** | [Name] |
| **Date** | [YYYY-MM-DD] |

---

## OWASP TOP 10 (2021) COMPLIANCE

### A01:2021 – Broken Access Control
- [ ] Authorization checks on every request
- [ ] RBAC implemented
- [ ] Default deny policy
- [ ] Access control enforced server-side
- [ ] Rate limiting on APIs
- [ ] CORS properly configured
- [ ] Directory listing disabled
- [ ] Metadata and backup files not accessible

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

---

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

---

### A03:2021 – Injection
- [ ] Parameterized queries/prepared statements
- [ ] Input validation (whitelist)
- [ ] Output encoding
- [ ] ORM/framework with injection protection
- [ ] Stored procedures secured
- [ ] NoSQL injection prevention
- [ ] LDAP/OS command injection prevention

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

---

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

---

### A05:2021 – Security Misconfiguration
- [ ] Hardening guides applied
- [ ] Unnecessary features disabled
- [ ] Default credentials changed
- [ ] Error messages don't leak info
- [ ] Security headers configured
- [ ] Patch management process
- [ ] Cloud storage properly secured
- [ ] Automated security scanning

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

---

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

---

### A07:2021 – Identification and Authentication Failures
- [ ] MFA implemented
- [ ] Strong password policy
- [ ] Account lockout mechanism
- [ ] Session management secure
- [ ] No credentials in code
- [ ] Brute force protection
- [ ] Password reset secure
- [ ] Session timeout configured

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

---

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

---

### A09:2021 – Security Logging and Monitoring Failures
- [ ] Security events logged
- [ ] Centralized logging (SIEM)
- [ ] Log integrity protected
- [ ] Alerts for suspicious activity
- [ ] Logs retained (90+ days)
- [ ] Incident response plan
- [ ] Real-time monitoring
- [ ] Log review process

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

---

### A10:2021 – Server-Side Request Forgery (SSRF)
- [ ] URL validation (whitelist)
- [ ] Network segmentation
- [ ] Firewall rules configured
- [ ] Disable HTTP redirections
- [ ] Input sanitization
- [ ] Response validation

**Status:** [ ] Compliant [ ] Partial [ ] Non-Compliant  
**Notes:** []

---

## COMPLIANCE SUMMARY

| Category | Status | Score |
|----------|--------|-------|
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

---

## ACTION ITEMS

| Priority | Item | Owner | Due Date | Status |
|----------|------|-------|----------|--------|
| Critical | [Action 1] | [Name] | [Date] | [ ] |
| High | [Action 2] | [Name] | [Date] | [ ] |

---

## APPROVAL

| Role | Name | Date | Status |
|------|------|------|--------|
| Security Lead | | | [ ] Approved |
| CISO | | | [ ] Approved |

**Template Version:** 1.0.0

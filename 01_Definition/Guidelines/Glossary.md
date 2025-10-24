# Glossary

**Version:** 1.0  
**Last Updated:** Phase 2 (Week 3-4)  
**Purpose:** Common terms and definitions used throughout the ELA project

---

## A

**Acceptance Criteria**  
Specific conditions that must be satisfied for a requirement to be considered complete. Often written in Given/When/Then format for functional requirements or as SLIs/SLOs for non-functional requirements.

**Architecture Decision Record (ADR)**  
Documentation capturing important architectural decisions, the context behind them, and their consequences.

**Asset**  
Anything of value that needs protection, including data, services, and infrastructure components.

---

## B

**Backlog**  
A prioritized list of work items (features, bugs, technical debt) waiting to be implemented.

---

## C

**Compliance**  
Adherence to regulatory requirements, industry standards, or internal policies (e.g., GDPR, SOC 2, ISO 27001).

**Confidentiality**  
Ensuring that information is accessible only to authorized parties.

---

## D

**Data Flow Diagram (DFD)**  
A visual representation showing how data moves through a system, including external entities, processes, data stores, and trust boundaries.

**Definition Phase**  
The first phase of the ELA lifecycle where requirements, threat models, and NFRs are documented before design and implementation.

**DoS (Denial of Service)**  
An attack that makes a system or service unavailable to legitimate users by overwhelming it with traffic or causing it to crash.

---

## E

**Elevation of Privilege**  
A security threat where an attacker gains unauthorized access to higher privilege levels than intended.

**Encryption**  
The process of encoding data so that only authorized parties can read it, used both at rest (stored data) and in transit (data being transmitted).

---

## F

**Functional Requirement**  
A requirement that describes what a system should do, typically expressed as user stories or use cases.

---

## G

**GDPR (General Data Protection Regulation)**  
European Union regulation on data protection and privacy for individuals within the EU and EEA.

---

## I

**Information Disclosure**  
A security threat where sensitive information is exposed to unauthorized parties.

**ISO 27001**  
International standard for information security management systems (ISMS).

---

## M

**MFA (Multi-Factor Authentication)**  
Security mechanism requiring two or more verification factors to gain access to a resource.

**Mitigation**  
Actions taken to reduce the likelihood or impact of a threat or risk.

**MoSCoW Prioritization**  
Prioritization technique categorizing requirements as Must have, Should have, Could have, or Won't have.

---

## N

**NFR (Non-Functional Requirement)**  
A requirement that describes how a system should perform, including performance, security, reliability, maintainability, and usability characteristics.

**NIST (National Institute of Standards and Technology)**  
US government agency that develops standards and guidelines, including the Cybersecurity Framework.

---

## O

**Observability**  
The ability to understand a system's internal state from its external outputs, typically through logging, metrics, and tracing.

**OWASP (Open Web Application Security Project)**  
Nonprofit foundation working to improve software security, known for Top 10 security risks and ASVS.

**OWASP ASVS (Application Security Verification Standard)**  
Standard for web application security requirements and testing.

---

## P

**PII (Personally Identifiable Information)**  
Information that can be used to identify an individual, such as names, email addresses, phone numbers, or social security numbers.

**Priority**  
The relative importance of a requirement, often categorized as P0 (Critical), P1 (High), P2 (Medium), P3 (Low).

---

## R

**RBAC (Role-Based Access Control)**  
Access control approach where permissions are assigned to roles rather than individual users.

**Repudiation**  
A security threat where a user denies performing an action, making it important to have non-repudiable audit trails.

**Requirements Traceability**  
The ability to track requirements through all phases of development, from initial definition to testing and deployment.

**Risk**  
The potential for loss or damage, calculated as Impact × Likelihood.

**RPO (Recovery Point Objective)**  
The maximum acceptable amount of data loss measured in time (e.g., 15 minutes of data).

**RTO (Recovery Time Objective)**  
The maximum acceptable amount of time to restore service after an incident (e.g., 30 minutes downtime).

---

## S

**SAST (Static Application Security Testing)**  
Security testing method that analyzes source code for vulnerabilities without executing it.

**DAST (Dynamic Application Security Testing)**  
Security testing method that tests running applications for vulnerabilities.

**SLI (Service Level Indicator)**  
A quantitative measure of some aspect of service level (e.g., request latency, error rate).

**SLO (Service Level Objective)**  
A target value or range for an SLI (e.g., 99.9% uptime, p95 latency < 200ms).

**SOC 2 (System and Organization Controls 2)**  
Auditing standard for service organizations covering security, availability, processing integrity, confidentiality, and privacy.

**Spoofing**  
A security threat where an attacker impersonates another user, device, or entity.

**STRIDE**  
Threat modeling methodology covering six categories: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege.

---

## T

**Tampering**  
A security threat involving malicious modification of data or code.

**Threat**  
A potential cause of an unwanted incident that may result in harm to a system or organization.

**Threat Modeling**  
Structured process for identifying, prioritizing, and addressing security threats early in the development lifecycle.

**TLS (Transport Layer Security)**  
Cryptographic protocol providing secure communication over a network, successor to SSL.

**Traceability Matrix**  
A table linking requirements to design elements, test cases, and risks to ensure complete coverage.

**Trust Boundary**  
A line in a system architecture where data or control passes from one trust level to another (e.g., from public internet to internal network).

---

## U

**Use Case**  
A description of how a user interacts with a system to achieve a specific goal.

**User Story**  
A requirement format: "As a [user type], I want [functionality], so that [business value]."

---

## V

**Vulnerability**  
A weakness in a system that can be exploited by a threat to cause harm.

---

## References

For more detailed definitions, see:
- [NIST Glossary](https://csrc.nist.gov/glossary)
- [OWASP Glossary](https://owasp.org/www-community/Glossary)
- [ISO/IEC 27000:2018 Vocabulary](https://www.iso.org/standard/73906.html)

---

**Note:** This glossary will be updated as the ELA project evolves. Suggest new terms via the Contribution_Guidelines.md process.

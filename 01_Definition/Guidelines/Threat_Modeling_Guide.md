# Threat Modeling Guide

**Version:** 1.0  
**Last Updated:** Phase 2 (Week 3-4)  
**Purpose:** Guide teams through systematic threat identification and mitigation using STRIDE methodology

---

## Table of Contents
1. [Introduction](#introduction)
2. [When to Conduct Threat Modeling](#when-to-conduct-threat-modeling)
3. [STRIDE Methodology Overview](#stride-methodology-overview)
4. [Step-by-Step Process](#step-by-step-process)
5. [Example Threat Model](#example-threat-model)
6. [Tools and Resources](#tools-and-resources)

---

## 1. Introduction

Threat modeling is a structured approach to identifying, prioritizing, and addressing potential security threats to a system using the STRIDE framework.

### Benefits
- Proactive identification of security risks early in development
- Cost-effective: cheaper to fix vulnerabilities in design than production
- Improves communication between security and development teams
- Creates audit trail for compliance

---

## 2. When to Conduct Threat Modeling

### Required Scenarios
- New system or feature design (before implementation)
- Significant architecture changes
- Integration with external systems
- Handling of sensitive data (PII, financial, health)
- Public-facing applications

---

## 3. STRIDE Methodology Overview

STRIDE is an acronym for six threat categories:

### S - Spoofing Identity
**Definition:** Pretending to be someone or something else  
**Mitigations:** MFA, digital signatures, mutual TLS, certificate pinning

### T - Tampering with Data
**Definition:** Malicious modification of data  
**Mitigations:** Encryption (TLS, at rest), data integrity checks, input validation

### R - Repudiation
**Definition:** Denying an action was performed  
**Mitigations:** Comprehensive logging, digital signatures, immutable audit logs

### I - Information Disclosure
**Definition:** Exposing information to unauthorized parties  
**Mitigations:** Encryption, access controls, secure error handling

### D - Denial of Service
**Definition:** Degrading or denying service availability  
**Mitigations:** Rate limiting, resource quotas, load balancing, auto-scaling

### E - Elevation of Privilege
**Definition:** Gaining unauthorized capabilities  
**Mitigations:** Least privilege principle, RBAC, input validation, security testing

---

## 4. Step-by-Step Process

### Step 1: Define System Scope
1. Identify what is being threat modeled
2. Define boundaries (in scope vs. out of scope)
3. List key stakeholders

### Step 2: Create Data Flow Diagram (DFD)
**Components:**
- External Entities (rectangles): Users, external systems
- Processes (circles): Application components, services
- Data Stores (parallel lines): Databases, file systems
- Data Flows (arrows): How data moves
- Trust Boundaries (dotted lines): Security boundaries

### Step 3: Identify Assets
- Data: PII, financial records, credentials
- Services: APIs, authentication services
- Infrastructure: Servers, databases

### Step 4: Identify Threats Using STRIDE
For each component walk through each STRIDE category

### Step 5: Rate Threats
**Impact:** Critical, High, Medium, Low  
**Likelihood:** Very High, High, Medium, Low  
**Risk Score = Impact × Likelihood**

### Step 6: Define Mitigations
1. Eliminate: Remove vulnerable component
2. Mitigate: Implement security controls
3. Transfer: Use third-party services
4. Accept: Document and accept risk

### Step 7: Validate and Test
- Code Review
- Penetration Testing
- Security Scanning (SAST/DAST)
- Compliance Audit

---

## 5. Example Threat Model

### System: User Authentication Service

#### Identified Threats

| ID | Component | Threat Type | Description | Impact | Likelihood | Risk | Mitigation | Status |
|----|-----------|-------------|-------------|---------|-----------|------|------------|--------|
| T-001 | Login API | Spoofing | Attacker impersonates user | High | High | Critical | Implement MFA | In Progress |
| T-002 | Password | Info Disclosure | Passwords in plaintext | Critical | Medium | Critical | Use bcrypt hashing | Closed |
| T-003 | Login API | DoS | Brute force attack | Medium | High | High | Rate limiting | Closed |

---

## 6. Tools and Resources

### Threat Modeling Tools
- Microsoft Threat Modeling Tool (Free, Windows)
- OWASP Threat Dragon (Free, cross-platform)

### References
- [OWASP Threat Modeling](https://owasp.org/www-community/Threat_Modeling)
- [Microsoft STRIDE Documentation](https://docs.microsoft.com/en-us/azure/security/develop/threat-modeling-tool-threats)
- [Threat Modeling Manifesto](https://www.threatmodelingmanifesto.org/)

---

## Quick Checklist

### Pre-Threat Modeling
- [ ] Identify system scope
- [ ] Assemble cross-functional team
- [ ] Gather architecture diagrams

### During Threat Modeling
- [ ] Create data flow diagram
- [ ] Identify assets and trust boundaries
- [ ] Walk through STRIDE for each component
- [ ] Rate each threat
- [ ] Propose mitigations

### Post-Threat Modeling
- [ ] Document findings
- [ ] Create security tickets
- [ ] Assign owners and deadlines
- [ ] Update requirements document
- [ ] Set next review date

---

**Next Steps:** Use this guide during project Definition phase. Document results in Requirements_Document_Template.md.

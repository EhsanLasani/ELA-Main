# Architecture Decision Record (ADR) Usage Guidelines

## 1. Purpose
This document provides standardized **guidelines for creating, managing, and maintaining Architecture Decision Records (ADRs)** across projects.  
It ensures **transparency**, **traceability**, and **consistency** in architectural decision-making.

---

## 2. When to Create an ADR
Create an ADR whenever:
- A **significant technical or architectural decision** is made.  
- Multiple viable solutions exist, and **trade-offs** must be evaluated.  
- A decision **affects system architecture**, integration, performance, or scalability.  
- A **new technology or pattern** is introduced.  
- A decision **reverses or supersedes** a prior ADR.

---

## 3. ADR Structure
Follow the provided ADR template (see `Architecture_Decision_Record_Template.md`).  
Each ADR must include these sections:

| Section | Description |
|----------|-------------|
| **ADR-[Number]: [Title]** | Unique identifier and concise decision name. |
| **Date & Status** | Include date and status (Proposed, Accepted, Deprecated, Superseded). |
| **Context and Problem Statement** | Explain the problem and business/technical context. |
| **Decision Drivers** | List key factors influencing the decision (e.g., performance, cost). |
| **Considered Options** | Document all explored solutions with pros, cons, and effort. |
| **Decision Outcome** | Describe chosen option, rationale, and consequences. |
| **Implementation Plan** | Outline phases, tasks, timelines, and effort estimates. |
| **Validation** | Define measurable success criteria and monitoring metrics. |
| **Links & Notes** | Reference related ADRs, designs, RFCs, or documentation. |

---

## 4. Numbering and Naming
- Use **sequential numbering** (e.g., `ADR-001`, `ADR-002`, etc.).  
- Keep the title **short and descriptive**, e.g.:
  - `ADR-001: Adopt Microservices Architecture`
  - `ADR-002: Select PostgreSQL for Data Storage`

---

## 5. Status Lifecycle
| Status | Description |
|---------|-------------|
| **Proposed** | Under discussion; not yet approved. |
| **Accepted** | Officially approved for implementation. |
| **Deprecated** | Decision no longer valid but retained for history. |
| **Superseded** | Replaced by a newer ADR (include reference). |

---

## 6. Version Control and Storage
- Store all ADRs in the project’s **`/docs/adr/`** directory or a central **architecture repository**.  
- Use **Git version control** for tracking revisions.  
- Each ADR should be a **standalone Markdown file** (`ADR-###-[title].md`).  
- Link ADRs together when one **supersedes or depends on** another.

---

## 7. Review and Approval Process
1. **Drafting:** Author prepares ADR in “Proposed” state.  
2. **Review:** Peer and architect review for technical soundness.  
3. **Decision Meeting:** Final discussion and consensus.  
4. **Approval:** Status changed to “Accepted.”  
5. **Publication:** File committed to the repository.  

---

## 8. Maintenance and Governance
- Regularly review ADRs (e.g., quarterly) for relevance.  
- Update status when decisions are **deprecated or superseded**.  
- Maintain consistency across teams via the **Enterprise Architecture Office**.  
- Cross-reference ADRs with system design and implementation documentation.

---

## 9. Best Practices
- Keep ADRs **concise**—focus on decision reasoning, not detailed designs.  
- Use **clear, factual language**—avoid vague or subjective terms.  
- Always include **context and consequences**, even for small decisions.  
- Use **links** for supporting discussions or documents instead of embedding them.  
- Encourage **collaborative authorship**—decisions should represent team consensus.  

---

## 10. Example Directory Structure
```
/project-root/
├── docs/
│   ├── adr/
│   │   ├── ADR-001-Adopt-Microservices.md
│   │   ├── ADR-002-Select-PostgreSQL.md
│   │   └── ADR-003-Implement-API-Gateway.md
│   └── architecture/
│       └── diagrams/
```

---

## 11. References
- [Architecture Decision Record Template](./Architecture_Decision_Record_Template.md)
- [Michael Nygard’s ADR Concept](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)
- [ThoughtWorks: Lightweight Architecture Decision Records](https://www.thoughtworks.com/radar/techniques/lightweight-architecture-decision-records)

---

## 12. Ownership
**Maintained By:** Enterprise Architecture Office  
**Version:** 1.0.0  
**Last Updated:** (Insert Date)



---

## 13. Detailed Guidance for Each Template Section

Below is *prescriptive, example‑rich* guidance for every section in the ADR template so authors know exactly what to write.

### ADR-[Number]: [Short Title]
**What to write**
- **Numbering:** Use a zero‑padded sequence (`ADR-001`, `ADR-002`, …). Never reuse numbers.
- **Title style:** Concise, action‑oriented, **specific to the decision**. Avoid vague names.
- **Scope note:** If the decision is scoped to a subsystem, include it in the title.

**Do / Don’t**
- Do: `ADR-017: Adopt gRPC for Inter‑Service Communication in Order Service`
- Don’t: `ADR-017: gRPC`

**Example**
```
ADR-023: Choose PostgreSQL for OLTP Workloads in Commerce Platform
```

---

### Date & Status
**What to write**
- **Date:** ISO‑8601 (`YYYY-MM-DD`) of initial proposal.
- **Status:** One of **Proposed | Accepted | Deprecated | Superseded**.
- **Status transitions:** Record the date and reference ADRs that cause transitions.

**Status meanings**
- **Proposed:** Draft under review; not yet binding.
- **Accepted:** Official decision to implement.
- **Deprecated:** No longer recommended for *new* work; existing usage may remain.
- **Superseded:** Replaced; include link to the successor ADR.

**Example**
```
Date: 2025-10-24
Status: Accepted (Supersedes ADR-011: Choose MySQL for OLTP)
```

---

### Context and Problem Statement
**What to write**
- **Business context:** Drivers, goals, KPIs (e.g., conversion rate, latency SLOs, cost targets).
- **Technical context:** Current architecture, constraints (compliance, runtime, data gravity), assumptions, and **non‑goals**.
- **Problem statement (one sentence):** Crisp description of the decision to make.

**Checklist**
- [ ] Why a decision is needed now
- [ ] In‑scope vs. out‑of‑scope
- [ ] Dependencies/constraints (security, regulatory, vendor, time)

**Example**
```
Problem: We must select a message broker that supports at‑least‑once delivery with <100ms P95 latency for order events at 10k msg/s.
Business Context: Black Friday growth targets require resilient async processing.
Technical Context: Services run on Kubernetes; managed options preferred; PCI scope must be avoided.
Non‑Goals: Redesigning the event schema.
```

---

### Decision Drivers
**What to write**
- List **measurable** factors that will influence the choice. Optionally assign **weights (1–5)**.
- Typical drivers: performance, reliability/SLOs, developer productivity, operability, ecosystem maturity, security/compliance, total cost, time‑to‑market, scalability, vendor lock‑in.

**Example (weighted)**
| Driver | Weight | Target / Evidence |
|---|---:|---|
| P95 latency | 5 | < 100 ms at 10k msg/s |
| Operability | 4 | Managed service, autoscaling |
| Cost | 3 | <$3k/mo at target load |
| Compliance | 5 | Out of PCI scope |

---

### Considered Options
**What to write for EACH option**
- **Name & brief description**
- **Pros / Cons** with evidence (benchmarks, references, prior incidents)
- **Cost/Effort:** Low / Medium / High (explain why)
- **Risks & unknowns:** What could go wrong; mitigation/experiments
- **Proof‑of‑Concept or references:** Links to tests, spikes, or prior use

**Comparison tips**
- Include a **decision matrix** if helpful (drivers × options).
- Avoid straw‑man options; every option should be viable.

**Mini‑example**
```
Option: Apache Kafka (Managed)
Pros: Battle‑tested, strong tooling, at‑least‑once semantics.
Cons: Operational complexity; higher cost at low volumes.
Cost/Effort: Medium (managed), migration tooling available.
Risks: Topic misconfiguration causing retention issues (mitigate with IaC & guardrails).
```

---

### Decision Outcome
**What to write**
- **Chosen option** and **why**, explicitly referencing the top decision drivers.
- **Positive consequences:** Benefits expected immediately and long‑term.
- **Negative consequences / trade‑offs:** Be candid; include mitigations.
- **Scope & sunset:** What’s covered now; plan to revisit or retire.

**Example**
```
Chosen Option: Managed Kafka
Justification: Meets P95 latency (5) and compliance (5) drivers; cost acceptable (3).
Positive: Unified event backbone; strong ecosystem.
Negative: Higher operational overhead → mitigated via Terraform modules & runbooks.
```

---

### Implementation Plan
**What to write**
- **Phases & milestones** with dates; **owners** per task.
- **Dependencies:** Other teams, vendor setup, infra quotas.
- **Migration plan & rollback:** Steps to migrate safely; clear revert path.
- **Comms plan:** Who needs to know (SRE, Security, Support, Stakeholders).

**Example**
```
Phase 1 (Nov 2025): Provision managed Kafka, IaC modules, non‑prod topics.
Phase 2 (Dec 2025): Update Order and Inventory services; shadow traffic.
Phase 3 (Jan 2026): Cutover & decommission old broker.
Rollback: DNS switch back to legacy broker; retain topics for 14 days.
```

---

### Validation
**What to write**
- **Success criteria (SMART):** Quantified targets and deadlines.
- **Monitoring:** Metrics/dashboards, alerts, canary & load tests.
- **Review date:** Schedule a retrospective to confirm outcomes.

**Example**
```
Success: P95 <100 ms at 10k msg/s for 7 consecutive days in prod.
Monitoring: Kafka lag, consumer error rate, end‑to‑end latency dashboard.
Review: 30 days post‑cutover; update ADR status if targets missed.
```

---

### Quick Author Checklist
- [ ] Clear, specific title and number
- [ ] Context includes goals, constraints, non‑goals
- [ ] Drivers are measurable (with weights if used)
- [ ] ≥2 credible options with evidence
- [ ] Outcome ties back to drivers; trade‑offs listed
- [ ] Phased plan with owners, rollback, comms
- [ ] SMART validation + monitoring + review date


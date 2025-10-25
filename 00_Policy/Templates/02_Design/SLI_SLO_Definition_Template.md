
# SLI/SLO Definition Template

---
```yaml
Artifact_ID: TMP-00-SLI_SLO_Definition_T
Artifact_Name: SLI/SLO Definition Template
Artifact_Type: TMP
Version: v1.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Template for defining Service Level Indicators (SLIs) and Service Level Objectives (SLOs) in ELA projects
File_Path: 00_Policy/Templates/02_Design/SLI_SLO_Definition_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/02_Design/SLI_SLO_Definition_Template.md
Phase: Policy
Dependencies: None
Process_Group: Policy
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25
```

| **Field**           | **Value**                                                                 |
|---------------------|---------------------------------------------------------------------------|
| Artifact ID         | TMP-00-SLI_SLO_Definition_T                                               |
| Artifact Name       | SLI/SLO Definition Template                                               |
| Artifact Type       | TMP                                                                       |
| Version             | v1.0                                                                      |
| Status              | Draft                                                                     |
| Owner               | Enterprise Architecture Office (EAO)                                      |
| Last Updated        | 2025-10-25                                                                |
| Description         | Template for defining Service Level Indicators (SLIs) and Service Level Objectives (SLOs) in ELA projects |
| File Path           | 00_Policy/Templates/02_Design/SLI_SLO_Definition_Template.md              |
| GitHub URL          | https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/02_Design/SLI_SLO_Definition_Template.md |
| Phase               | Policy                                                                    |
| Dependencies        | None                                                                      |
| Process Group       | Policy                                                                    |
| Process Step        | N/A                                                                       |
| Template Source     | ELA-Template                                                              |
| Validation Status   | Pending                                                                   |
| Comments            | Auto-generated on 2025-10-25                                              |

---

## How to Use This Template
- Use this template to define SLIs and SLOs for your service or system.
- Complete each section with actionable, measurable indicators and objectives.
- Review and update as the system evolves.

---


## 1. Service Level Indicators (SLIs)
Define and document the key SLIs for your service. Include definitions, measurement methods, targets, and data sources.

### Example SLIs
| SLI Name      | Definition                        | Measurement/Formula                        | Target         | Data Source           |
|-------------- |-----------------------------------|--------------------------------------------|----------------|-----------------------|
| Availability  | % successful requests             | (success/total) × 100                      | 99.9%          | Load balancer metrics |
| Latency P50   | 50th percentile response time     | P50 < 200ms                                | < 200ms        | APM/monitoring        |
| Latency P95   | 95th percentile response time     | P95 < 500ms                                | < 500ms        | APM/monitoring        |
| Latency P99   | 99th percentile response time     | P99 < 1000ms                               | < 1000ms       | APM/monitoring        |
| Error Rate    | % failed requests                 | (errors/total) × 100                       | < 0.1%         | App logs              |
| Throughput    | Requests processed per second     | total requests / time period                | > 1000 req/sec | Load balancer metrics |


## 2. Service Level Objectives (SLOs)
Define SLOs for your service, including targets, measurement windows, and error budgets.

### Example SLOs
| Metric         | Target     | Measurement Window | Error Budget         |
|--------------- |----------- |-------------------|--------------------- |
| Uptime         | 99.9%      | 30-day rolling    | 43.2 min/month       |
| Uptime         | 99.95%     | 30-day rolling    | 21.6 min/month       |
| P50 Latency    | < 200ms    | 7-day rolling     | N/A                  |
| P95 Latency    | < 500ms    | 7-day rolling     | N/A                  |
| P99 Latency    | < 1000ms   | 7-day rolling     | N/A                  |
| Error Rate     | < 0.1%     | 24-hour rolling   | N/A                  |
| Success Rate   | > 99.9%    | 24-hour rolling   | N/A                  |


## 3. Error Budget
Document how error budgets are calculated, tracked, and enforced.

### Example Calculation
- **Formula:** (1 - SLO) × Total Requests
- **Example:** SLO: 99.9%, Total Requests/Month: 100M, Error Budget: 100,000 errors

### Error Budget Policy
- [ ] Budget tracked continuously
- [ ] Alerts when 50% consumed
- [ ] Feature freeze when 90% consumed
- [ ] Incident review when exhausted


## 4. Monitoring & Alerting
Describe how SLIs/SLOs are monitored and how alerts are configured.

### SLI Monitoring
- [ ] Real-time dashboard
- [ ] Historical trends
- [ ] Burn rate alerts
- [ ] Budget consumption tracking

### Alert Configuration
| Condition        | Threshold         | Action         |
|------------------|------------------|----------------|
| SLO at risk      | 75% budget used  | Warning        |
| SLO breach       | 90% budget used  | Page on-call   |
| Critical breach  | 100% budget used | Escalate       |


## 5. Reporting
Describe reporting requirements for SLOs and stakeholder communication.

### SLO Reports
- [ ] Weekly SLO status
- [ ] Monthly compliance report
- [ ] Quarterly trend analysis
- [ ] Annual SLO review

### Stakeholder Communication
- [ ] Executive dashboards
- [ ] Team metrics
- [ ] Customer-facing status


## 6. Approval
| Role                | Name     | Signature   | Date  |
|---------------------|----------|-------------|-------|
| SRE Lead            | [Name]   | [Signature] | [Date]|
| Engineering Manager | [Name]   | [Signature] | [Date]|

---

## Revision History
| Version | Date       | Author                  | Changes         |
|---------|------------|-------------------------|-----------------|
| 1.0.0   | 2025-10-25 | Enterprise Architecture | Initial template|

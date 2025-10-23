# SLI/SLO Definition Template

## Document Control
| Field | Value |
|-------|-------|
| Document ID | ELA-SLI-SLO-001 |
| Version | 1.0.0 |
| Owner | SRE Team |
| Last Updated | [Date] |

## 1. Service Level Indicators (SLIs)

### 1.1 Availability SLI
**Definition:** Percentage of successful requests
**Measurement:** (successful requests / total requests) × 100
**Target:** 99.9%
**Data Source:** Load balancer metrics

### 1.2 Latency SLI
**Definition:** Response time percentiles
**Measurement:**
- P50: < 200ms
- P95: < 500ms
- P99: < 1000ms
**Data Source:** APM/monitoring system

### 1.3 Error Rate SLI
**Definition:** Percentage of failed requests
**Measurement:** (error responses / total requests) × 100
**Target:** < 0.1%
**Data Source:** Application logs

### 1.4 Throughput SLI
**Definition:** Requests processed per second
**Measurement:** Total requests / time period
**Target:** > 1000 req/sec
**Data Source:** Load balancer metrics

## 2. Service Level Objectives (SLOs)

### 2.1 Availability SLO
| Metric | Target | Measurement Window | Error Budget |
|--------|--------|-------------------|---------------|
| Uptime | 99.9% | 30-day rolling | 43.2 min/month |
| Uptime | 99.95% | 30-day rolling | 21.6 min/month |

### 2.2 Performance SLO
| Metric | Target | Measurement Window |
|--------|--------|--------------------|
| P50 Latency | < 200ms | 7-day rolling |
| P95 Latency | < 500ms | 7-day rolling |
| P99 Latency | < 1000ms | 7-day rolling |

### 2.3 Reliability SLO
| Metric | Target | Measurement Window |
|--------|--------|--------------------|
| Error Rate | < 0.1% | 24-hour rolling |
| Success Rate | > 99.9% | 24-hour rolling |

## 3. Error Budget

### 3.1 Error Budget Calculation
**Formula:** (1 - SLO) × Total Requests

**Example:**
- SLO: 99.9%
- Total Requests/Month: 100M
- Error Budget: 100,000 errors

### 3.2 Error Budget Policy
- [ ] Budget tracked continuously
- [ ] Alerts when 50% consumed
- [ ] Feature freeze when 90% consumed
- [ ] Incident review when exhausted

## 4. Monitoring & Alerting

### 4.1 SLI Monitoring
- [ ] Real-time dashboard
- [ ] Historical trends
- [ ] Burn rate alerts
- [ ] Budget consumption tracking

### 4.2 Alert Configuration
| Condition | Threshold | Action |
|-----------|-----------|--------|
| SLO at risk | 75% budget used | Warning |
| SLO breach | 90% budget used | Page on-call |
| Critical breach | 100% budget used | Escalate |

## 5. Reporting

### 5.1 SLO Reports
- [ ] Weekly SLO status
- [ ] Monthly compliance report
- [ ] Quarterly trend analysis
- [ ] Annual SLO review

### 5.2 Stakeholder Communication
- [ ] Executive dashboards
- [ ] Team metrics
- [ ] Customer-facing status

## 6. Approval

| Role | Name | Signature | Date |
|------|------|-----------|------|
| SRE Lead | [Name] | [Signature] | [Date] |
| Engineering Manager | [Name] | [Signature] | [Date] |

---

**Template Version:** 1.0.0  
**Maintained By:** SRE Team  
**Document Classification:** Internal Use

# Runbook Template

## Document Control
| Field | Value |
|-------|-------|
| Document ID | ELA-RUNBOOK-001 |
| Version | 1.0.0 |
| Created Date | [Date] |
| Last Updated | [Date] |
| Owner | Operations Team |
| On-Call Contact | [Name/Phone] |
| Escalation Contact | [Name/Phone] |
| Approval Status | [Draft/Review/Approved] |

## 1. System Overview

### 1.1 Service Description
**Service Name:** [Service Name]  
**Purpose:** [Brief description of what the service does]  
**Business Criticality:** [Critical/High/Medium/Low]  
**Service Tier:** [Tier 1/2/3]

### 1.2 Service Dependencies
| Dependency | Type | Criticality | Contact |
|------------|------|-------------|----------|
| [Service/System] | [Internal/External] | [High/Med/Low] | [Contact Info] |

### 1.3 Service Owners
| Role | Name | Contact | Availability |
|------|------|---------|---------------|
| Service Owner | [Name] | [Email/Phone] | [Hours] |
| Technical Lead | [Name] | [Email/Phone] | [Hours] |
| On-Call Engineer | [Rotation] | [PagerDuty/etc] | 24/7 |
| Escalation Manager | [Name] | [Email/Phone] | Business hours |

## 2. Service Architecture

### 2.1 Architecture Diagram
```
[Insert architecture diagram]
```

### 2.2 Components
| Component | Technology | Location | Purpose |
|-----------|------------|----------|----------|
| [Name] | [Tech] | [Region/AZ] | [Purpose] |

### 2.3 Infrastructure Details
- **Cloud Provider:** [AWS/Azure/GCP/On-prem]
- **Region:** [Region]
- **Environment:** [Dev/Staging/Production]
- **Load Balancer:** [Details]
- **Database:** [Details]
- **Cache:** [Details]

## 3. Access and Authentication

### 3.1 Access Requirements
- [ ] VPN Access: [Instructions]
- [ ] SSH Keys: [Key location and setup]
- [ ] AWS/Cloud Console: [Account details]
- [ ] Database Access: [Connection details]
- [ ] Monitoring Dashboards: [URLs]
- [ ] Logging Systems: [URLs]

### 3.2 Service Accounts
| Account | Purpose | Access Level | Credential Location |
|---------|---------|--------------|---------------------|
| [Account] | [Purpose] | [Read/Write/Admin] | [Vault/Secret Manager] |

### 3.3 Access Procedures
```bash
# SSH Access
ssh -i [key-file] [user]@[host]

# Database Access
mysql -h [host] -u [user] -p

# Kubernetes Access
kubectl config use-context [context]
```

## 4. Monitoring and Alerting

### 4.1 Monitoring Dashboards
- **Primary Dashboard:** [URL]
- **Metrics Dashboard:** [URL]
- **Logs Dashboard:** [URL]
- **APM Dashboard:** [URL]

### 4.2 Key Metrics
| Metric | Normal Range | Warning Threshold | Critical Threshold |
|--------|--------------|-------------------|--------------------|
| CPU Usage | < 70% | 70-85% | > 85% |
| Memory Usage | < 75% | 75-90% | > 90% |
| Response Time | < 200ms | 200-500ms | > 500ms |
| Error Rate | < 0.1% | 0.1-1% | > 1% |
| Request Rate | [Normal] | [High] | [Critical] |

### 4.3 Health Check Endpoints
- Health Check: `GET /health`
- Readiness: `GET /ready`
- Liveness: `GET /alive`
- Metrics: `GET /metrics`

### 4.4 Alert Channels
- **PagerDuty:** [Integration details]
- **Slack:** [Channel]
- **Email:** [Distribution list]
- **SMS:** [Emergency contacts]

## 5. Common Operations

### 5.1 Service Start
```bash
# Start service
systemctl start [service-name]

# Verify service is running
systemctl status [service-name]

# Check logs
tail -f /var/log/[service]/[log-file]
```

**Verification Steps:**
- [ ] Service process running
- [ ] Health check returns 200 OK
- [ ] Metrics being collected
- [ ] No errors in logs

### 5.2 Service Stop
```bash
# Graceful shutdown
systemctl stop [service-name]

# Force stop if needed
kill -9 [PID]

# Verify stopped
ps aux | grep [service-name]
```

**Post-Stop Checks:**
- [ ] No lingering processes
- [ ] Ports released
- [ ] Connections closed

### 5.3 Service Restart
```bash
# Graceful restart
systemctl restart [service-name]

# Reload configuration only
systemctl reload [service-name]
```

**Restart Verification:**
- [ ] Service started successfully
- [ ] Configuration loaded
- [ ] Health check passing
- [ ] Traffic routing normally

### 5.4 Rolling Restart (Zero Downtime)
```bash
# For Kubernetes
kubectl rollout restart deployment/[deployment-name]

# Verify rollout
kubectl rollout status deployment/[deployment-name]

# For manual rolling restart
for server in server1 server2 server3; do
    ssh $server "systemctl restart [service]"
    sleep 30
    # Verify health before proceeding
done
```

## 6. Deployment Procedures

### 6.1 Pre-Deployment Checklist
- [ ] Change request approved
- [ ] Backup completed
- [ ] Rollback plan documented
- [ ] Stakeholders notified
- [ ] Maintenance window confirmed
- [ ] Deployment team assembled

### 6.2 Deployment Steps
```bash
# 1. Pull latest code
git pull origin [branch]

# 2. Build application
[build command]

# 3. Run tests
[test command]

# 4. Deploy to staging
[staging deploy command]

# 5. Verify staging
[verification steps]

# 6. Deploy to production
[production deploy command]

# 7. Verify production
[verification steps]
```

### 6.3 Post-Deployment Verification
- [ ] Application version correct
- [ ] Health checks passing
- [ ] Key functionality tested
- [ ] Metrics showing normal values
- [ ] No increase in error rates
- [ ] Logs showing no anomalies

### 6.4 Rollback Procedure
```bash
# Immediate rollback
[rollback command]

# Verify rollback
[verification steps]

# Restore database if needed
[database rollback steps]
```

## 7. Incident Response

### 7.1 Incident Severity Levels
| Severity | Description | Response Time | Escalation |
|----------|-------------|---------------|-------------|
| P1 - Critical | Service down, major impact | Immediate | Escalate immediately |
| P2 - High | Degraded performance | 15 minutes | Escalate if not resolved in 30 min |
| P3 - Medium | Minor issues, workaround exists | 1 hour | Escalate if not resolved in 4 hours |
| P4 - Low | No immediate impact | Next business day | No escalation needed |

### 7.2 Incident Response Steps
1. **Acknowledge Alert**
   - Acknowledge in PagerDuty/alerting system
   - Join incident response channel

2. **Assess Situation**
   - Check dashboards and metrics
   - Review recent changes
   - Identify affected components

3. **Initial Communication**
   - Notify stakeholders
   - Post status update
   - Establish communication channel

4. **Triage and Investigate**
   - Follow troubleshooting guide
   - Collect relevant logs
   - Identify root cause

5. **Implement Fix**
   - Apply remediation
   - Verify fix effectiveness
   - Monitor for recurring issues

6. **Post-Incident**
   - Document incident timeline
   - Update runbook
   - Schedule post-mortem

### 7.3 Escalation Path
```
L1: On-Call Engineer → (15 min)
L2: Senior Engineer → (30 min)
L3: Engineering Manager → (1 hour)
L4: Director/VP Engineering
```

## 8. Troubleshooting Guide

### 8.1 Service Won't Start

**Symptoms:**
- Service fails to start
- Process dies immediately
- Health check failing

**Diagnosis:**
```bash
# Check service status
systemctl status [service-name]

# Check logs
journalctl -u [service-name] -n 100

# Check port availability
netstat -tuln | grep [port]

# Check disk space
df -h

# Check dependencies
[dependency check commands]
```

**Common Causes:**
- Port already in use
- Missing configuration file
- Database connection failure
- Insufficient permissions
- Disk space full

**Resolution:**
```bash
# Kill process on port
kill $(lsof -t -i:[port])

# Fix permissions
chown [user]:[group] [file]

# Free up disk space
[cleanup commands]
```

### 8.2 High CPU Usage

**Symptoms:**
- CPU usage > 85%
- Slow response times
- Timeout errors

**Diagnosis:**
```bash
# Check CPU usage
top -bn1 | head -20

# Find CPU-intensive processes
ps aux --sort=-%cpu | head

# Check thread count
ps -eLf | grep [service] | wc -l
```

**Resolution:**
- Scale horizontally (add instances)
- Restart service if memory leak suspected
- Review and optimize code
- Check for runaway processes

### 8.3 High Memory Usage

**Symptoms:**
- Memory usage > 90%
- OOM killer triggered
- Service crashes

**Diagnosis:**
```bash
# Check memory usage
free -h

# Check process memory
ps aux --sort=-%mem | head

# Check for memory leaks
[memory profiling commands]
```

**Resolution:**
- Restart service to clear memory
- Scale up (increase memory)
- Fix memory leaks in code
- Adjust cache sizes

### 8.4 Database Connection Issues

**Symptoms:**
- Connection timeout errors
- Too many connections error
- Slow queries

**Diagnosis:**
```bash
# Test database connectivity
mysql -h [host] -u [user] -p -e "SELECT 1"

# Check connection count
SHOW PROCESSLIST;

# Check slow queries
SHOW FULL PROCESSLIST;
```

**Resolution:**
- Increase connection pool size
- Kill long-running queries
- Restart database connections
- Scale database if needed

## 9. Maintenance Procedures

### 9.1 Regular Maintenance Tasks
- [ ] Log rotation and cleanup
- [ ] Database optimization
- [ ] Cache clearing
- [ ] Certificate renewal
- [ ] Security patches
- [ ] Dependency updates

### 9.2 Backup and Restore
```bash
# Create backup
[backup command]

# Verify backup
[verification command]

# Restore from backup
[restore command]
```

## 10. Performance Tuning

### 10.1 Optimization Checklist
- [ ] Database query optimization
- [ ] Cache hit ratio > 85%
- [ ] Connection pool sizing
- [ ] Thread pool configuration
- [ ] JVM/runtime tuning
- [ ] Load balancer optimization

## 11. Security Operations

### 11.1 Security Checks
- [ ] Review access logs
- [ ] Check for suspicious activity
- [ ] Verify firewall rules
- [ ] Validate SSL certificates
- [ ] Review security patches

### 11.2 Security Incident Response
1. Isolate affected systems
2. Collect evidence
3. Notify security team
4. Follow incident response plan

## 12. Disaster Recovery

### 12.1 DR Activation
```bash
# Failover to DR site
[failover commands]

# Verify DR functionality
[verification steps]
```

### 12.2 Failback Procedure
```bash
# Return to primary site
[failback commands]

# Synchronize data
[sync commands]
```

## 13. Change Log

| Date | Version | Author | Changes |
|------|---------|--------|----------|
| [Date] | 1.0.0 | [Name] | Initial release |

## 14. Approval

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Operations Lead | [Name] | [Signature] | [Date] |
| Technical Lead | [Name] | [Signature] | [Date] |
| Service Owner | [Name] | [Signature] | [Date] |

---

**Template Version:** 1.0.0  
**Maintained By:** Operations Team  
**Next Review Date:** [Date + 3 months]  
**Document Classification:** Internal Use

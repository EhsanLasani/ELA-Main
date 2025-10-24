# Artifact Metadata Standards and Catalog Guidelines

## 0. Metadata

- **Artifact ID (catalog.csv):** DOC-POL-ARTIFACT_METADATA
- **Version:** v1.0
- **Owner:** Enterprise Architecture Office (EAO)
- **Custodian:** Enterprise Architecture Office (EAO)
- **Effective Date:** 2025-10-24
- **Review Cycle:** Semi-annual
- **Linked Ticket / PR:**

---

## 1. Purpose

This document defines the **mandatory metadata standards** and **artifact type classifications** for all artifacts in the ELA-Main repository and derivative projects. It ensures:

- **Consistency** in artifact identification and cataloging
- **Traceability** from requirements through implementation
- **Discoverability** of templates, guidelines, and validation checklists
- **Governance** through standardized metadata fields
- **Automation** of catalog management via CI/CD workflows
- - **Structured Documents** through standardized YAML front matter and type-specific sections (see [Document Structure Guidelines](./Document_Structure_Guidelines.md))

---

## 2. Scope

This standard applies to:

- **All artifacts** in ELA-Main repository: policies, templates, guidelines, checklists, workflows, scripts, diagrams
- **catalog.csv**: The central artifact registry
- **All project teams** creating or maintaining ELA artifacts
- **Automated workflows** that validate and update the catalog

---

## 3. Artifact Type Definitions

### 3.1 DOC - Documentation

**Definition:** Informational documents that explain policies, procedures, concepts, or provide guidance. Not meant to be filled out or executed.

**Subtypes:**
- **DOC-POL** = Policy Documents
- **DOC-GDL** = Guideline Documents
- **DOC-REF** = Reference Documentation
- **DOC-README** = README files

**Mandatory Metadata Fields:**

| Field | Format | Example | Description |
|-------|--------|---------|-------------|
| **Artifact ID** | `DOC-[PHASE]-[NAME]` | `DOC-POL-ELA_DEV` | Unique identifier |
| **Version** | Semantic (v#.#) | `v2.0` | Version number |
| **Owner** | Role name | `Enterprise Architecture Office (EAO)` | Responsible team |
| **Status** | Enum | `Active` | Draft \| Active \| Under Review \| Archived \| Deprecated |
| **Last_Updated** | YYYY-MM-DD | `2025-10-24` | Last modification date |
| **Artifact_Type** | Fixed | `DOC` | Type classification |
| **Description** | Text (1-2 sentences) | Enterprise development policy framework | Purpose statement |
| **Phase** | Enum (optional) | `Policy` | Lifecycle phase if applicable |
| **Dependencies** | Artifact IDs | `None` or `DOC-POL-X` | Required artifacts |

**Optional Metadata:**
- **Custodian:** Specific team maintaining the document
- **Effective_Date:** When policy/doc takes effect
- **Review_Cycle:** Annual \| Semi-annual \| Quarterly
- **Compliance_Standards:** ISO 27001, OWASP ASVS, SOC 2, etc.
- **Approved_By:** Role/person who approved
- **Linked_PR:** PR number or GitHub URL

---

### 3.2 TMP - Template

**Definition:** Structured documents meant to be copied and filled out for specific projects/tasks. Contains placeholders and instructions.

**Subtypes:**
- **TMP-DEF** = Definition Phase Templates
- **TMP-DES** = Design Phase Templates
- **TMP-DEV** = Development Phase Templates
- **TMP-TST** = Testing Phase Templates
- **TMP-DEP** = Deployment Phase Templates
- **TMP-OPS** = Operations Phase Templates
- **TMP-CHG** = Change Management Templates

**Mandatory Metadata Fields:**

| Field | Format | Example | Description |
|-------|--------|---------|-------------|
| **Artifact ID** | `TMP-[PHASE]-[NAME]` | `TMP-DEF-PROJECT_PLAN` | Unique identifier |
| **Version** | Semantic (v#.#) | `v1.0` | Version number |
| **Owner** | Role name | `Business Analysis Team` | Responsible team |
| **Status** | Enum | `Active` | Draft \| Active \| Under Review \| Deprecated |
| **Phase** | Enum | `Definition` | Lifecycle phase |
| **Last_Updated** | YYYY-MM-DD | `2025-10-24` | Last modification date |
| **Artifact_Type** | Fixed | `TMP` | Type classification |
| **Description** | Text (1-2 sentences) | Comprehensive project planning template | Purpose statement |
| **Dependencies** | Artifact IDs | `TMP-DEF-STAKEHOLDER` | Templates required first |

**Optional Metadata:**
- **Template_Type:** Form \| Checklist \| Document \| Diagram \| Spreadsheet
- **Output_Format:** .md \| .docx \| .xlsx \| .drawio \| .csv
- **Completion_Time:** Estimated minutes/hours
- **Required_Tools:** Software needed

---

### 3.3 GDL - Guideline

**Definition:** Best practices, how-to guides, and instructional documents that provide step-by-step guidance or recommendations.

**Subtypes:**
- **GDL-DEF** = Definition Phase Guidelines
- **GDL-DES** = Design Phase Guidelines
- **GDL-DEV** = Development Phase Guidelines
- **GDL-SEC** = Security Guidelines
- **GDL-PROC** = Process Guidelines

**Mandatory Metadata Fields:**

| Field | Format | Example | Description |
|-------|--------|---------|-------------|
| **Artifact ID** | `GDL-[PHASE]-[NAME]` | `GDL-DEF-NFR_GUIDELINES` | Unique identifier |
| **Version** | Semantic (v#.#) | `v1.0` | Version number |
| **Owner** | Role name | `Solution Architecture Team` | Responsible team |
| **Status** | Enum | `Active` | Draft \| Active \| Under Review \| Deprecated |
| **Phase** | Enum | `Definition` | Applicable lifecycle phase |
| **Last_Updated** | YYYY-MM-DD | `2025-10-24` | Last modification date |
| **Artifact_Type** | Fixed | `GDL` | Type classification |
| **Description** | Text (1-2 sentences) | Guidelines for defining non-functional requirements | Purpose statement |

**Optional Metadata:**
- **Guideline_Type:** Process \| Technical \| Security \| Quality \| Compliance
- **Target_Audience:** Developers \| Architects \| QA \| Security \| All
- **Mandatory:** Yes \| No \| Conditional
- **Related_Standards:** ISO, OWASP, NIST references

---

### 3.4 VAL - Validation Checklist

**Definition:** Checklists used to validate completeness, quality, or compliance of deliverables. Used for quality gates and phase exits.

**Subtypes:**
- **VAL-DEF** = Definition Phase Validation
- **VAL-DES** = Design Phase Validation
- **VAL-DEV** = Development Phase Validation
- **VAL-SEC** = Security Validation
- **VAL-ACC** = Accessibility Validation

**Mandatory Metadata Fields:**

| Field | Format | Example | Description |
|-------|--------|---------|-------------|
| **Artifact ID** | `VAL-[PHASE]-[NAME]` | `VAL-DEF-EXIT_CHECKLIST` | Unique identifier |
| **Version** | Semantic (v#.#) | `v1.0` | Version number |
| **Owner** | Role name | `QA Team` | Responsible team |
| **Status** | Enum | `Active` | Draft \| Active \| Under Review \| Deprecated |
| **Phase** | Enum | `Definition` | Applicable lifecycle phase |
| **Last_Updated** | YYYY-MM-DD | `2025-10-24` | Last modification date |
| **Artifact_Type** | Fixed | `VAL` | Type classification |
| **Description** | Text (1-2 sentences) | Exit criteria checklist for Definition phase | Purpose statement |

**Optional Metadata:**
- **Validation_Type:** Quality Gate \| Phase Exit \| Compliance \| Security
- **Gating:** Blocking \| Non-blocking \| Advisory
- **Pass_Criteria:** Percentage or count required
- **Responsible_Roles:** Who performs validation

---

### 3.5 WFL - Workflow

**Definition:** Automated workflows and CI/CD pipeline definitions that execute actions, validations, or deployments.

**Subtypes:**
- **WFL-CI** = Continuous Integration Workflows
- **WFL-CD** = Continuous Deployment Workflows
- **WFL-VAL** = Validation Workflows
- **WFL-SEC** = Security Scanning Workflows
- **WFL-SYNC** = Synchronization Workflows

**Mandatory Metadata Fields:**

| Field | Format | Example | Description |
|-------|--------|---------|-------------|
| **Artifact ID** | `WFL-[TYPE]-[NAME]` | `WFL-VAL-CATALOG_LINT` | Unique identifier |
| **Version** | Semantic (v#.#) | `v1.0` | Version number |
| **Owner** | Role name | `DevOps Team` | Responsible team |
| **Status** | Enum | `Active` | Active \| Disabled \| Under Review \| Deprecated |
| **Last_Updated** | YYYY-MM-DD | `2025-10-24` | Last modification date |
| **Artifact_Type** | Fixed | `WFL` | Type classification |
| **Description** | Text (1-2 sentences) | Lints catalog.csv for format and consistency | Purpose statement |

**Optional Metadata:**
- **Trigger:** push \| pull_request \| schedule \| workflow_dispatch
- **Platform:** GitHub Actions \| Azure DevOps \| Jenkins
- **Schedule:** Cron expression if scheduled
- **Runs_On:** ubuntu-latest \| windows-latest \| self-hosted

---

### 3.6 SCR - Script

**Definition:** Executable scripts (PowerShell, Bash, Python, etc.) that automate tasks, setup, or operations.

**Subtypes:**
- **SCR-SETUP** = Setup/Installation Scripts
- **SCR-SYNC** = Synchronization Scripts
- **SCR-DEPLOY** = Deployment Scripts
- **SCR-UTIL** = Utility Scripts

**Mandatory Metadata Fields:**

| Field | Format | Example | Description |
|-------|--------|---------|-------------|
| **Artifact ID** | `SCR-[TYPE]-[NAME]` | `SCR-SYNC-GIT_SYNC` | Unique identifier |
| **Version** | Semantic (v#.#) | `v1.0` | Version number |
| **Owner** | Role name | `DevOps Team` | Responsible team |
| **Status** | Enum | `Active` | Active \| Deprecated \| Under Review |
| **Last_Updated** | YYYY-MM-DD | `2025-10-24` | Last modification date |
| **Artifact_Type** | Fixed | `SCR` | Type classification |
| **Description** | Text (1-2 sentences) | PowerShell script to sync Git repositories | Purpose statement |

**Optional Metadata:**
- **Script_Language:** PowerShell \| Bash \| Python \| Node.js
- **Platform:** Windows \| Linux \| macOS \| Cross-platform
- **Required_Permissions:** Admin \| User \| Elevated
- **Execution_Context:** Local \| CI/CD \| Server

---

### 3.7 IMG - Image/Diagram

**Definition:** Visual assets including architecture diagrams, flowcharts, screenshots, and illustrations.

**Subtypes:**
- **IMG-ARCH** = Architecture Diagrams
- **IMG-FLOW** = Flow Diagrams
- **IMG-SCREEN** = Screenshots

**Mandatory Metadata Fields:**

| Field | Format | Example | Description |
|-------|--------|---------|-------------|
| **Artifact ID** | `IMG-[TYPE]-[NAME]` | `IMG-ARCH-SYS_INT_BLUEPRINT` | Unique identifier |
| **Version** | Semantic (v#.#) | `v1.0` | Version number |
| **Owner** | Role name | `Enterprise Architecture Office (EAO)` | Responsible team |
| **Status** | Enum | `Active` | Active \| Deprecated |
| **Last_Updated** | YYYY-MM-DD | `2025-10-24` | Last modification date |
| **Artifact_Type** | Fixed | `IMG` | Type classification |
| **Description** | Text (1-2 sentences) | Visual systems integration architecture diagram | Purpose statement |

**Optional Metadata:**
- **Image_Format:** PNG \| SVG \| JPEG
- **Source_File:** Link to editable source (.drawio, .mmd, .pptx)
- **Related_Documentation:** Which docs reference this image

---

## 4. Common Metadata Fields (All Artifact Types)

### 4.1 Always Required

1. **ID** - Unique identifier following format conventions
2. **Artifact_Name** - Human-readable filename
3. **File_Path** - Exact relative path in repository
4. **Artifact_Type** - DOC | TMP | GDL | VAL | WFL | SCR | IMG
5. **Version** - Semantic versioning (v#.#)
6. **Status** - Current state
7. **Owner** - Responsible team/role
8. **Last_Updated** - YYYY-MM-DD format
9. **GitHub_URL** - Full blob URL to main branch
10. **Description** - One-line purpose statement (1-2 sentences)

### 4.2 Conditionally Required

11. **Phase** - If phase-specific: Definition | Design | Development | Testing | Deployment | Operations | Change Management | Policy
12. **Dependencies** - If depends on other artifacts (comma-separated IDs)

### 4.3 Optional But Recommended

13. **Linked_PR** - GitHub PR URL or number
14. **Remarks** - Special notes, warnings, deprecation info
15. **Tags** - Searchable keywords (comma-separated)

---

## 5. Catalog.csv Structure

### 5.1 Column Definitions

| Column Name | Data Type | Required | Example | Description |
|-------------|-----------|----------|---------|-------------|
| ID | String | Yes | `DOC-POL-ELA_DEV` | Unique artifact identifier |
| Artifact_Name | String | Yes | `ELA Development Policy.md` | Filename without path |
| File_Path | String | Yes | `00_Policy/ELA_Development_Policy.md` | Relative path from repo root |
| Phase | String | Conditional | `Policy` | Lifecycle phase (if applicable) |
| Version | String | Yes | `v2.0` | Semantic version |
| Status | String | Yes | `Active` | Current status |
| Owner | String | Yes | `Enterprise Architecture Office (EAO)` | Responsible team/role |
| Last_Updated | Date | Yes | `2025-10-24` | YYYY-MM-DD format |
| GitHub_URL | URL | Yes | `https://github.com/...` | Full blob URL |
| Linked_PR | String | No | `#123` or URL | Associated pull request |
| Remarks | String | No | `Supersedes v1.0` | Additional notes |
| Artifact_Type | String | Yes | `DOC` | Type classification |
| Description | String | Yes | `Core enterprise development policy` | One-line purpose |
| Dependencies | String | No | `DOC-POL-X,TMP-DEF-Y` | Comma-separated artifact IDs |

### 5.2 Data Quality Rules

1. **No Duplicate
 IDs** - Each artifact must have a unique ID
2. **File_Path Accuracy** - Path must match actual repository structure
3. **GitHub_URL Validity** - URLs must use blob links to main branch
4. **Date Format** - All dates in YYYY-MM-DD format
5. **Owner Assignment** - Must use standardized team/role names
6. **Status Values** - Only: Draft | Active | Under Review | Deprecated | Archived
7. **Phase Values** - Only: Policy | Definition | Design | Development | Testing | Deployment | Operations | Change Management

---

### 3.8 CFG - Configuration

**Definition:** Configuration files that define application settings, environment variables, and system parameters. NOT executable code.

**Subtypes:**
- **CFG-ENV** = Environment Configuration (.env templates, .yaml)
- **CFG-APP** = Application Configuration (.json, .toml, .ini)
- **CFG-INFRA** = Infrastructure Configuration (docker-compose.yml, k8s manifests)
- **CFG-CI** = CI/CD Configuration (.github actions config, pipeline config)

**Mandatory Metadata Fields:**

| Field | Format | Example | Description |
|-------|--------|---------|-------------|
| **Artifact ID** | `CFG-[CONTEXT]-[NAME]` | `CFG-APP-DATABASE_CONFIG` | Unique identifier |
| **Version** | Semantic (v#.#) | `v1.0` | Version number |
| **Owner** | Role name | `DevOps Team` | Responsible team |
| **Status** | Enum | `Active` | Active | Deprecated | Under Review |
| **Last_Updated** | YYYY-MM-DD | `2025-10-24` | Last modification date |
| **Artifact_Type** | Fixed | `CFG` | Type classification |
| **Description** | Text (1-2 sentences) | Database connection configuration template | Purpose statement |
| **Config_Format** | String | `YAML` | File format: YAML | JSON | TOML | ENV | INI |
| **Environment** | String | `All` | Target environment: Dev | Test | Staging | Prod | All |

**Optional Metadata:**
- **Secrets_Required:** List of secrets/variables needed
- **Validation_Schema:** Link to JSON schema or validation rules
- **Default_Values:** Whether file contains safe defaults
- **Dependencies:** Other config files required

**Examples:**
- `CFG-ENV-DATABASE` → .env.template for database configuration
- `CFG-APP-LOGGING` → logging.json for application logging settings
- `CFG-INFRA-DOCKER_COMPOSE` → docker-compose.yml for local development
- `CFG-CI-BUILD_MATRIX` → CI build matrix configuration

---

### 3.9 TST - Test Artifact

**Definition:** Test-related files including test plans, test cases, test data, and test automation scripts.

**Subtypes:**
- **TST-PLAN** = Test Plans (strategy, scope, approach)
- **TST-CASE** = Test Cases (manual or automated test scripts)
- **TST-DATA** = Test Data (fixtures, mocks, sample data)
- **TST-REPORT** = Test Reports (execution results, coverage reports)
- **TST-SCRIPT** = Test Automation Scripts (Selenium, Playwright, etc.)

**Mandatory Metadata Fields:**

| Field | Format | Example | Description |
|-------|--------|---------|-------------|
| **Artifact ID** | `TST-[TYPE]-[NAME]` | `TST-CASE-USER_LOGIN` | Unique identifier |
| **Version** | Semantic (v#.#) | `v1.0` | Version number |
| **Owner** | Role name | `QA Team` | Responsible team |
| **Status** | Enum | `Active` | Active | Deprecated | Under Review |
| **Test_Type** | String | `Functional` | Unit | Integration | E2E | Performance | Security | Accessibility |
| **Phase** | Enum | `Testing` | Applicable lifecycle phase |
| **Last_Updated** | YYYY-MM-DD | `2025-10-24` | Last modification date |
| **Artifact_Type** | Fixed | `TST` | Type classification |
| **Description** | Text (1-2 sentences) | Test cases for user authentication flow | Purpose statement |

**Optional Metadata:**
- **Test_Framework:** Jest | Pytest | Selenium | JUnit | Cypress | Playwright
- **Automation_Level:** Manual | Semi-automated | Fully-automated
- **Priority:** P0-Critical | P1-High | P2-Medium | P3-Low
- **Coverage_Area:** Feature or module being tested
- **Prerequisites:** Setup or data required
- **Expected_Duration:** Execution time estimate

**Examples:**
- `TST-PLAN-REGRESSION` → Regression test plan document
- `TST-CASE-API_ENDPOINTS` → API endpoint test cases
- `TST-DATA-USER_FIXTURES` → JSON fixtures for user data
- `TST-SCRIPT-E2E_CHECKOUT` → End-to-end checkout flow automation
- `TST-REPORT-COVERAGE` → Code coverage report template

---

### 3.10 DAT - Data File

**Definition:** Data files used for reference, lookup, seed data, or reporting. NOT configuration files or test data.

**Subtypes:**
- **DAT-REF** = Reference Data (lookup tables, code lists)
- **DAT-SEED** = Seed Data (initial database population)
- **DAT-SAMPLE** = Sample Data (examples, demonstrations)
- **DAT-EXPORT** = Data Exports (reports, extracts)
- **DAT-CATALOG** = Data Catalogs (artifact registries)

**Mandatory Metadata Fields:**

| Field | Format | Example | Description |
|-------|--------|---------|-------------|
| **Artifact ID** | `DAT-[TYPE]-[NAME]` | `DAT-CATALOG-ARTIFACTS` | Unique identifier |
| **Version** | Semantic (v#.#) | `v1.0` | Version number |
| **Owner** | Role name | `Enterprise Architecture Office (EAO)` | Responsible team |
| **Status** | Enum | `Active` | Active | Deprecated | Under Review |
| **Data_Format** | String | `CSV` | CSV | XLSX | JSON | XML | Parquet |
| **Last_Updated** | YYYY-MM-DD | `2025-10-24` | Last modification date |
| **Artifact_Type** | Fixed | `DAT` | Type classification |
| **Description** | Text (1-2 sentences) | Central artifact catalog registry | Purpose statement |
| **Record_Count** | Integer (optional) | `213` | Approximate number of records |

**Optional Metadata:**
- **Data_Schema:** Link to schema definition
- **Update_Frequency:** Daily | Weekly | Monthly | On-demand | Automated
- **Data_Source:** Origin of the data
- **Sensitive_Data:** Yes | No | PII | Confidential
- **Retention_Period:** How long data should be kept
- **Access_Level:** Public | Internal | Confidential | Restricted

**Examples:**
- `DAT-CATALOG-ARTIFACTS` → catalog.csv (artifact registry)
- `DAT-REF-COUNTRY_CODES` → ISO country codes lookup table
- `DAT-SEED-ROLES_PERMISSIONS` → Initial roles and permissions seed data
- `DAT-SAMPLE-CUSTOMER_DATA` → Anonymized sample customer records
- `DAT-EXPORT-MONTHLY_METRICS` → Monthly metrics export template

---

## 6. Owner Assignment Standards

### 6.1 Standardized Team/Role Names

**Policy and Governance:**
- `Enterprise Architecture Office (EAO)` - Architecture, strategy, standards
- `IT Governance & PMO` - Compliance, audits, project management
- `CTO Office` - Executive oversight, policy approval

**Development Lifecycle:**
- `Business Analysis Team` - Requirements, stakeholder management
- `Solution Architecture Team` - Technical design, ADRs
- `Development Team` - Code implementation
- `QA Team` - Testing, quality assurance
- `DevOps Team` - CI/CD, infrastructure, automation

**Specialized Functions:**
- `Security & Compliance Team` - Security, threats, vulnerabilities
- `Data Governance Team` - Data quality, privacy, cataloging
- `SRE Team` - Operations, monitoring, incident response
- `UX Design Team` - User experience, accessibility

### 6.2 Owner Assignment By Artifact Type

| Artifact Type | Typical Owner |
|---------------|---------------|
| **Policy Documents (DOC-POL)** | Enterprise Architecture Office (EAO) |
| **Definition Templates (TMP-DEF)** | Business Analysis Team |
| **Design Templates (TMP-DES)** | Solution Architecture Team |
| **Development Templates (TMP-DEV)** | Development Team |
| **Testing Templates/Checklists (TST, VAL-TST)** | QA Team |
| **Security Artifacts (VAL-SEC, GDL-SEC)** | Security & Compliance Team |
| **Workflows (WFL)** | DevOps Team |
| **Scripts (SCR)** | DevOps Team |
| **Operations Artifacts (TMP-OPS, GDL-OPS)** | SRE Team |
| **Data Files (DAT)** | Data Governance Team or Enterprise Architecture Office (EAO) |
| **Configuration Files (CFG)** | DevOps Team |

---

## 7. Workflow Integration

### 7.1 Automated Catalog Updates

The `update-catalog.yml` workflow automatically:
1. Scans repository for new/modified artifacts
2. Extracts metadata from file headers
3. Updates catalog.csv
4. Validates against schema
5. Creates PR with changes

### 7.2 Validation Workflows

- **lint-catalog.yml** - Validates catalog.csv format and consistency
- **lint-doc-metadata.yml** - Validates document header metadata
- **blueprint-guard.yml** - Validates blueprint structure compliance

---

## 8. Best Practices

### 8.1 File Header Standards

All artifacts SHOULD include a metadata header:

```markdown
## 0. Metadata

- **Artifact ID (catalog.csv):** [ID]
- **Version:** [v#.#]
- **Owner:** [Team/Role]
- **Linked Ticket / PR:** [URL or #]
```

### 8.2 Naming Conventions

- Use descriptive, clear names
- Separate words with underscores: `Project_Plan_Template.md`
- Avoid abbreviations unless widely recognized
- Be consistent across similar artifacts

### 8.3 Version Management

- Start at `v1.0` for initial release
- Increment minor version for updates: `v1.1`, `v1.2`
- Increment major version for breaking changes: `v2.0`
- Update `Last_Updated` field on every change

---

## 9. References

- [ELA Development Policy](./ELA_Development_Policy.md)
- [Template Migration Instructions](./Template_Migration_Instructions.md)
- [GitHub Workflows](./.github/workflows/)
- [catalog.csv](../catalog.csv)

---

## Version Control

| Version | Date | Description | Author |
|---------|------|-------------|--------|
| v1.0 | 2025-10-24 | Initial release with 10 artifact types and comprehensive metadata standards | EAO |

---

**Document Control:**
- Version history and approvals tracked via PRs and tags
- Policy owned by CTO, maintained by EAO
- Review cycle: Semi-annual or as needed

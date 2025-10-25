

# Document Structure Guidelines

---
Artifact_ID: DOC-00-Document_Structure_Guidelines
Artifact_Name: Document Structure Guidelines
Artifact_Type: DOC
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: ELA document structure guidelines
File_Path: 00_Policy/Document_Structure_Guidelines.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Document_Structure_Guidelines.md
Last_Updated: 2025-10-25
Owner: Enterprise Architecture Office (EAO)
Phase: Policy
Process_Group: Policy
Process_Step: N/A
Project_Name: 
Status: Draft
Template_Source: ELA-Template
Validation_Status: Pending
Version: v2.0.0
---

---
title: Document Structure Guidelines
version: 2.0.0
maintained_by: Enterprise Architecture Office (EAO)
classification: Internal Use
template_type: Policy
ela_compliance: true
last_updated: 2025-10-25
---

| Key              | Value                              |
|------------------|------------------------------------|
| Title            | Document Structure Guidelines      |
| Version          | 2.0.0                              |
| Maintained By    | Enterprise Architecture Office     |
| Classification   | Internal Use                       |
| Template Type    | Policy                             |
| ELA Compliance   | true                               |
| Last Updated     | 2025-10-25                         |

---

## Purpose & Scope

These guidelines define the required structure for all ELA artifacts (DOC, TMP, GDL, VAL, WFL, SCR, IMG, CFG, TST, DAT, INST) across all lifecycle phases. They ensure clarity, traceability, and compliance for documentation in the ELA-Main repository.

**Scope:**
- All artifact types: DOC, TMP, GDL, VAL, WFL, SCR, IMG, CFG, TST, DAT, INST
- All lifecycle phases: Definition, Design, Development, Testing, Deployment, Operations, Change Management
- All storage contexts: GitHub repository, databases, web application
- All workflow stages: Master templates → Process guides → Filled instances → Validation

---

## 0. Metadata

- **Artifact ID (catalog.csv):** DOC-POL-DOCUMENT_STRUCTURE
- **Version:** v1.0
- **Owner:** Enterprise Architecture Office (EAO)
- **Custodian:** Enterprise Architecture Office (EAO)
- **Effective Date:** 2025-10-24
- **Review Cycle:** Semi-annual
- **Linked Ticket / PR:**

## 2. Scope

These guidelines apply to:

- **All artifact types**: DOC, TMP, GDL, VAL, WFL, SCR, IMG, CFG, TST, DAT, INST
- **All lifecycle phases**: Definition, Design, Development, Testing, Deployment, Operations, Change Management
- **All storage contexts**: GitHub repository, future SQL/NoSQL databases, web application
- **All workflow stages**: Master templates → Process guides → Filled instances → Validation

## 4. Universal Document Structure

### 4.1 Structure Overview

Every ELA artifact follows this structure:

```markdown
# [Document Title]

## 0. Metadata
[Human-readable metadata display]

` delimiters.

#### 4.2.1 Core Fields (All Artifacts)

```yaml
```

#### 4.2.2 Extended Fields (Conditional)

**For Templates (TMP):**
```yaml
\n\ntemplate_category: "Planning|Analysis|Design|Implementation|Validation"
fill_instructions_url: "[Link to guideline document]"
```

**For Instances (INST):**
```yaml
\n\nfilled_date: "YYYY-MM-DD"

```

**For Guidelines (GDL):**
```yaml
process_overview: true  # If this is a Phase_Process_Overview doc
covered_templates:  # List of template IDs covered by this guide
  - TMP-DEF-PROJECT_PLAN
  - TMP-DEF-STAKEHOLDER_REGISTER
target_audience: "[Primary users]"
```

**For Validation Checklists (VAL):**
```yaml
validation_target: "[Artifact type or process]"
entry_criteria: "[Prerequisites]"
exit_criteria: "[Completion requirements]"
checkpoint_count: [number]
```

### 4.3 Human-Readable Metadata Header (Mandatory)

Immediately after the YAML front matter and document title, include Section 0:

```markdown
## 0. Metadata

- **Artifact ID (catalog.csv):** [artifact_id value]
- **Version:** [version value]
- **Owner:** [owner value]
- **Custodian:** [custodian if different from owner]
- **Effective Date:** [YYYY-MM-DD]
- **Review Cycle:** [frequency]
- **Linked Ticket / PR:** [GitHub links]

## 5. Artifact-Type-Specific Section Templates

### 5.1 DOC - Documentation

```markdown
## 1. Purpose
[Why this document exists, what problems it solves]

## 2. Scope
[What is covered and what is excluded]

## 3. [Primary Content Sections]
[Organized by topic or process flow]

## N. Compliance & Standards
[Relevant standards, regulations, certifications]

## N+1. Exceptions
[Documented exceptions and their justifications]

## N+2. References
[Links to related artifacts, external standards]
```

### 5.2 TMP - Template

```markdown
## 1. Template Purpose
[What this template is used for]

## 2. When to Use This Template
[Lifecycle phase, process step, triggering conditions]

## 3. Prerequisites
[Required inputs, completed artifacts, approvals]

## 4. Instructions
[Step-by-step guidance on filling out this template]

## 5. [Template Content Sections]
[Actual fillable sections with placeholders]
[Use {{PLACEHOLDER_NAME}} for values to be filled]

## 6. Validation
[Link to associated validation checklist]
[Quality criteria for completion]

## 7. Related Templates
[Dependencies, sequencing with other templates]
```

### 5.3 GDL - Guideline

```markdown
## 1. Purpose
[What this guideline helps teams accomplish]

## 2. Audience
[Target roles, teams, or skill levels]

## 3. Process Overview
[High-level workflow or methodology]

## 4. Detailed Steps
[Step-by-step instructions]

### 4.1 [Step Name]
- **Input**: [What you need]
- **Action**: [What to do]
- **Output**: [What you produce]
- **Tools**: [Software, templates, checklists]

## 5. Examples
[Real-world examples or use cases]

## 6. Common Pitfalls
[What to avoid, error handling]

## 7. Resources
[Templates, tools, training materials]
```

### 5.4 GDL - Phase_Process_Overview (Special Case)

**For Phase_Process_Overview documents**, use this enhanced structure:

```markdown
## 1. Phase Overview
[Purpose and objectives of this lifecycle phase]

## 2. Process Groups

### 2.1 [Process Group Name]

#### Purpose
[Why this process group exists]

#### Process Steps

##### Step 1: [Step Name]
- **Objective**: [Goal of this step]
- **Templates Used**:
  - [TMP-PHASE-NAME1](../Templates/[path]) - [Purpose]
  - [TMP-PHASE-NAME2](../Templates/[path]) - [Purpose]
- **Guidelines**: [GDL-PHASE-NAME](./[path])
- **Validation**: [VAL-PHASE-NAME](../Validation/[path])
- **Inputs**: [Required artifacts]
- **Outputs**: [Produced artifacts]
- **Responsible**: [Team/Role]

##### Step 2: [Step Name]
[Repeat structure]

### 2.2 [Next Process Group]
[Repeat structure]

## 3. Workflow Diagram
[Visual representation of process flow]

## 4. Entry & Exit Criteria
- **Entry Criteria**: [Conditions to start this phase]
- **Exit Criteria**: [Conditions to complete this phase]

## 5. Roles & Responsibilities
[RACI matrix or role descriptions]

## 6. Phase Completion Checklist
[Summary checklist of all deliverables]
```

### 5.5 VAL - Validation Checklist

```markdown
## 1. Validation Purpose
[What this checklist validates]

## 2. Entry Criteria
[Prerequisites before using this checklist]

## 3. Checklist Items

### 3.1 [Category]

| # | Item | Pass/Fail | Notes |
|---|------|-----------|-------|
| 1 | [Requirement 1] | [ ] | |
| 2 | [Requirement 2] | [ ] | |

## 4. Exit Criteria
[Conditions for validation pass]

## 5. Failed Validation Response
[Escalation process, remediation steps]
```

### 5.6 WFL - Workflow (GitHub Actions/Scripts)

```markdown
## 1. Workflow Purpose
[What this automation does]

## 2. Trigger Conditions
[When this workflow runs]

## 3. Prerequisites
[Required secrets, configurations, permissions]

## 4. Workflow Steps
[Detailed step description]

## 5. Expected Outputs
[Artifacts created, notifications sent]

## 6. Error Handling
[Failure scenarios and responses]

## 7. Maintenance
[How to update, test, troubleshoot]
```

### 5.7 INST - Instance (Filled Template)

```markdown
## 1. Instance Metadata
- **Project**: [project_name]
- **Template Source**: [template_source ID]
- **Filled By**: [filled_by]
- **Filled Date**: [filled_date]
- **Validation Status**: [validation_status]

## 2. [Template Content Sections]
[All sections from original template, with {{PLACEHOLDERS}} replaced]

## 3. Validation Record
- **Validated By**: [validator name]
- **Validation Date**: [date]
- **Checklist Used**: [VAL-XXX link]
- **Result**: [Pass/Fail/Conditional]
- **Notes**: [Any deviations or exceptions]

## 4. Change History
[Track updates to this instance]
```

## 7. Database Compatibility

### 7.1 SQL Schema Mapping

The YAML front matter maps directly to SQL tables:

```sql
-- Core Artifacts Table
CREATE TABLE artifacts (
    artifact_id VARCHAR(100) PRIMARY KEY,
    version VARCHAR(20),
    artifact_type VARCHAR(10),
    status VARCHAR(20),
    owner VARCHAR(100),
    last_updated DATE,
    phase VARCHAR(50),
    description TEXT,
    file_path VARCHAR(500),
    github_url VARCHAR(500)
);

-- Templates Table (Extended)
CREATE TABLE templates (
    artifact_id VARCHAR(100) PRIMARY KEY,
    process_group VARCHAR(100),
    process_step VARCHAR(100),
    template_category VARCHAR(50),
    fill_instructions_url VARCHAR(500),
    FOREIGN KEY (artifact_id) REFERENCES artifacts(artifact_id)
);

-- Instances Table (Extended)
CREATE TABLE instances (
    artifact_id VARCHAR(100) PRIMARY KEY,
    template_source VARCHAR(100),
    derived_from VARCHAR(500),
    project_name VARCHAR(200),
    filled_by VARCHAR(100),
    filled_date DATE,
    validation_status VARCHAR(20),
    FOREIGN KEY (artifact_id) REFERENCES artifacts(artifact_id),
    FOREIGN KEY (template_source) REFERENCES templates(artifact_id)
);

-- Guidelines Table (Extended)
CREATE TABLE guidelines (
    artifact_id VARCHAR(100) PRIMARY KEY,
    process_overview BOOLEAN,
    target_audience VARCHAR(200),
    FOREIGN KEY (artifact_id) REFERENCES artifacts(artifact_id)
);

-- Template Coverage (M:N relationship)
CREATE TABLE guideline_templates (
    guideline_id VARCHAR(100),
    template_id VARCHAR(100),
    PRIMARY KEY (guideline_id, template_id),
    FOREIGN KEY (guideline_id) REFERENCES guidelines(artifact_id),
    FOREIGN KEY (template_id) REFERENCES templates(artifact_id)
);
```

### 7.2 NoSQL Document Structure

For MongoDB or similar document databases:

```json
{
  "_id": "TMP-DEF-PROJECT_PLAN",
  "artifact": {
    "artifact_id": "TMP-DEF-PROJECT_PLAN",
    "version": "v2.1",
    "artifact_type": "TMP",
    "status": "Active",
    "owner": "Business Analysis Team",
    "last_updated": "2025-10-15",
    "phase": "Definition",
    "description": "Comprehensive project planning template",
    "file_path": "00_Policy/Templates/01_Definition/01_Initiation/Project_Plan_Template.md",
    "github_url": "https://github.com/EhsanLasani/ELA-Main/blob/main/..."
  },
  "template_metadata": {
    "process_group": "Initiation and Governance",
    "process_step": "01_Project_Initiation",
    "template_category": "Planning",
    "fill_instructions_url": "../Guidelines/Project_Planning_Guide.md"
  },
  "relationships": {
    "instances": [
      "INST-DEF-PROJ-A-PLAN",
      "INST-DEF-PROJ-B-PLAN"
    ],
    "guidelines": ["GDL-DEF-PROJECT_PLANNING"],
    "validation": ["VAL-DEF-PROJECT_PLAN"],
    "dependencies": ["TMP-DEF-GOVERNANCE_FRAMEWORK"]
  },
  "content": {
    "markdown": "[Full markdown content]",
    "sections": [
      {"level": 1, "title": "Template Purpose", "content": "..."},
      {"level": 2, "title": "Project Overview", "content": "..."}
    ]
  }
}
```

` delimiters
   - All mandatory fields present (artifact_id, version, artifact_type, status, owner, last_updated, phase, description)
   - Field values match allowed enums (artifact_type, status, phase)
   - artifact_id follows naming convention for artifact_type

2. **Section 0 Metadata Presence**
   - Document contains `## 0. Metadata` section
   - Metadata section appears before content sections

3. **Artifact-Type Structure Validation**
   - TMP artifacts have Template Purpose, Instructions, Validation sections
   - GDL artifacts with process_overview=true have Process Groups section
   - INST artifacts have Instance Metadata and Validation Record

4. **Cross-Reference Validation**
   - Referenced artifact IDs exist in catalog.csv
   - File paths in links are valid
   - template_source in INST points to existing TMP

### 8.2 JSON Schema Definition

Create `00_Policy/Schemas/artifact_frontmatter_schema.json`:

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "ELA Artifact Front Matter",
  "type": "object",
  "required": [
    "artifact_id",
    "version",
    "artifact_type",
    "status",
    "owner",
    "last_updated",
    "phase",
    "description"
  ],
  "properties": {
    "artifact_id": {
      "type": "string",
      "pattern": "^(DOC|TMP|GDL|VAL|WFL|SCR|IMG|CFG|TST|DAT|INST)-[A-Z]{3}-[A-Z0-9_]+$"
    },
    "version": {
      "type": "string",
      "pattern": "^v\\d+\\.\\d+$"
    },
    "artifact_type": {
      "type": "string",
      "enum": ["DOC", "TMP", "GDL", "VAL", "WFL", "SCR", "IMG", "CFG", "TST", "DAT", "INST"]
    },
    "status": {
      "type": "string",
      "enum": ["Draft", "Active", "Under Review", "Deprecated", "Archived"]
    },
    "owner": {"type": "string"},
    "last_updated": {
      "type": "string",
      "format": "date"
    },
    "phase": {
      "type": "string",
      "enum": [
        "Policy",
        "Definition",
        "Design",
        "Development",
        "Testing",
        "Deployment",
        "Operations",
        "Change Management"
      ]
    },
    "description": {"type": "string", "maxLength": 200}
  }
}
```

## 10. Governance & Maintenance

### 10.1 Document Structure Evolution

**Changes to this guideline require:**
- Proposal via GitHub Issue
- Impact assessment on existing documents
- EAO approval
- Version increment (v1.0 → v2.0 for breaking changes)
- Migration guide for affected documents

### 10.2 Exception Process

If a document cannot conform to these guidelines:

1. Create GitHub Issue documenting:
   - Document ID
   - Specific guideline conflict
   - Business/technical justification
   - Proposed alternative structure

2. EAO reviews and approves/rejects

3. If approved:
   - Document exception in Section 0 metadata
   - Add `structure_exception: true` to YAML
   - Add note to catalog.csv

### 10.3 Metrics & Compliance

**Track quarterly:**
- % of documents compliant with structure guidelines
- % of documents with valid YAML front matter
- % of templates with filled instances
- Average time from template creation to first instance

**Compliance targets:**
- Policy documents: 100% compliance
- Templates: 95% compliance within 3 months of guideline publication
- Other artifacts: 80% compliance within 6 months

## 12. Tooling & Automation

### 12.1 Recommended VS Code Extensions

- **YAML**: Red Hat YAML extension for front matter validation
- **Markdown All in One**: Table of contents, formatting
- **Markdown lint**: Style consistency
- **Front Matter CMS**: GUI for editing YAML front matter

### 12.2 GitHub Actions Integration

See: `.github/workflows/validate-document-structure.yml`

Automated checks on every PR:
- YAML front matter validation
- Artifact ID format validation
- Cross-reference validation
- Catalog sync validation

### 12.3 Future Web Application Features

- **Document Generator**: Web form → compliant markdown
- **Template Browser**: Search templates by phase/process/keywords
- **Instance Tracker**: View all instances derived from a template
- **Validation Dashboard**: Track validation status across projects
- **Lineage Viewer**: Visualize template → instance relationships

**Document Control:**

- Version history and approvals tracked in-repo via PRs and tags
- Policy owned by CTO, maintained by EAO, enforced by IT Governance & PMO
- Non-compliance escalated to Engineering Manager

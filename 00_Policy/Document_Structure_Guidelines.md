---
artifact_id: DOC-POL-DOCUMENT_STRUCTURE
version: v1.0
artifact_type: DOC
status: Active
owner: Enterprise Architecture Office (EAO)
last_updated: 2025-10-24
phase: Policy
description: Comprehensive guidelines for standardizing document structure across all ELA artifacts
---

# Document Structure Guidelines

## 0. Metadata

- **Artifact ID (catalog.csv):** DOC-POL-DOCUMENT_STRUCTURE
- **Version:** v1.0
- **Owner:** Enterprise Architecture Office (EAO)
- **Custodian:** Enterprise Architecture Office (EAO)
- **Effective Date:** 2025-10-24
- **Review Cycle:** Semi-annual
- **Linked Ticket / PR:**

---

## 1. Purpose

This document establishes **mandatory structure standards** for all artifacts in the ELA framework. It ensures:

- **Consistency** in document formatting and organization
- **Machine-readability** through structured metadata (YAML front matter)
- **Human-readability** through standardized section templates
- **Database compatibility** for future SQL/NoSQL storage and web application integration
- **Workflow traceability** from master templates through process guides to validated instances
- **Automation support** for CI/CD validation and catalog management

This document integrates with:
- [Artifact Metadata Standards](./Artifact_Metadata_Standards.md) - Defines artifact types and metadata fields
- [ELA Development Policy](./ELA_Development_Policy.md) - Overall governance framework
- Phase Process Overview documents - Process-specific workflows

---

## 2. Scope

These guidelines apply to:

- **All artifact types**: DOC, TMP, GDL, VAL, WFL, SCR, IMG, CFG, TST, DAT, INST
- **All lifecycle phases**: Definition, Design, Development, Testing, Deployment, Operations, Change Management
- **All storage contexts**: GitHub repository, future SQL/NoSQL databases, web application
- **All workflow stages**: Master templates → Process guides → Filled instances → Validation

---

## 3. Key Principles

### 3.1 Three-Tier Artifact Organization

The ELA framework follows a **master-guide-instance** pattern:

```
┌─────────────────────────────────────────────────────────────┐
│  TIER 1: MASTER TEMPLATES                                   │
│  Location: 00_Policy/Templates/[Phase]/[Process]/           │
│  Purpose: Authoritative, version-controlled template copies │
│  Artifact Type: TMP-[PHASE]-[NAME]                          │
│  Status: Active (source of truth)                            │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  TIER 2: PROCESS GUIDES                                      │
│  Location: [Phase]/Guidelines/[Process]_Overview.md         │
│  Purpose: Explain HOW to use templates, process workflows   │
│  Artifact Type: GDL-[PHASE]-[PROCESS]                       │
│  Status: Active (instructional)                             │
│  Links to: Master templates in Tier 1                       │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  TIER 3: FILLED INSTANCES                                    │
│  Location: [Phase]/Validation/[Project]/[Instance].md       │
│  Purpose: Completed templates for specific projects         │
│  Artifact Type: INST-[PHASE]-[PROJECT]-[NAME]               │
│  Status: Under Review → Active                             │
│  Lineage: template_source, derived_from fields              │
└─────────────────────────────────────────────────────────────┘
```

### 3.2 Phase Process Overview Integration

**Phase_Process_Overview documents** define process groups and organize templates by workflow step:

- **Process Groups**: Collections of related activities (e.g., "Initiation and Governance", "Requirements Gathering")
- **Process Steps**: Specific activities within each process group
- **Template Mapping**: Each process step references specific master templates
- **Sequential Flow**: Processes follow a logical order within each phase

**Example from Definition Phase:**
```yaml
process_groups:
  - name: "Initiation and Governance"
    process_steps:
      - step: "01_Project_Initiation"
        templates:
          - TMP-DEF-PROJECT_PLAN
          - TMP-DEF-GOVERNANCE_FRAMEWORK
      - step: "02_Stakeholder_Management"
        templates:
          - TMP-DEF-STAKEHOLDER_REGISTER
```

---

## 4. Universal Document Structure

### 4.1 Structure Overview

Every ELA artifact follows this structure:

```markdown
---
[YAML FRONT MATTER - Machine-readable metadata]
---

# [Document Title]

## 0. Metadata
[Human-readable metadata display]

---

## [Content Sections]
[Artifact-type-specific sections]
```

### 4.2 YAML Front Matter (Mandatory)

All artifacts MUST begin with YAML front matter enclosed in `---` delimiters.

#### 4.2.1 Core Fields (All Artifacts)

```yaml
---
artifact_id: "[TYPE]-[PHASE]-[NAME]"
version: "v#.#"
artifact_type: "DOC|TMP|GDL|VAL|WFL|SCR|IMG|CFG|TST|DAT|INST"
status: "Draft|Active|Under Review|Deprecated|Archived"
owner: "[Team Name per Artifact Metadata Standards]"
last_updated: "YYYY-MM-DD"
phase: "Policy|Definition|Design|Development|Testing|Deployment|Operations|Change Management"
description: "[One-line purpose statement]"
---
```

#### 4.2.2 Extended Fields (Conditional)

**For Templates (TMP):**
```yaml
process_group: "[Process group name from Phase_Process_Overview]"
process_step: "[Specific step within process group]"
template_category: "Planning|Analysis|Design|Implementation|Validation"
fill_instructions_url: "[Link to guideline document]"
```

**For Instances (INST):**
```yaml
template_source: "TMP-[PHASE]-[NAME]"  # Master template ID
derived_from: "[URL to master template]"
project_name: "[Project/System name]"
filled_by: "[Team/Person name]"
filled_date: "YYYY-MM-DD"
validation_status: "Pending|Validated|Failed"
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

---
```

**Purpose:** 
- Provides human-readable metadata display
- Duplicates key YAML fields for readability
- Adds optional fields not in YAML (Custodian, Effective Date, Review Cycle)
- Creates clear separation from content sections

---

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

---

## 6. Workflow Implementation

### 6.1 Template Creation Workflow

```
1. Team identifies need for new template
   ↓
2. Create template in 00_Policy/Templates/[Phase]/[Process]/
   - Follow TMP section template (5.2)
   - Set process_group and process_step in YAML
   - Set status: Draft
   ↓
3. Update Phase_Process_Overview document
   - Add template reference under appropriate process step
   - Link template URL
   - Document purpose and usage
   ↓
4. Create accompanying guideline (if complex)
   - Create GDL document
   - Reference template ID in covered_templates
   ↓
5. Create validation checklist
   - Create VAL document
   - Define quality criteria for completed template
   ↓
6. Review and approve
   - EAO reviews structure
   - Subject matter experts review content
   - Set status: Active
   ↓
7. Update catalog.csv
   - Add template entry
   - Add guideline entry
   - Add checklist entry
```

### 6.2 Template Usage Workflow

```
1. Team starts process step
   - Consult Phase_Process_Overview
   - Identify required template
   ↓
2. Read process guide (if available)
   - Review GDL document
   - Understand context and prerequisites
   ↓
3. Copy master template
   - Navigate to 00_Policy/Templates/[Phase]/[Process]/
   - Copy template to project workspace
   ↓
4. Fill template
   - Replace {{PLACEHOLDERS}} with project data
   - Update YAML front matter:
     * Change artifact_type: TMP → INST
     * Change artifact_id: TMP-X → INST-PHASE-PROJECT-NAME
     * Add template_source field
     * Add project_name, filled_by, filled_date
     * Set validation_status: Pending
   ↓
5. Run validation checklist
   - Use associated VAL document
   - Self-check or peer review
   - Document results in instance
   ↓
6. Store instance
   - Save to [Phase]/Validation/[Project]/
   - Update validation_status: Validated
   - Commit with descriptive message
   ↓
7. Update catalog.csv
   - Add instance entry
   - Link to template_source
```

### 6.3 Cross-Referencing Rules

**In Templates (TMP):**
- Reference related templates by ID: "See also: TMP-DEF-STAKEHOLDER_REGISTER"
- Link to guidelines: "For usage instructions, see [GDL-DEF-REQUIREMENTS](path)"
- Link to validation: "Validate using [VAL-DEF-REQUIREMENTS](path)"

**In Phase_Process_Overview (GDL):**
- Always use full paths to master templates: `[TMP-DEF-X](../../00_Policy/Templates/01_Definition/Process/template.md)`
- Group templates by process step
- Indicate mandatory vs. optional templates

**In Instances (INST):**
- Always include `template_source` field with template ID
- Always include `derived_from` field with full URL to master template
- Maintain lineage for traceability

---

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

---

## 8. Validation & Quality Assurance

### 8.1 Document Structure Validation

**Automated checks (via GitHub Actions):**

1. **YAML Front Matter Validation**
   - All documents have valid YAML enclosed in `---` delimiters
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

---

## 9. Migration Path for Existing Documents

### 9.1 Assessment Phase

1. **Inventory existing documents**
   - Use catalog.csv as baseline
   - Identify documents without YAML front matter
   - Identify documents missing Section 0

2. **Prioritize by impact**
   - Policy documents (highest priority)
   - Active templates
   - Current phase documents
   - Historical/archived documents (lowest priority)

### 9.2 Migration Steps

For each document:

```markdown
1. Extract existing metadata
   - Look for metadata in headers, file properties
   - Check catalog.csv entry
   - Determine artifact type

2. Create YAML front matter
   - Use artifact type to determine fields
   - Populate all mandatory fields
   - Add conditional fields if applicable

3. Add/update Section 0
   - Convert inline metadata to Section 0 format
   - Ensure alignment with YAML

4. Restructure content sections
   - Apply artifact-type-specific template (Section 5)
   - Preserve all original content
   - Reorganize into standard sections

5. Update cross-references
   - Replace file paths with artifact IDs where possible
   - Add markdown links

6. Validate
   - Run automated structure checks
   - Manual review for content integrity

7. Update catalog.csv
   - Sync with new metadata
```

### 9.3 Backward Compatibility

- Old documents without YAML remain readable
- GitHub Actions flag non-compliant documents (warning, not error)
- Grace period of 6 months for full migration
- Templates created after 2025-10-24 must be compliant immediately

---

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

---

## 11. Examples

### 11.1 Complete Template Example

See: `00_Policy/Templates/01_Definition/01_Initiation/Project_Plan_Template.md`

### 11.2 Complete Process Overview Example

See: `01_Definition/Guidelines/Definition_Phase_Process_Overview.md`

### 11.3 Complete Instance Example

(To be created as projects adopt the framework)

---

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

---

## 13. References

- [Artifact Metadata Standards](./Artifact_Metadata_Standards.md)
- [ELA Development Policy](./ELA_Development_Policy.md)
- [catalog.csv](../catalog.csv)
- [Definition Phase Process Overview](../01_Definition/Guidelines/Definition_Phase_Process_Overview.md)
- [Design Phase Process Overview](../02_Design/Guidelines/Design_Phase_Process_Overview.md)
- YAML 1.2 Specification: https://yaml.org/spec/1.2/spec.html
- GitHub Flavored Markdown: https://github.github.com/gfm/
- JSON Schema: https://json-schema.org/

---

**Document Control:**

- Version history and approvals tracked in-repo via PRs and tags
- Policy owned by CTO, maintained by EAO, enforced by IT Governance & PMO
- Non-compliance escalated to Engineering Manager

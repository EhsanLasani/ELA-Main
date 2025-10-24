## Metadata
---
Artifact_ID: DOC-00-README
Artifact_Name: ELA-Main Tools
Artifact_Type: DOC
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: ELA-Main Tools
File_Path: Tools/README.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/Tools/README.md
Last_Updated: 2025-10-25
Owner: Enterprise Architecture Office (EAO)
Phase: Policy
Process_Group: Policy
Process_Step: N/A
Project_Name: 
Status: Draft
Template_Source: 
Validation_Status: Pending
Version: v1.0
---
# ELA-Main Tools

Automation tools for managing ELA framework artifacts, metadata, and document structures.

## Overview

This Tools directory contains PowerShell scripts and modules to automate:
- Adding and managing artifact metadata
- Restructuring documents to comply with Document Structure Guidelines
- Generating new artifacts from context files
- Managing catalog.csv synchronization
- Git workflow automation

## Directory Structure

```
Tools/
├── Scripts/
│   ├── Add-ArtifactMetadata.ps1          # Add metadata to documents and catalog
│   ├── Update-DocumentStructure.ps1       # Restructure existing documents
│   ├── New-ArtifactFromContext.ps1        # Generate new artifacts from context
│   └── Modules/
│       ├── ELA.Metadata.psm1             # Metadata extraction and generation
│       ├── ELA.Catalog.psm1              # Catalog.csv operations
│       ├── ELA.Structure.psm1            # Document structure mapping
│       └── ELA.Git.psm1                  # Git operations and commits
├── Context/
│   ├── Templates/
│   │   ├── context-template.json         # Base context structure
│   │   └── context-evolution-log.json    # Context iteration tracking
│   ├── Active/
│   │   └── [project-contexts]            # Work-in-progress contexts
│   └── Archive/
│       └── [completed-contexts]          # Historical reference contexts
├── Config/
│   ├── artifact-types.json               # Artifact type definitions
│   ├── owner-mapping.json                # Team ownership rules
│   └── validation-rules.json             # Structure validation rules
└── README.md                              # This file
```

## Prerequisites

- PowerShell 7.0 or higher
- Git installed and configured
- Access to ELA-Main repository
- VS Code (recommended) with PowerShell extension

## Quick Start

### 1. Add Metadata to Existing Document

```powershell
.\Tools\Scripts\Add-ArtifactMetadata.ps1 -FilePath "01_Definition/Guidelines/Some_Document.md"
```

### 2. Restructure Document to Comply with Standards

```powershell
.\Tools\Scripts\Update-DocumentStructure.ps1 -FilePath "00_Policy/ELA_Development_Policy.md"
```

### 3. Generate New Document from Context

```powershell
.\Tools\Scripts\New-ArtifactFromContext.ps1 -ContextFile "Tools/Context/Active/CTX-DEF-001.json"
```

## Script Details

### Add-ArtifactMetadata.ps1

**Purpose**: Adds or updates YAML front matter and catalog.csv entries for existing documents.

**Process**:
1. Reads document and extracts existing metadata
2. Generates missing metadata fields based on Artifact_Metadata_Standards.md
3. Checks catalog.csv for duplicate entries
4. Adds/updates YAML front matter in document
5. Adds/updates row in catalog.csv
6. Commits changes with auto-generated message

**Parameters**:
- `-FilePath` (Required): Path to document relative to repository root
- `-Force`: Overwrite existing metadata
- `-NoCommit`: Skip Git commit
- `-DryRun`: Show what would be done without making changes

**Example**:
```powershell
.\Tools\Scripts\Add-ArtifactMetadata.ps1 `
    -FilePath "01_Definition/Templates/Project_Plan_Template.md" `
    -Force
```

### Update-DocumentStructure.ps1

**Purpose**: Restructures existing documents to comply with Document_Structure_Guidelines.md.

**Process**:
1. Reads existing document content
2. Identifies artifact type from metadata or filename
3. Extracts existing sections and content
4. Maps content to new structure template
5. Rewrites document with proper section ordering
6. Preserves all original content
7. Commits changes with description of restructuring

**Parameters**:
- `-FilePath` (Required): Path to document
- `-ArtifactType`: Override auto-detected artifact type
- `-BackupOriginal`: Create .backup file before restructuring
- `-NoCommit`: Skip Git commit
- `-DryRun`: Show mapping without making changes

**Example**:
```powershell
.\Tools\Scripts\Update-DocumentStructure.ps1 `
    -FilePath "02_Design/Guidelines/Design_Phase_Process_Overview.md" `
    -BackupOriginal
```

### New-ArtifactFromContext.ps1

**Purpose**: Generates new artifacts from context files, optionally using AI assistance.

**Process**:
1. Reads context file from Tools/Context/Active/
2. Determines artifact type and target location
3. Generates document structure based on type
4. Populates content from context or AI generation
5. Applies proper metadata
6. Saves to appropriate phase folder
7. Updates catalog.csv
8. Updates context evolution history
9. Commits with descriptive message

**Parameters**:
- `-ContextFile` (Required): Path to JSON context file
- `-UseAI`: Enable AI content generation (requires API configuration)
- `-OutputPath`: Override default output location
- `-NoCommit`: Skip Git commit

**Example**:
```powershell
.\Tools\Scripts\New-ArtifactFromContext.ps1 `
    -ContextFile "Tools/Context/Active/CTX-TMP-USECASE.json" `
    -UseAI
```

## Context Files

### Context Structure

Context files guide document generation and track evolution:

```json
{
  "context_id": "CTX-DEF-001",
  "version": "1.0",
  "created_date": "2025-10-24",
  "last_updated": "2025-10-24",
  "status": "active",
  "artifact_target": {
    "artifact_type": "TMP",
    "phase": "Definition",
    "process_group": "Requirements Gathering",
    "suggested_name": "Use_Case_Template"
  },
  "content": {
    "purpose": "Template for capturing use case specifications",
    "audience": "Business Analysts, Product Owners",
    "key_sections": [
      "Actor Identification",
      "Preconditions",
      "Main Flow"
    ],
    "references": ["ISO/IEC 29148"]
  },
  "evolution_history": [
    {
      "iteration": 1,
      "date": "2025-10-24",
      "changes": "Initial context",
      "feedback": "Add exception handling",
      "modified_by": "EhsanLasani"
    }
  ]
}
```

### Context Evolution Workflow

1. **Create**: Start with context template
2. **Generate**: Create initial document draft
3. **Review**: Human provides feedback
4. **Iterate**: Update context, regenerate document
5. **Finalize**: Archive context for future reference
6. **Reuse**: Reference archived contexts for similar artifacts

## Configuration Files

### artifact-types.json

Defines all artifact types and their metadata requirements:

```json
{
  "TMP": {
    "name": "Template",
    "prefix": "TMP",
    "required_fields": ["process_group", "process_step"],
    "optional_fields": ["template_category", "fill_instructions_url"],
    "structure_template": "template_structure"
  }
}
```

### owner-mapping.json

Maps artifact types and phases to responsible teams:

```json
{
  "rules": [
    {
      "condition": {"phase": "Policy"},
      "owner": "Enterprise Architecture Office (EAO)"
    },
    {
      "condition": {"phase": "Definition"},
      "owner": "Business Analysis Team"
    }
  ]
}
```

## Modules

### ELA.Metadata.psm1

Functions for metadata operations:
- `Get-DocumentMetadata`: Extract existing YAML front matter
- `New-ArtifactMetadata`: Generate metadata for new artifacts
- `Set-DocumentMetadata`: Update YAML front matter
- `Test-MetadataCompleteness`: Validate metadata fields

### ELA.Catalog.psm1

Functions for catalog operations:
- `Get-CatalogEntry`: Retrieve entry by ID or path
- `Add-CatalogEntry`: Add new row to catalog.csv
- `Update-CatalogEntry`: Modify existing entry
- `Test-CatalogDuplicate`: Check for duplicate entries
- `Sync-Catalog`: Reconcile catalog with repository files

### ELA.Structure.psm1

Functions for document structure:
- `Get-ArtifactStructure`: Load structure template for artifact type
- `ConvertTo-StructuredDocument`: Map content to new structure
- `Test-DocumentStructure`: Validate document against standards
- `Get-SectionMapping`: Map old sections to new structure

### ELA.Git.psm1

Functions for Git operations:
- `Invoke-GitCommit`: Commit with conventional message
- `New-ConventionalCommitMessage`: Generate commit message
- `Get-RepositoryStatus`: Check for uncommitted changes
- `Test-GitRepository`: Validate Git configuration

## Best Practices

1. **Always use -DryRun first** to preview changes
2. **Backup important documents** before restructuring
3. **Review generated commits** before pushing
4. **Update context evolution history** after each iteration
5. **Archive completed contexts** for future reference
6. **Test scripts on sample documents** before batch processing

## Troubleshooting

### Common Issues

**Script execution policy error**:
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

**Module not found**:
```powershell
Import-Module .\Tools\Scripts\Modules\ELA.Metadata.psm1 -Force
```

**Git commit fails**:
- Ensure Git is configured with user.name and user.email
- Check for merge conflicts
- Verify repository status

## Support

For issues, questions, or contributions:
- Create GitHub Issue: https://github.com/EhsanLasani/ELA-Main/issues
- Reference: [Artifact Metadata Standards](../00_Policy/Artifact_Metadata_Standards.md)
- Reference: [Document Structure Guidelines](../00_Policy/Document_Structure_Guidelines.md)

## Version History

- **v1.0** (2025-10-24): Initial Tools framework creation
  - Add-ArtifactMetadata.ps1
  - Update-DocumentStructure.ps1
  - New-ArtifactFromContext.ps1
  - Core modules and context system

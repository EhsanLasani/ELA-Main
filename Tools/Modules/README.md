## Metadata
---
Artifact_ID: DOC-00-README
Artifact_Name: ELA PowerShell Modules
Artifact_Type: DOC
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: ELA PowerShell Modules
File_Path: Tools/Modules/README.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/Tools/Modules/README.md
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
## Metadata
## Metadata
# ELA PowerShell Modules

This directory contains reusable PowerShell modules that provide core functionality for the ELA Framework.

## 📦 Available Modules

### 1. ELA.Reporting.psm1

**Purpose**: Project analytics and report generation  
**File Size**: 325 lines (9.64 KB)  

**Functions**:
- `Get-ProjectStatus` - Generates project status report
- `Get-ArtifactStatistics` - Analyzes artifact distribution by type
- `Export-ProjectReport` - Exports project metrics to report files
- `Get-CatalogStatistics` - Analyzes catalogue.csv statistics
- `Show-ProjectDashboard` - Displays quick project health dashboard

**Example Usage**:
```powershell
Import-Module ./ELA.Reporting.psm1
Show-ProjectDashboard -ProjectPath "."
```

## 🔧 Installation

```powershell
# Import specific module
Import-Module "./Tools/Modules/ELA.Reporting.psm1" -Force

# Import all modules
Get-ChildItem "./Tools/Modules/*.psm1" | ForEach-Object { Import-Module $_.FullName -Force }
```

## 📚 Documentation

For detailed documentation of all functions, parameters, and examples, use:

```powershell
Get-Help Get-ProjectStatus -Full
Get-Command -Module ELA.Reporting
```

## 🔗 Related Tools

These modules are used by scripts in `../Scripts/`:
- `Invoke-ArtifactValidation.ps1` - Uses ELA.Validation
- Project reporting scripts - Use ELA.Reporting

---

**Version**: 1.0.0  
**Last Updated**: 2025-10-24  
**Maintained By**: ELA Framework Team

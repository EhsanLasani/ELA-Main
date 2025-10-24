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

---

### 2. ELA.Validation.psm1

**Purpose**: Document and artifact validation for compliance  
**File Size**: 265 lines (6.63 KB)  

**Functions**:
- `Test-ArtifactMetadata` - Validates YAML metadata completeness
- `Test-DocumentStructure` - Validates document structure
- `Test-ArtifactNaming` - Validates naming conventions
- `Test-PhaseArtifacts` - Validates all artifacts in a phase
- `Get-ValidationRules` - Loads validation rules configuration

**Example Usage**:
```powershell
Import-Module ./ELA.Validation.psm1
Test-PhaseArtifacts -PhasePath "./03_Development" -Recursive
```

---

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

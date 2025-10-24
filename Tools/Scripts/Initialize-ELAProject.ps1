<#
.SYNOPSIS
    Initializes a new ELA project with standard folder structure

.DESCRIPTION
    Creates the complete ELA project structure including all phase folders,
    configuration files, and basic templates.

.PARAMETER ProjectPath
    Path where the project will be created

.PARAMETER ProjectName
    Name of the ELA project

.EXAMPLE
    .\Initialize-ELAProject.ps1 -ProjectPath "." -ProjectName "MyELAProject"

.NOTES
    Author: ELA Framework Team
    Version: 1.0.0
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectPath,
    
    [Parameter(Mandatory = $true)]
    [string]$ProjectName
)

# Define ELA phase structure
$phases = @(
    "00_Policy",
    "01_Definition",
    "02_Design",
    "03_Development",
    "04_Systems_Integration",
    "05_Testing",
    "06_Deployment",
    "07_Operations",
    "08_Change_Management"
)

# Create project directory
$projectRoot = Join-Path $ProjectPath $ProjectName
if (Test-Path $projectRoot) {
    Write-Error "Project directory already exists: $projectRoot"
    exit 1
}

Write-Host "\nInitializing ELA Project: $ProjectName" -ForegroundColor Cyan
Write-Host "Location: $projectRoot\n" -ForegroundColor Yellow

# Create project root
New-Item -Path $projectRoot -ItemType Directory -Force | Out-Null

# Create phase folders
Write-Host "Creating phase structure..." -ForegroundColor Green
foreach ($phase in $phases) {
    $phasePath = Join-Path $projectRoot $phase
    New-Item -Path $phasePath -ItemType Directory -Force | Out-Null
    Write-Host "  Created: $phase" -ForegroundColor White
}

# Create Tools directory
Write-Host "\nCreating Tools directory..." -ForegroundColor Green
$toolsPath = Join-Path $projectRoot "Tools"
New-Item -Path $toolsPath -ItemType Directory -Force | Out-Null

# Create Reports directory
$reportsPath = Join-Path $projectRoot "Reports"
New-Item -Path $reportsPath -ItemType Directory -Force | Out-Null

# Create Catalogue.csv
Write-Host "Creating Catalogue.csv..." -ForegroundColor Green
$catalogPath = Join-Path $projectRoot "Catalogue.csv"
$catalogHeader = "ArtifactID,Phase,Type,Name,Version,Status,Owner,LastModified"
$catalogHeader | Out-File -FilePath $catalogPath -Encoding UTF8

# Create README.md
Write-Host "Creating README.md..." -ForegroundColor Green
$readmePath = Join-Path $projectRoot "README.md"
$readmeContent = @"
# $ProjectName

ELA Framework Project

## Project Structure

This project follows the Enterprise-Level Application (ELA) framework structure:

$(foreach ($phase in $phases) { "- $phase\n" })

## Getting Started

1. Review phase folders and populate with artifacts
2. Use Tools/Scripts for automation
3. Maintain Catalogue.csv for artifact tracking
4. Generate reports using Tools/Modules

## Tools

- **Modules**: PowerShell modules for validation and reporting
- **Scripts**: Automation scripts for common tasks

---
Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
"@
$readmeContent | Out-File -FilePath $readmePath -Encoding UTF8

Write-Host "\n" + ("=" * 60) -ForegroundColor Cyan
Write-Host "ELA Project initialized successfully!" -ForegroundColor Green
Write-Host ("=" * 60) + "\n" -ForegroundColor Cyan

Write-Host "Project: $ProjectName" -ForegroundColor White
Write-Host "Location: $projectRoot" -ForegroundColor White
Write-Host "Phases: $($phases.Count) folders created" -ForegroundColor White
Write-Host "\nNext steps:" -ForegroundColor Yellow
Write-Host "  1. Navigate to: cd $projectRoot" -ForegroundColor White
Write-Host "  2. Review README.md" -ForegroundColor White
Write-Host "  3. Start adding artifacts to phase folders\n" -ForegroundColor White

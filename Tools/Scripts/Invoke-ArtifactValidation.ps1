<#
.SYNOPSIS
    Validates artifacts in an ELA project for compliance and completeness

.DESCRIPTION
    This script validates artifacts across the entire project or specific phases,
    checking metadata completeness, document structure, and naming conventions.
    Uses the ELA.Validation module.

.PARAMETER Path
    Path to the project or phase directory to validate

.PARAMETER Recursive
    Include subdirectories in validation

.PARAMETER GenerateReport
    Generate a validation report file

.PARAMETER ReportPath
    Path where validation report will be saved

.EXAMPLE
    .\Invoke-ArtifactValidation.ps1 -Path "./03_Development" -Recursive

.EXAMPLE
    .\Invoke-ArtifactValidation.ps1 -Path "." -GenerateReport -ReportPath "./Reports/validation-report.txt"

.NOTES
    Requires: ELA.Validation module
    Author: ELA Framework Team
    Version: 1.0.0
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$Path = ".",
    
    [Parameter(Mandatory = $false)]
    [switch]$Recursive,
    
    [Parameter(Mandatory = $false)]
    [switch]$GenerateReport,
    
    [Parameter(Mandatory = $false)]
    [string]$ReportPath = "./Reports/validation-report.txt",

    [Parameter(Mandatory = $false)]
    [switch]$Verbose
)

# Import required module
$modulePath = Join-Path $PSScriptRoot "../Modules/ELA.Validation.psm1"
if (Test-Path $modulePath) {
    Import-Module $modulePath -Force
}
else {
    Write-Error "ELA.Validation module not found at: $modulePath"
    exit 1
}

# Validate path exists
if (-not (Test-Path $Path)) {
    Write-Error "Path not found: $Path"
    exit 1
}

# Banner
Write-Host "\n" + ("=" * 70) -ForegroundColor Cyan
Write-Host "ELA Artifact Validation Tool" -ForegroundColor Cyan
Write-Host ("=" * 70) + "\n" -ForegroundColor Cyan

Write-Host "Target Path: $Path" -ForegroundColor Yellow
Write-Host "Recursive: $Recursive" -ForegroundColor Yellow
Write-Host "Timestamp: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')\n" -ForegroundColor Yellow

# Determine if path is a phase directory or project root
$targetName = Split-Path $Path -Leaf
$isPhaseDir = $targetName -match '^\d{2}_'

$validationResults = @{
    TotalFiles = 0
    ValidFiles = 0
    InvalidFiles = 0
    ValidationErrors = @()
    Phases = @()
}

if ($isPhaseDir) {
    Write-Host "Validating Phase: $targetName\n" -ForegroundColor Green
    $results = Test-PhaseArtifacts -PhasePath $Path -Recursive:$Recursive
    
    $validationResults.TotalFiles = $results.TotalFiles
    $validationResults.ValidFiles = $results.ValidFiles
    $validationResults.InvalidFiles = $results.InvalidFiles
    $validationResults.ValidationErrors = $results.ValidationErrors
}
else {
    Write-Host "Validating Project: $targetName\n" -ForegroundColor Green
    
    # Get all phase directories
    $phases = Get-ChildItem -Path $Path -Directory | Where-Object { $_.Name -match '^\d{2}_' }
    
    foreach ($phase in $phases) {
        Write-Host "Validating phase: $($phase.Name)..." -ForegroundColor Cyan
        
        $phaseResults = Test-PhaseArtifacts -PhasePath $phase.FullName -Recursive:$Recursive
        
        $validationResults.TotalFiles += $phaseResults.TotalFiles
        $validationResults.ValidFiles += $phaseResults.ValidFiles
        $validationResults.InvalidFiles += $phaseResults.InvalidFiles
        $validationResults.ValidationErrors += $phaseResults.ValidationErrors
        
        $validationResults.Phases += @{
            PhaseName = $phase.Name
            Results = $phaseResults
        }
        
        Write-Host "  Total: $($phaseResults.TotalFiles) | Valid: $($phaseResults.ValidFiles) | Invalid: $($phaseResults.InvalidFiles)\n" -ForegroundColor White
    }
}

# Display summary
Write-Host "\n" + ("=" * 70) -ForegroundColor Cyan
Write-Host "VALIDATION SUMMARY" -ForegroundColor Cyan
Write-Host ("=" * 70) -ForegroundColor Cyan

Write-Host "Total Artifacts Scanned: $($validationResults.TotalFiles)" -ForegroundColor White
Write-Host "Valid Artifacts: $($validationResults.ValidFiles)" -ForegroundColor Green
Write-Host "Invalid Artifacts: $($validationResults.InvalidFiles)" -ForegroundColor Red

$validationRate = if ($validationResults.TotalFiles -gt 0) {
    [math]::Round(($validationResults.ValidFiles / $validationResults.TotalFiles) * 100, 2)
} else { 0 }

$rateColor = if ($validationRate -ge 90) { 'Green' } 
             elseif ($validationRate -ge 70) { 'Yellow' } 
             else { 'Red' }

Write-Host "Validation Rate: $validationRate%" -ForegroundColor $rateColor

# Display errors if any
if ($validationResults.InvalidFiles -gt 0) {
    Write-Host "\nFiles with validation errors:" -ForegroundColor Yellow
    foreach ($error in $validationResults.ValidationErrors) {
        Write-Host "  - $error" -ForegroundColor Red
    }
}

Write-Host "\n" + ("=" * 70) + "\n" -ForegroundColor Cyan

# Generate report if requested
if ($GenerateReport) {
    $reportDir = Split-Path $ReportPath -Parent
    if (-not (Test-Path $reportDir)) {
        New-Item -Path $reportDir -ItemType Directory -Force | Out-Null
    }
    
    $reportContent = @"
ELA Artifact Validation Report
Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
Target Path: $Path
Recursive: $Recursive

$("="*70)
VALIDATION SUMMARY
$("="*70)

Total Artifacts Scanned: $($validationResults.TotalFiles)
Valid Artifacts: $($validationResults.ValidFiles)
Invalid Artifacts: $($validationResults.InvalidFiles)
Validation Rate: $validationRate%

"@
    
    if ($validationResults.InvalidFiles -gt 0) {
        $reportContent += "\nFiles with Validation Errors:\n"
        foreach ($error in $validationResults.ValidationErrors) {
            $reportContent += "  - $error\n"
        }
    }
    
    if ($validationResults.Phases.Count -gt 0) {
        $reportContent += "\n$("="*70)\nPHASE DETAILS\n$("="*70)\n\n"
        foreach ($phase in $validationResults.Phases) {
            $reportContent += "Phase: $($phase.PhaseName)\n"
            $reportContent += "  Total: $($phase.Results.TotalFiles)\n"
            $reportContent += "  Valid: $($phase.Results.ValidFiles)\n"
            $reportContent += "  Invalid: $($phase.Results.InvalidFiles)\n\n"
        }
    }
    
    $reportContent | Out-File -FilePath $ReportPath -Encoding UTF8
    Write-Host "Validation report saved to: $ReportPath" -ForegroundColor Green
}

# Exit with appropriate code
if ($validationResults.InvalidFiles -gt 0) {
    Write-Warning "Validation completed with errors."
    exit 1
}
else {
    Write-Host "All artifacts validated successfully!" -ForegroundColor Green
    exit 0
}

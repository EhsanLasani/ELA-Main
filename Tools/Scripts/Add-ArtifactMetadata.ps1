<#
.SYNOPSIS
    Adds metadata frontmatter to artifact files and updates Catalogue.csv

.DESCRIPTION
    This script adds YAML frontmatter metadata to document files and updates
    the project's Catalogue.csv with artifact information. Supports the new
    extended column structure.

.PARAMETER FilePath
    Path to the artifact file to add metadata to

.PARAMETER ArtifactID
    Unique identifier for the artifact (auto-generated if not provided)

.PARAMETER ArtifactName
    Human-readable name of the artifact

.PARAMETER ArtifactType
    Type of artifact (e.g., requirement, design-doc, test-plan)

.PARAMETER Phase
    Project phase (e.g., 00_Policy, 01_Definition, 02_Design)

.PARAMETER Owner
    Owner/author of the artifact

.PARAMETER Status
    Current status (draft, in-review, approved, completed)

.PARAMETER UpdateCatalog
    If specified, updates the Catalogue.csv file

.EXAMPLE
    .\Add-ArtifactMetadata.ps1 -FilePath "./02_Design/System-Architecture.md" -ArtifactName "System Architecture" -ArtifactType "design-document" -Phase "02_Design" -Owner "John Doe" -Status "draft" -UpdateCatalog

.NOTES
    Author: ELA Framework Team
    Version: 1.0.0
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$FilePath,
    
    [Parameter(Mandatory = $false)]
    [string]$ArtifactID,
    
    [Parameter(Mandatory = $true)]
    [string]$ArtifactName,
    
    [Parameter(Mandatory = $true)]
    [ValidateSet('requirement', 'design-document', 'test-plan', 'deployment-guide', 'policy', 'process-doc', 'technical-spec', 'user-guide', 'other')]
    [string]$ArtifactType,
    
    [Parameter(Mandatory = $true)]
    [string]$Phase,
    
    [Parameter(Mandatory = $false)]
    [string]$Owner = $env:USERNAME,
    
    [Parameter(Mandatory = $false)]
    [ValidateSet('draft', 'in-review', 'approved', 'completed', 'deprecated')]
    [string]$Status = 'draft',
    
    [Parameter(Mandatory = $false)]
    [string]$Version = '1.0',
    
    [Parameter(Mandatory = $false)]
    [string]$Description = '',
    
    [Parameter(Mandatory = $false)]
    [string]$Dependencies = '',
    
    [Parameter(Mandatory = $false)]
    [string]$ProcessGroup = '',
    
    [Parameter(Mandatory = $false)]
    [string]$ProcessStep = '',
    
    [Parameter(Mandatory = $false)]
    [string]$TemplateSource = '',
    
    [Parameter(Mandatory = $false)]
    [string]$DerivedFrom = '',
    
    [Parameter(Mandatory = $false)]
    [string]$ProjectName = '',
    
    [Parameter(Mandatory = $false)]
    [switch]$UpdateCatalog
)

# Validate file exists
if (-not (Test-Path $FilePath)) {
    Write-Error "File not found: $FilePath"
    exit 1
}

# Generate Artifact ID if not provided
if (-not $ArtifactID) {
    $prefix = switch ($ArtifactType) {
        'requirement' { 'REQ' }
        'design-document' { 'DES' }
        'test-plan' { 'TST' }
        'deployment-guide' { 'DEP' }
        'policy' { 'POL' }
        'process-doc' { 'PROC' }
        'technical-spec' { 'SPEC' }
        'user-guide' { 'UG' }
        default { 'ART' }
    }
    $timestamp = Get-Date -Format 'yyyyMMddHHmmss'
    $ArtifactID = "$prefix-$timestamp"
}

# Read existing file content
$fileContent = Get-Content -Path $FilePath -Raw

# Check if file already has frontmatter
$hasFrontmatter = $fileContent -match '^---\s*\n'

if ($hasFrontmatter) {
    Write-Warning "File already contains frontmatter metadata. Skipping metadata addition."
    Write-Host "Use -Force parameter to overwrite existing metadata (not yet implemented)." -ForegroundColor Yellow
}
else {
    # Create metadata frontmatter
    $metadata = @"
---
artifact-id: $ArtifactID
artifact-name: $ArtifactName
artifact-type: $ArtifactType
phase: $Phase
version: $Version
status: $Status
owner: $Owner
last-updated: $(Get-Date -Format 'yyyy-MM-dd')
description: $Description
dependencies: $Dependencies
process-group: $ProcessGroup
process-step: $ProcessStep
template-source: $TemplateSource
derived-from: $DerivedFrom
project-name: $ProjectName
---

"@

    # Add metadata to file
    $newContent = $metadata + $fileContent
    $newContent | Out-File -FilePath $FilePath -Encoding UTF8 -NoNewline
    
    Write-Host "\nMetadata added successfully to: $FilePath" -ForegroundColor Green
    Write-Host "Artifact ID: $ArtifactID" -ForegroundColor Cyan
}

# Update Catalogue.csv if requested
if ($UpdateCatalog) {
    $catalogPath = Join-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) "Catalogue.csv"
    
    if (-not (Test-Path $catalogPath)) {
        Write-Error "Catalogue.csv not found at: $catalogPath"
        exit 1
    }
    
    Write-Host "\nUpdating Catalogue.csv..." -ForegroundColor Yellow
    
    # Read existing catalog
    $catalog = Import-Csv -Path $catalogPath
    
    # Get absolute file path
    $absolutePath = (Resolve-Path $FilePath).Path
    $relativePath = $FilePath
    
    # Check if entry already exists
    $existingEntry = $catalog | Where-Object { $_.ID -eq $ArtifactID -or $_.'File Path' -eq $relativePath }
    
    if ($existingEntry) {
        Write-Host "Entry already exists in catalog. Updating..." -ForegroundColor Yellow
        
        # Update existing entry
        $catalog = $catalog | ForEach-Object {
            if ($_.ID -eq $ArtifactID -or $_.'File Path' -eq $relativePath) {
                $_.ID = $ArtifactID
                $_.'Artifact Name' = $ArtifactName
                $_.'File Path' = $relativePath
                $_.'Artifact Type' = $ArtifactType
                $_.Version = $Version
                $_.Status = $Status
                $_.Owner = $Owner
                $_.'Last Updated' = Get-Date -Format 'yyyy-MM-dd'
                $_.Description = $Description
                $_.Phase = $Phase
                $_.Dependencies = $Dependencies
                $_.'Process Group' = $ProcessGroup
                $_.'Process Step' = $ProcessStep
                $_.'Template Source' = $TemplateSource
                $_.'Derived From' = $DerivedFrom
                $_.'Project Name' = $ProjectName
                $_.'Filled By' = $Owner
                $_.'Validation Status' = 'pending'
            }
            $_
        }
    }
    else {
        Write-Host "Adding new entry to catalog..." -ForegroundColor Green
        
        # Create new entry
        $newEntry = [PSCustomObject]@{
            'ID' = $ArtifactID
            'Artifact Name' = $ArtifactName
            'File Path' = $relativePath
            'Artifact Type' = $ArtifactType
            'Version' = $Version
            'Status' = $Status
            'Owner' = $Owner
            'Last Updated' = Get-Date -Format 'yyyy-MM-dd'
            'GitHub URL' = ''
            'Description' = $Description
            'Phase' = $Phase
            'Dependencies' = $Dependencies
            'Process Group' = $ProcessGroup
            'Process Step' = $ProcessStep
            'Template Source' = $TemplateSource
            'Derived From' = $DerivedFrom
            'Project Name' = $ProjectName
            'Filled By' = $Owner
            'Validation Status' = 'pending'
            'Comments' = ''
        }
        
        $catalog += $newEntry
    }
    
    # Save updated catalog
    $catalog | Export-Csv -Path $catalogPath -NoTypeInformation -Encoding UTF8
    Write-Host "Catalogue.csv updated successfully!" -ForegroundColor Green
}

Write-Host "\n" + ("=" * 60) -ForegroundColor Cyan
Write-Host "SUMMARY" -ForegroundColor Cyan
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host "File: $FilePath" -ForegroundColor White
Write-Host "Artifact ID: $ArtifactID" -ForegroundColor White
Write-Host "Artifact Name: $ArtifactName" -ForegroundColor White
Write-Host "Type: $ArtifactType" -ForegroundColor White
Write-Host "Phase: $Phase" -ForegroundColor White
Write-Host "Status: $Status" -ForegroundColor White
Write-Host "Owner: $Owner" -ForegroundColor White
if ($UpdateCatalog) {
    Write-Host "Catalog Updated: Yes" -ForegroundColor Green
}
Write-Host ("=" * 60) + "\n" -ForegroundColor Cyan

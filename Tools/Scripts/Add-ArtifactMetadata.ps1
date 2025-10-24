<#
.SYNOPSIS
    Automatically extracts and adds metadata to artifact files and updates Catalogue.csv

.DESCRIPTION
    This script automatically analyzes files to extract metadata without requiring manual input.
    It intelligently determines artifact type, phase, and other properties from file location,
    filename, and content analysis, then adds YAML frontmatter and updates Catalogue.csv.

.PARAMETER FilePath
    Path to the artifact file to analyze and add metadata to

.PARAMETER UpdateCatalog
    If specified, updates the Catalogue.csv file (default: true)

.PARAMETER Recursive
    Process all files in directory recursively

.EXAMPLE
    .\Add-ArtifactMetadata.ps1 -FilePath "./02_Design/System-Architecture.md"
    
.EXAMPLE
    .\Add-ArtifactMetadata.ps1 -FilePath "./03_Development" -Recursive

.NOTES
    Author: ELA Framework Team
    Version: 2.0.0 - Automated metadata extraction
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$FilePath,
    
    [Parameter(Mandatory = $false)]
    [switch]$UpdateCatalog = $true,
    
    [Parameter(Mandatory = $false)]
    [switch]$Recursive
)

# Function to determine artifact type from filename and content
function Get-ArtifactType {
    param([string]$filename, [string]$content)
    
    $filename = $filename.ToLower()
    
    # Analyze filename patterns
    if ($filename -match 'requirement|req-|spec-') { return 'requirement' }
    if ($filename -match 'design|architecture|arch-') { return 'design-document' }
    if ($filename -match 'test|testing|test-plan') { return 'test-plan' }
    if ($filename -match 'deploy|installation|setup') { return 'deployment-guide' }
    if ($filename -match 'policy|governance|compliance') { return 'policy' }
    if ($filename -match 'process|procedure|workflow') { return 'process-doc' }
    if ($filename -match 'technical|tech-spec|api') { return 'technical-spec' }
    if ($filename -match 'user-guide|manual|help') { return 'user-guide' }
    if ($filename -match 'readme|documentation') { return 'documentation' }
    
    # Analyze content patterns
    if ($content -match '(?i)(requirement|shall|must|should).*:') { return 'requirement' }
    if ($content -match '(?i)(architecture|system design|component)') { return 'design-document' }
    if ($content -match '(?i)(test case|test scenario|testing)') { return 'test-plan' }
    
    return 'other'
}

# Function to extract phase from file path
function Get-PhaseFromPath {
    param([string]$filepath)
    
    if ($filepath -match '\\(\d{2}_[^\\]+)\\' -or $filepath -match '/(\d{2}_[^/]+)/') {
        return $matches[1]
    }
    return 'unknown'
}

# Function to extract title from content
function Get-DocumentTitle {
    param([string]$content)
    
    # Look for H1 markdown title
    if ($content -match '^#\s+(.+)$') {
        return $matches[1].Trim()
    }
    
    # Look for title in existing frontmatter
    if ($content -match 'title:\s*(.+)$') {
        return $matches[1].Trim()
    }
    
    return ''
}

# Function to process a single file
function Process-ArtifactFile {
    param([string]$filepath)
    
    Write-Host "\nProcessing: $filepath" -ForegroundColor Cyan
    
    if (-not (Test-Path $filepath)) {
        Write-Warning "File not found: $filepath"
        return
    }
    
    # Read file content
    $content = Get-Content -Path $filepath -Raw -ErrorAction SilentlyContinue
    if (-not $content) {
        Write-Warning "Could not read file content: $filepath"
        return
    }
    
    # Skip if already has frontmatter
    if ($content -match '^---\s*\n') {
        Write-Host "  ✓ Already has metadata frontmatter" -ForegroundColor Green
        
        # Still update catalog if requested
        if ($UpdateCatalog) {
            Update-CatalogFromExistingMetadata -FilePath $filepath -Content $content
        }
        return
    }
    
    # Extract information automatically
    $fileInfo = Get-Item $filepath
    $filename = $fileInfo.Name
    $artifactType = Get-ArtifactType -filename $filename -content $content
    $phase = Get-PhaseFromPath -filepath $filepath
    $title = Get-DocumentTitle -content $content
    
    # Generate artifact ID
    $prefix = switch ($artifactType) {
        'requirement' { 'REQ' }
        'design-document' { 'DES' }
        'test-plan' { 'TST' }
        'deployment-guide' { 'DEP' }
        'policy' { 'POL' }
        'process-doc' { 'PROC' }
        'technical-spec' { 'SPEC' }
        'user-guide' { 'UG' }
        'documentation' { 'DOC' }
        default { 'ART' }
    }
    
    $timestamp = Get-Date -Format 'yyyyMMddHHmmss'
    $artifactID = "$prefix-$timestamp"
    
    # Use extracted title or generate from filename
    $artifactName = if ($title) { $title } else { $filename -replace '\.[^.]+$', '' -replace '[_-]', ' ' }
    
    # Determine process group based on phase
    $processGroup = switch ($phase) {
        {$_ -match '00_Policy'} { 'Governance' }
        {$_ -match '01_Definition'} { 'Analysis' }
        {$_ -match '02_Design'} { 'Architecture' }
        {$_ -match '03_Development'} { 'Implementation' }
        {$_ -match '04_Systems_Integration'} { 'Integration' }
        {$_ -match '05_Testing'} { 'Quality Assurance' }
        {$_ -match '06_Deployment'} { 'Delivery' }
        {$_ -match '07_Operations'} { 'Operations' }
        {$_ -match '08_Change_Management'} { 'Change Control' }
        default { 'General' }
    }
    
    # Create metadata frontmatter
    $metadata = @"
---
artifact-id: $artifactID
artifact-name: $artifactName
artifact-type: $artifactType
phase: $phase
version: 1.0
status: draft
owner: $env:USERNAME
last-updated: $(Get-Date -Format 'yyyy-MM-dd')
description: Auto-generated metadata
process-group: $processGroup
project-name: ELA-Main
---

"@
    
    # Add metadata to file
    $newContent = $metadata + $content
    $newContent | Out-File -FilePath $filepath -Encoding UTF8 -NoNewline
    
    Write-Host "  ✓ Added metadata:" -ForegroundColor Green
    Write-Host "    - ID: $artifactID" -ForegroundColor White
    Write-Host "    - Type: $artifactType" -ForegroundColor White
    Write-Host "    - Phase: $phase" -ForegroundColor White
    Write-Host "    - Name: $artifactName" -ForegroundColor White
    
    # Update catalog
    if ($UpdateCatalog) {
        Update-CatalogEntry -FilePath $filepath -ArtifactID $artifactID -ArtifactName $artifactName -ArtifactType $artifactType -Phase $phase -ProcessGroup $processGroup
    }
}

# Function to update catalog from existing metadata
function Update-CatalogFromExistingMetadata {
    param([string]$FilePath, [string]$Content)
    
    # Extract metadata from existing frontmatter
    if ($Content -match '---\s*\n([\s\S]*?)\n---') {
        $frontmatter = $matches[1]
        
        $artifactID = if ($frontmatter -match 'artifact-id:\s*(.+)') { $matches[1].Trim() } else { 'UNKNOWN' }
        $artifactName = if ($frontmatter -match 'artifact-name:\s*(.+)') { $matches[1].Trim() } else { 'Unknown' }
        $artifactType = if ($frontmatter -match 'artifact-type:\s*(.+)') { $matches[1].Trim() } else { 'other' }
        $phase = if ($frontmatter -match 'phase:\s*(.+)') { $matches[1].Trim() } else { 'unknown' }
        $processGroup = if ($frontmatter -match 'process-group:\s*(.+)') { $matches[1].Trim() } else { 'General' }
        
        Update-CatalogEntry -FilePath $FilePath -ArtifactID $artifactID -ArtifactName $artifactName -ArtifactType $artifactType -Phase $phase -ProcessGroup $processGroup
    }
}

# Function to update catalog entry
function Update-CatalogEntry {
    param($FilePath, $ArtifactID, $ArtifactName, $ArtifactType, $Phase, $ProcessGroup)
    
    $catalogPath = Join-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) "Catalogue.csv"
    
    if (-not (Test-Path $catalogPath)) {
        Write-Warning "Catalogue.csv not found at: $catalogPath"
        return
    }
    
    # Read existing catalog
    $catalog = Import-Csv -Path $catalogPath -ErrorAction SilentlyContinue
    if (-not $catalog) {
        Write-Warning "Could not read Catalogue.csv"
        return
    }
    
    $relativePath = $FilePath
    
    # Check if entry exists
    $existingEntry = $catalog | Where-Object { $_.ID -eq $ArtifactID -or $_.'File Path' -eq $relativePath }
    
    if ($existingEntry) {
        Write-Host "    - Updated existing catalog entry" -ForegroundColor Yellow
        
        # Update existing entry
        $catalog = $catalog | ForEach-Object {
            if ($_.ID -eq $ArtifactID -or $_.'File Path' -eq $relativePath) {
                $_.ID = $ArtifactID
                $_.'Artifact Name' = $ArtifactName
                $_.'File Path' = $relativePath
                $_.'Artifact Type' = $ArtifactType
                $_.'Last Updated' = Get-Date -Format 'yyyy-MM-dd'
                $_.Phase = $Phase
                $_.'Process Group' = $ProcessGroup
                $_.'Filled By' = $env:USERNAME
                $_.'Validation Status' = 'pending'
            }
            $_
        }
    }
    else {
        Write-Host "    - Added new catalog entry" -ForegroundColor Green
        
        # Create new entry
        $newEntry = [PSCustomObject]@{
            'ID' = $ArtifactID
            'Artifact Name' = $ArtifactName
            'File Path' = $relativePath
            'Artifact Type' = $ArtifactType
            'Version' = '1.0'
            'Status' = 'draft'
            'Owner' = $env:USERNAME
            'Last Updated' = Get-Date -Format 'yyyy-MM-dd'
            'GitHub URL' = ''
            'Description' = 'Auto-generated metadata'
            'Phase' = $Phase
            'Dependencies' = ''
            'Process Group' = $ProcessGroup
            'Process Step' = ''
            'Template Source' = ''
            'Derived From' = ''
            'Project Name' = 'ELA-Main'
            'Filled By' = $env:USERNAME
            'Validation Status' = 'pending'
            'Comments' = 'Auto-generated by Add-ArtifactMetadata.ps1'
        }
        
        $catalog += $newEntry
    }
    
    # Save updated catalog
    try {
        $catalog | Export-Csv -Path $catalogPath -NoTypeInformation -Encoding UTF8
    }
    catch {
        Write-Warning "Failed to update catalog: $_"
    }
}

# Main execution
Write-Host "\n" + ("=" * 70) -ForegroundColor Cyan
Write-Host "ELA Automated Metadata Extraction Tool" -ForegroundColor Cyan
Write-Host ("=" * 70) + "\n" -ForegroundColor Cyan

if (Test-Path $FilePath -PathType Container) {
    # Directory processing
    Write-Host "Processing directory: $FilePath" -ForegroundColor Yellow
    
    $searchParams = @{
        Path = $FilePath
        Include = @('*.md', '*.txt')
        File = $true
    }
    
    if ($Recursive) {
        $searchParams.Recurse = $true
        Write-Host "Mode: Recursive" -ForegroundColor Yellow
    }
    
    $files = Get-ChildItem @searchParams
    Write-Host "Found $($files.Count) files to process\n" -ForegroundColor White
    
    foreach ($file in $files) {
        Process-ArtifactFile -filepath $file.FullName
    }
}
else {
    # Single file processing
    Process-ArtifactFile -filepath $FilePath
}

Write-Host "\n" + ("=" * 70) -ForegroundColor Cyan
Write-Host "Processing completed!" -ForegroundColor Green
Write-Host ("=" * 70) + "\n" -ForegroundColor Cyan

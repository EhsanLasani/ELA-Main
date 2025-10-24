<#
.SYNOPSIS
    Automatically extracts and adds metadata to artifact files and updates Catalogue.csv

.DESCRIPTION
    This script automatically analyzes files to extract metadata without requiring manual input.
    It intelligently determines artifact types, phase, and other properties from file location,
    filename, and content analysis, then adds YAML frontmatter and updates Catalogue.csv.
    All metadata follows Artifact_Metadata_Standards.md specifications.

.PARAMETER FilePath
    Path to the artifact file to analyze and add metadata to

.PARAMETER UpdateCatalog
    If specified, updates the Catalogue.csv file (default: True)

.PARAMETER Recursive
    Process all files in directory recursively

.EXAMPLE
    .\Add-ArtifactMetadata.ps1 -FilePath "./02_Design/System_Architecture.md"

.EXAMPLE
    .\Add-ArtifactMetadata.ps1 -FilePath "*/04_Development" -Recursive

.NOTES
    Author: ETA Framework Team
    Version: 2.0.0  Automated metadata extraction
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

# Function to load artifact metadata standards
function Get-MetadataStandards {
    param([string]$RepoRoot)
    
    $standardsPath = Join-Path $RepoRoot "00_Policy/Artifact_Metadata_Standards.md"
    
    if (-not (Test-Path $standardsPath)) {
        Write-Warning "Artifact_Metadata_Standards.md not found at: $standardsPath"
        return $null
    }
    
    $standards = @{}
    $content = Get-Content $standardsPath -Raw
    
    # Define metadata structure for each artifact type based on standards
    $standards['DOC'] = @{
        'Type' = 'DOC'
        'Subtypes' = @('DOC-POL', 'DOC-GDL', 'DOC-REF', 'DOC-README')
        'MandatoryFields' = @('Artifact_ID', 'Version', 'Owner', 'Status', 'Last_Updated', 'Artifact_Type', 'Description', 'Phase', 'Dependencies')
        'OptionalFields' = @('Custodian', 'Effective_Date', 'Review_Cycle', 'Compliance_Standards', 'Approved_By', 'Linked_PR')
        'Format' = @{
            'Artifact_ID' = 'DOC-[PHASE]-[NAME]'
            'Version' = 'Semantic (v#.#)'
            'Status' = 'Enum (Draft|Active|Under Review|Archived|Deprecated)'
            'Last_Updated' = 'YYYY-MM-DD'
        }
    }
    
    $standards['TMP'] = @{
        'Type' = 'TMP'
        'Subtypes' = @('TMP-DEF', 'TMP-FIL')
        'MandatoryFields' = @('Artifact_ID', 'Version', 'Owner', 'Status', 'Last_Updated', 'Artifact_Type', 'Description', 'Phase', 'Template_Source', 'Filled_By')
        'OptionalFields' = @('Project_Name', 'Custodian')
    }
    
    $standards['GDL'] = @{
        'Type' = 'GDL'
        'Subtypes' = @('GDL-DEV', 'GDL-ARCH', 'GDL-SEC')
        'MandatoryFields' = @('Artifact_ID', 'Version', 'Owner', 'Status', 'Last_Updated', 'Artifact_Type', 'Description', 'Phase')
        'OptionalFields' = @('Effective_Date', 'Review_Cycle', 'Process_Group')
    }
    
    $standards['VAL'] = @{
        'Type' = 'VAL'
        'Subtypes' = @('VAL-RULE', 'VAL-CHK')
        'MandatoryFields' = @('Artifact_ID', 'Version', 'Owner', 'Status', 'Last_Updated', 'Artifact_Type', 'Description', 'Validation_Type')
    }
    
    $standards['WFL'] = @{
        'Type' = 'WFL'
        'Subtypes' = @('WFL-CI', 'WFL-CD', 'WFL-TEST')
        'MandatoryFields' = @('Artifact_ID', 'Version', 'Owner', 'Status', 'Last_Updated', 'Artifact_Type', 'Description', 'Phase')
    }
    
    $standards['SCR'] = @{
        'Type' = 'SCR'
        'Subtypes' = @('SCR-PS', 'SCR-PY', 'SCR-SH')
        'MandatoryFields' = @('Artifact_ID', 'Version', 'Owner', 'Status', 'Last_Updated', 'Artifact_Type', 'Description')
    }
    
    $standards['IMG'] = @{
        'Type' = 'IMG'
        'Subtypes' = @('IMG-ARCH', 'IMG-PROC', 'IMG-UI')
        'MandatoryFields' = @('Artifact_ID', 'Version', 'Owner', 'Last_Updated', 'Artifact_Type', 'Description')
    }
    
    $standards['CFG'] = @{
        'Type' = 'CFG'
        'Subtypes' = @('CFG-ENV', 'CFG-SYS')
        'MandatoryFields' = @('Artifact_ID', 'Version', 'Owner', 'Status', 'Last_Updated', 'Artifact_Type', 'Description', 'Environment')
    }
    
    $standards['TST'] = @{
        'Type' = 'TST'
        'Subtypes' = @('TST-UNIT', 'TST-INT', 'TST-E2E')
        'MandatoryFields' = @('Artifact_ID', 'Version', 'Owner', 'Status', 'Last_Updated', 'Artifact_Type', 'Description', 'Test_Type')
    }
    
    $standards['DAT'] = @{
        'Type' = 'DAT'
        'Subtypes' = @('DAT-CSV', 'DAT-JSON', 'DAT-SQL')
        'MandatoryFields' = @('Artifact_ID', 'Version', 'Owner', 'Last_Updated', 'Artifact_Type', 'Description', 'Data_Format')
    }
    
    return $standards
}

# Function to determine artifact type from filename and content
function Get-ArtifactType {
    param([string]$FilePath, [string]$Content)
    
    $filename = Split-Path $FilePath -Leaf
    $extension = [System.IO.Path]::GetExtension($filename)
    
    # Analyze filename patterns
    if ($filename -match "requirement") { return "requirement" }
    if ($filename -match "design|architecture") { return "design-document" }
    if ($filename -match "test") { return "test" }
    if ($filename -match "template") { return "template" }
    if ($filename -match "policy|guideline") { return "policy" }
    if ($filename -match "workflow|pipeline") { return "workflow" }
    if ($filename -match "validation|checklist") { return "validation" }
    if ($filename -match "config") { return "configuration" }
    if ($filename -match "README") { return "readme" }
    if ($filename -match "script") { return "script" }
    
    # Analyze by extension
    switch ($extension) {
        ".md" { 
            if ($Content -match "(?m)^#\s+(Policy|Guideline)") { return "policy" }
            if ($Content -match "(?m)^#\s+Template") { return "template" }
            return "document" 
        }
        ".ps1" { return "script" }
        ".py" { return "script" }
        ".sh" { return "script" }
        ".yml" { return "workflow" }
        ".yaml" { return "workflow" }
        ".json" { return "configuration" }
        ".png" { return "diagram" }
        ".jpg" { return "diagram" }
        ".svg" { return "diagram" }
        ".csv" { return "data" }
        default { return "document" }
    }
}

# Function to extract phase from path
function Get-PhaseFromPath {
    param([string]$FilePath)
    
    $pathParts = $FilePath -split '[\\/]'
    foreach ($part in $pathParts) {
        if ($part -match "^(\d{2})_(.+)$") {
            $phaseNum = $Matches[1]
            $phaseName = $Matches[2]
            return @{
                'Number' = $phaseNum
                'Name' = $phaseName
                'FullName' = "$phaseNum`_$phaseName"
            }
        }
    }
    return @{ 'Number' = '00'; 'Name' = 'Policy'; 'FullName' = '00_Policy' }
}

# Function to extract document title from content
function Get-DocumentTitle {
    param([string]$Content)
    
    # Look for H1 heading
    if ($Content -match "(?m)^#\s+(.+?)\s*$") {
        return $Matches[1].Trim()
    }
    
    # Look for title in existing YAML
    if ($Content -match "(?ms)^---\s*\n.*?^title:\s*(.+?)\s*$.*?^---") {
        return $Matches[1].Trim()
    }
    
    return "Untitled Document"
}

# Function to generate Artifact ID
function New-ArtifactID {
    param(
        [string]$Type,
        [string]$Phase,
        [string]$Name
    )
    
    $cleanName = $Name -replace "[^a-zA-Z0-9_-]", "_"
    $cleanName = $cleanName.Substring(0, [Math]::Min(20, $cleanName.Length))
    
    # Map artifact types to prefixes
    $typePrefix = switch -Regex ($Type) {
        "document|policy|readme" { "DOC" }
        "template" { "TMP" }
        "guideline" { "GDL" }
        "validation" { "VAL" }
        "workflow" { "WFL" }
        "script" { "SCR" }
        "diagram" { "IMG" }
        "configuration|config" { "CFG" }
        "test" { "TST" }
        "data" { "DAT" }
        default { "DOC" }
    }
    
    return "$typePrefix-$Phase-$cleanName"
}

# Function to map artifact type to standards type code
function Get-StandardsTypeCode {
    param([string]$Type)
    
    $typeMap = @{
        'document' = 'DOC'
        'policy' = 'DOC'
        'readme' = 'DOC'
        'template' = 'TMP'
        'guideline' = 'GDL'
        'validation' = 'VAL'
        'workflow' = 'WFL'
        'script' = 'SCR'
        'diagram' = 'IMG'
        'configuration' = 'CFG'
        'config' = 'CFG'
        'test' = 'TST'
        'data' = 'DAT'
    }
    
    if ($typeMap.ContainsKey($Type)) {
        return $typeMap[$Type]
    }
    return 'DOC'
}

# Function to process artifact file and extract metadata
function Process-ArtifactFile {
    param(
        [string]$FilePath,
        [hashtable]$Standards,
        [string]$RepoRoot
    )
    
    Write-Host "Processing: $FilePath" -ForegroundColor Cyan
    
    # Read file content
    $content = Get-Content $FilePath -Raw -ErrorAction SilentlyContinue
    if (-not $content) {
        Write-Warning "Could not read file: $FilePath"
        return $null
    }

    # Extract metadata
    $artifactType = Get-ArtifactType -FilePath $FilePath -Content $content
    $phase = Get-PhaseFromPath -FilePath $FilePath
    $title = Get-DocumentTitle -Content $content
    $filename = Split-Path $FilePath -Leaf
    $nameWithoutExt = [System.IO.Path]::GetFileNameWithoutExtension($filename)

    # Generate Artifact ID
    $artifactID = New-ArtifactID -Type $artifactType -Phase $phase.Number -Name $nameWithoutExt

    # Get standards type code
    $typeCode = Get-StandardsTypeCode -Type $artifactType

    # Get relative path from repo root
    $relativePath = $FilePath -replace [regex]::Escape($RepoRoot), "" -replace "^[\\/]", ""

    # Build GitHub URL
    $githubURL = "https://github.com/EhsanLasani/ELA-Main/blob/main/$($relativePath -replace '\\', '/')"

    # Create metadata object based on standards
    $metadata = @{
        'Artifact_ID' = $artifactID
        'Artifact_Name' = $title
        'File_Path' = $relativePath -replace '\\', '/'
        'Artifact_Type' = $typeCode
        'Version' = 'v1.0'
        'Status' = 'Draft'
        'Owner' = 'Enterprise Architecture Office (EAO)'
        'Last_Updated' = Get-Date -Format "yyyy-MM-dd"
        'GitHub_URL' = $githubURL
        'Description' = $title
        'Phase' = $phase.Name
        'Dependencies' = 'None'
        'Process_Group' = $phase.Name
        'Process_Step' = 'N/A'
        'Template_Source' = if ($artifactType -eq 'template') { 'ELA-Template' } else { '' }
        'Derived_From' = ''
        'Project_Name' = ''
        'Filled_By' = ''
        'Validation_Status' = 'Pending'
        'Comments' = "Auto-generated on $(Get-Date -Format 'yyyy-MM-dd')"
    }

    # Add or update YAML frontmatter in Markdown files
    if ($FilePath -match '\.md$') {
        # Remove all YAML frontmatter blocks and all lines starting with 'Comments:' or any metadata key, anywhere in the file
        $metaKeys = $metadata.Keys -join '|'
        $content = $content -replace "(?ms)^---[\s\S]*?---[\r\n]*", ''
        $content = $content -replace "(?m)^(($metaKeys|Comments):.*)$", ''
        $content = $content -replace "\n{3,}", "\n\n"  # Remove excessive blank lines
        $yaml = "---`n"
        foreach ($pair in $metadata.GetEnumerator() | Sort-Object Name) {
            $yaml += ("{0}: {1}`n" -f $pair.Key, $pair.Value)
        }
        $yaml += "---`n"
    $content = "## Metadata`n" + $yaml + $content.TrimStart()
    Set-Content -Path $FilePath -Value $content -NoNewline
    }

    Write-Host "  Type: $typeCode | Phase: $($phase.Name) | ID: $artifactID" -ForegroundColor Green
    return $metadata
}

# Function to update Catalogue.csv
function Update-CatalogEntry {
    param(
        [string]$CatalogPath,
        [hashtable]$Metadata
    )
    
    Write-Host "Updating catalog: $CatalogPath" -ForegroundColor Yellow
    
    # Read existing catalog
    $catalog = @()
    if (Test-Path $CatalogPath) {
        $imported = Import-Csv $CatalogPath
        if ($imported) {
            if ($imported -is [System.Array]) {
                $catalog = $imported
            } else {
                $catalog = @($imported)
            }
        }
    }
    
    # Check if entry already exists (by File Path or Artifact_ID)
    $existingEntry = $catalog | Where-Object { $_.'File Path' -eq $Metadata.File_Path -or $_.ID -eq $Metadata.Artifact_ID }

    if ($existingEntry) {
        Write-Host "  Updating existing entry" -ForegroundColor Yellow
        foreach ($entry in $existingEntry) {
            $entry.ID = $Metadata.Artifact_ID
            $entry.'Artifact Name' = $Metadata.Artifact_Name
            $entry.'File Path' = $Metadata.File_Path
            $entry.'Artifact Type' = $Metadata.Artifact_Type
            $entry.Version = $Metadata.Version
            $entry.Status = $Metadata.Status
            $entry.Owner = $Metadata.Owner
            $entry.'Last Updated' = $Metadata.Last_Updated
            $entry.'GitHub URL' = $Metadata.GitHub_URL
            $entry.Description = $Metadata.Description
            $entry.Phase = $Metadata.Phase
            $entry.Dependencies = $Metadata.Dependencies
            $entry.'Process Group' = $Metadata.Process_Group
            $entry.'Process Step' = $Metadata.Process_Step
            $entry.'Template Source' = $Metadata.Template_Source
            $entry.'Derived From' = $Metadata.Derived_From
            $entry.'Project Name' = $Metadata.Project_Name
            $entry.'Filled By' = $Metadata.Filled_By
            $entry.'Validation Status' = $Metadata.Validation_Status
            $entry.Comments = $Metadata.Comments
        }
    } else {
        Write-Host "  Adding new entry" -ForegroundColor Green
        # Create new entry
        $newEntry = [PSCustomObject]@{
            'ID' = $Metadata.Artifact_ID
            'Artifact Name' = $Metadata.Artifact_Name
            'File Path' = $Metadata.File_Path
            'Artifact Type' = $Metadata.Artifact_Type
            'Version' = $Metadata.Version
            'Status' = $Metadata.Status
            'Owner' = $Metadata.Owner
            'Last Updated' = $Metadata.Last_Updated
            'GitHub URL' = $Metadata.GitHub_URL
            'Description' = $Metadata.Description
            'Phase' = $Metadata.Phase
            'Dependencies' = $Metadata.Dependencies
            'Process Group' = $Metadata.Process_Group
            'Process Step' = $Metadata.Process_Step
            'Template Source' = $Metadata.Template_Source
            'Derived From' = $Metadata.Derived_From
            'Project Name' = $Metadata.Project_Name
            'Filled By' = $Metadata.Filled_By
            'Validation Status' = $Metadata.Validation_Status
            'Comments' = $Metadata.Comments
        }
        $catalog = @($catalog) + $newEntry
    }
    
    # Deduplicate: keep only the latest entry for each unique (ID, File Path) pair
    $deduped = @()
    $seen = @{}
    foreach ($entry in [System.Collections.Generic.List[object]]($catalog | Sort-Object 'Last Updated' -Descending)) {
        $key = "$($entry.ID)|$($entry.'File Path')"
        if (-not $seen.ContainsKey($key)) {
            $deduped += $entry
            $seen[$key] = $true
        }
    }
    $deduped = $deduped | Sort-Object 'ID'
    $deduped | Export-Csv $CatalogPath -NoTypeInformation -Force
    Write-Host "  Catalog updated successfully (deduplicated by ID and File Path)" -ForegroundColor Green
}

# Main script execution
try {
    Write-Host "`n========================================" -ForegroundColor Magenta
    Write-Host "Artifact Metadata Extraction Script" -ForegroundColor Magenta
    Write-Host "Version 2.0 - Standards-Compliant" -ForegroundColor Magenta
    Write-Host "========================================`n" -ForegroundColor Magenta
    
    # Find repository root
    $repoRoot = (Get-Location).Path
    while (-not (Test-Path (Join-Path $repoRoot ".git")) -and $repoRoot -ne [System.IO.Path]::GetPathRoot($repoRoot)) {
        $repoRoot = Split-Path $repoRoot -Parent
    }
    
    if (-not (Test-Path (Join-Path $repoRoot ".git"))) {
        Write-Warning "Not in a Git repository. Using current directory as root."
        $repoRoot = (Get-Location).Path
    }
    
    Write-Host "Repository root: $repoRoot`n" -ForegroundColor Gray
    
    # Load metadata standards
    Write-Host "Loading Artifact Metadata Standards..." -ForegroundColor Cyan
    $standards = Get-MetadataStandards -RepoRoot $repoRoot
    
    if ($standards) {
        Write-Host "Standards loaded: $($standards.Keys.Count) artifact types defined`n" -ForegroundColor Green
    } else {
        Write-Warning "Could not load standards. Proceeding with default configuration.`n"
    }
    
    # Always use the correct catalog path in ELA-Main/ELA-Main/catalog.csv
    $catalogPath = Join-Path $repoRoot "catalog.csv"
    if (-not (Test-Path $catalogPath)) {
        # If not found, try ELA-Main/ELA-Main/catalog.csv
        $catalogPath = Join-Path $repoRoot "ELA-Main/catalog.csv"
        if (-not (Test-Path $catalogPath)) {
            # If still not found, create in current working directory
            $catalogPath = Join-Path (Get-Location) "catalog.csv"
        }
    }
    
    # Process file(s)
    $filesToProcess = @()
    
    if ($Recursive) {
        # Process all markdown files in directory
        $targetPath = Join-Path $repoRoot $FilePath
        if (Test-Path $targetPath -PathType Container) {
            $filesToProcess = Get-ChildItem -Path $targetPath -Recurse -Include *.md,*.ps1,*.py,*.yml,*.yaml,*.json
            Write-Host "Found $($filesToProcess.Count) files to process`n" -ForegroundColor Cyan
        } else {
            Write-Error "Directory not found: $targetPath"
            exit 1
        }
    } else {
        # Process single file
        $fullPath = if ([System.IO.Path]::IsPathRooted($FilePath)) { 
            $FilePath 
        } else { 
            Join-Path $repoRoot $FilePath 
        }
        
        if (-not (Test-Path $fullPath)) {
            Write-Error "File not found: $fullPath"
            exit 1
        }
        
        $filesToProcess = @(Get-Item $fullPath)
    }
    
    # Process each file
    $processedCount = 0
    $errorCount = 0
    
    foreach ($file in $filesToProcess) {
        try {
            $metadata = Process-ArtifactFile -FilePath $file.FullName -Standards $standards -RepoRoot $repoRoot
            
            if ($metadata -and $UpdateCatalog) {
                Update-CatalogEntry -CatalogPath $catalogPath -Metadata $metadata
                $processedCount++
            }
        } catch {
            Write-Error "Error processing $($file.Name): $_"
            $errorCount++
        }
        
        Write-Host ""
    }
    
    # Summary
    Write-Host "`n========================================" -ForegroundColor Magenta
    Write-Host "Processing Complete" -ForegroundColor Magenta
    Write-Host "========================================" -ForegroundColor Magenta
    Write-Host "Successfully processed: $processedCount files" -ForegroundColor Green
    if ($errorCount -gt 0) {
        Write-Host "Errors encountered: $errorCount files" -ForegroundColor Red
    }
    Write-Host "Catalog location: $catalogPath`n" -ForegroundColor Gray
    
} catch {
    Write-Error "Fatal error: $_"
    Write-Error $_.ScriptStackTrace
    exit 1
}

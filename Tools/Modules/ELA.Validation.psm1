<#
.SYNOPSIS
    ELA Validation Module - Document and artifact validation functions

.DESCRIPTION
    This module provides validation functions for ELA framework artifacts,
    ensuring compliance with document structure guidelines and metadata standards.

.NOTES
    Module: ELA.Validation
    Author: ELA Framework Team
    Version: 1.0.0
#>

# Module variables
$script:ValidationRulesPath = "$PSScriptRoot/../Config/validation-rules.json"
$script:ArtifactTypesPath = "$PSScriptRoot/../Config/artifact-types.json"

<#
.SYNOPSIS
    Tests if an artifact file has valid metadata structure

.PARAMETER Path
    Path to the artifact file to validate

.EXAMPLE
    Test-ArtifactMetadata -Path "./03_Development/Design-Doc.md"
#>
function Test-ArtifactMetadata {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$Path
    )

    process {
        if (-not (Test-Path $Path)) {
            Write-Error "File not found: $Path"
            return $false
        }

        try {
            $content = Get-Content -Path $Path -Raw
            
            # Check for required metadata fields
            $requiredFields = @('artifact-id', 'artifact-type', 'phase', 'version', 'status')
            $missingFields = @()
            
            foreach ($field in $requiredFields) {
                if ($content -notmatch "$field:") {
                    $missingFields += $field
                }
            }
            
            if ($missingFields.Count -gt 0) {
                Write-Warning "Missing required metadata fields in $Path: $($missingFields -join ', ')"
                return $false
            }
            
            Write-Verbose "Artifact metadata validation passed for: $Path"
            return $true
        }
        catch {
            Write-Error "Error validating metadata: $_"
            return $false
        }
    }
}

<#
.SYNOPSIS
    Validates document structure against ELA guidelines

.PARAMETER Path
    Path to the document to validate

.PARAMETER ArtifactType
    Type of artifact to validate against

.EXAMPLE
    Test-DocumentStructure -Path "./Design-Doc.md" -ArtifactType "design-document"
#>
function Test-DocumentStructure {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,
        
        [Parameter(Mandatory = $false)]
        [string]$ArtifactType
    )

    if (-not (Test-Path $Path)) {
        Write-Error "Document not found: $Path"
        return $false
    }

    try {
        $content = Get-Content -Path $Path -Raw
        $validationResults = @{
            HasMetadata = $content -match '---\s*\n[\s\S]*?---'
            HasTitle = $content -match '^#\s+.+'
            HasSections = ($content -split '^##\s+').Count -gt 1
            IsValid = $true
        }

        if (-not $validationResults.HasMetadata) {
            Write-Warning "Document missing metadata frontmatter: $Path"
            $validationResults.IsValid = $false
        }

        if (-not $validationResults.HasTitle) {
            Write-Warning "Document missing H1 title: $Path"
            $validationResults.IsValid = $false
        }

        if (-not $validationResults.HasSections) {
            Write-Warning "Document should have at least one H2 section: $Path"
            $validationResults.IsValid = $false
        }

        return $validationResults.IsValid
    }
    catch {
        Write-Error "Error validating document structure: $_"
        return $false
    }
}

<#
.SYNOPSIS
    Validates artifact naming convention

.PARAMETER FileName
    Name of the file to validate

.PARAMETER ArtifactType
    Expected artifact type

.EXAMPLE
    Test-ArtifactNaming -FileName "REQ-001-User-Authentication.md" -ArtifactType "requirement"
#>
function Test-ArtifactNaming {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$FileName,
        
        [Parameter(Mandatory = $false)]
        [string]$ArtifactType
    )

    # Standard naming pattern: PREFIX-NNN-Description.ext
    $namingPattern = '^[A-Z]{2,5}-\d{3,4}-.+\.(md|docx|pdf|txt)$'
    
    if ($FileName -match $namingPattern) {
        Write-Verbose "Artifact naming validation passed: $FileName"
        return $true
    }
    else {
        Write-Warning "Artifact naming does not follow convention: $FileName (Expected: PREFIX-NNN-Description.ext)"
        return $false
    }
}

<#
.SYNOPSIS
    Validates all artifacts in a phase directory

.PARAMETER PhasePath
    Path to the phase directory

.PARAMETER Recursive
    Include subdirectories in validation

.EXAMPLE
    Test-PhaseArtifacts -PhasePath "./03_Development" -Recursive
#>
function Test-PhaseArtifacts {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$PhasePath,
        
        [Parameter(Mandatory = $false)]
        [switch]$Recursive
    )

    if (-not (Test-Path $PhasePath)) {
        Write-Error "Phase directory not found: $PhasePath"
        return @{ TotalFiles = 0; ValidFiles = 0; InvalidFiles = 0; ValidationRate = 0 }
    }

    $searchParams = @{
        Path = $PhasePath
        Include = @('*.md', '*.docx', '*.pdf')
        File = $true
    }
    
    if ($Recursive) {
        $searchParams.Recurse = $true
    }

    $artifacts = Get-ChildItem @searchParams
    $results = @{
        TotalFiles = $artifacts.Count
        ValidFiles = 0
        InvalidFiles = 0
        ValidationErrors = @()
    }

    foreach ($artifact in $artifacts) {
        $isValid = Test-ArtifactMetadata -Path $artifact.FullName
        
        if ($isValid) {
            $results.ValidFiles++
        }
        else {
            $results.InvalidFiles++
            $results.ValidationErrors += $artifact.FullName
        }
    }

    $results.ValidationRate = if ($results.TotalFiles -gt 0) {
        [math]::Round(($results.ValidFiles / $results.TotalFiles) * 100, 2)
    } else { 0 }

    return $results
}

<#
.SYNOPSIS
    Loads and validates validation rules configuration

.EXAMPLE
    Get-ValidationRules
#>
function Get-ValidationRules {
    [CmdletBinding()]
    param()

    if (Test-Path $script:ValidationRulesPath) {
        try {
            $rules = Get-Content -Path $script:ValidationRulesPath -Raw | ConvertFrom-Json
            return $rules
        }
        catch {
            Write-Warning "Failed to load validation rules: $_"
            return $null
        }
    }
    else {
        Write-Warning "Validation rules file not found: $script:ValidationRulesPath"
        return $null
    }
}

# Export module functions
Export-ModuleMember -Function @(
    'Test-ArtifactMetadata',
    'Test-DocumentStructure',
    'Test-ArtifactNaming',
    'Test-PhaseArtifacts',
    'Get-ValidationRules'
)

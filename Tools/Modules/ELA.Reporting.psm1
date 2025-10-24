<#
.SYNOPSIS
    ELA Reporting Module - Project analytics and report generation

.DESCRIPTION
    This module provides reporting and analytics functions for ELA framework projects,
    generating insights about project health, artifact completion, and phase progress.

.NOTES
    Module: ELA.Reporting
    Author: ELA Framework Team
    Version: 1.0.0
#>

# Module variables
$script:ReportOutputPath = "$PSScriptRoot/../../Reports"
$script:CatalogPath = "$PSScriptRoot/../../Catalogue.csv"

<#
.SYNOPSIS
    Generates a project status report

.PARAMETER ProjectPath
    Root path of the ELA project

.PARAMETER OutputFormat
    Report output format (HTML, JSON, CSV)

.EXAMPLE
    Get-ProjectStatus -ProjectPath "." -OutputFormat "HTML"
#>
function Get-ProjectStatus {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProjectPath,
        
        [Parameter(Mandatory = $false)]
        [ValidateSet('HTML', 'JSON', 'CSV', 'Console')]
        [string]$OutputFormat = 'Console'
    )

    if (-not (Test-Path $ProjectPath)) {
        Write-Error "Project path not found: $ProjectPath"
        return
    }

    $projectStatus = @{
        ProjectName = Split-Path $ProjectPath -Leaf
        GeneratedDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Phases = @()
        TotalArtifacts = 0
        CompletedArtifacts = 0
        OverallProgress = 0
    }

    # Analyze each phase
    $phases = Get-ChildItem -Path $ProjectPath -Directory | Where-Object { $_.Name -match '^\d{2}_' }
    
    foreach ($phase in $phases) {
        $phaseInfo = @{
            PhaseName = $phase.Name
            ArtifactCount = 0
            CompletedCount = 0
            InProgressCount = 0
            NotStartedCount = 0
        }

        $artifacts = Get-ChildItem -Path $phase.FullName -Include @('*.md', '*.docx', '*.pdf') -Recurse -File
        $phaseInfo.ArtifactCount = $artifacts.Count

        foreach ($artifact in $artifacts) {
            $content = Get-Content -Path $artifact.FullName -Raw -ErrorAction SilentlyContinue
            if ($content -match 'status:\s*(\w+)') {
                $status = $matches[1]
                switch ($status) {
                    'completed' { $phaseInfo.CompletedCount++ }
                    'in-progress' { $phaseInfo.InProgressCount++ }
                    'not-started' { $phaseInfo.NotStartedCount++ }
                }
            }
        }

        $phaseInfo.Progress = if ($phaseInfo.ArtifactCount -gt 0) {
            [math]::Round(($phaseInfo.CompletedCount / $phaseInfo.ArtifactCount) * 100, 2)
        } else { 0 }

        $projectStatus.Phases += $phaseInfo
        $projectStatus.TotalArtifacts += $phaseInfo.ArtifactCount
        $projectStatus.CompletedArtifacts += $phaseInfo.CompletedCount
    }

    $projectStatus.OverallProgress = if ($projectStatus.TotalArtifacts -gt 0) {
        [math]::Round(($projectStatus.CompletedArtifacts / $projectStatus.TotalArtifacts) * 100, 2)
    } else { 0 }

    # Output based on format
    switch ($OutputFormat) {
        'JSON' {
            $projectStatus | ConvertTo-Json -Depth 4
        }
        'CSV' {
            $projectStatus.Phases | ConvertTo-Csv -NoTypeInformation
        }
        'HTML' {
            ConvertTo-HtmlReport -ProjectStatus $projectStatus
        }
        'Console' {
            Write-Host "\n=== Project Status Report ===" -ForegroundColor Cyan
            Write-Host "Project: $($projectStatus.ProjectName)"
            Write-Host "Generated: $($projectStatus.GeneratedDate)"
            Write-Host "Overall Progress: $($projectStatus.OverallProgress)%" -ForegroundColor $(if ($projectStatus.OverallProgress -ge 75) { 'Green' } elseif ($projectStatus.OverallProgress -ge 50) { 'Yellow' } else { 'Red' })
            Write-Host "Total Artifacts: $($projectStatus.TotalArtifacts)"
            Write-Host "Completed: $($projectStatus.CompletedArtifacts)\n"
            
            foreach ($phase in $projectStatus.Phases) {
                Write-Host "Phase: $($phase.PhaseName)" -ForegroundColor Yellow
                Write-Host "  Progress: $($phase.Progress)%"
                Write-Host "  Total: $($phase.ArtifactCount) | Completed: $($phase.CompletedCount) | In Progress: $($phase.InProgressCount) | Not Started: $($phase.NotStartedCount)\n"
            }
        }
    }

    return $projectStatus
}

<#
.SYNOPSIS
    Generates artifact statistics by type

.PARAMETER ProjectPath
    Root path of the ELA project

.EXAMPLE
    Get-ArtifactStatistics -ProjectPath "."
#>
function Get-ArtifactStatistics {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProjectPath
    )

    if (-not (Test-Path $ProjectPath)) {
        Write-Error "Project path not found: $ProjectPath"
        return
    }

    $statistics = @{}
    $artifacts = Get-ChildItem -Path $ProjectPath -Include @('*.md', '*.docx', '*.pdf') -Recurse -File

    foreach ($artifact in $artifacts) {
        $content = Get-Content -Path $artifact.FullName -Raw -ErrorAction SilentlyContinue
        
        if ($content -match 'artifact-type:\s*(\S+)') {
            $type = $matches[1]
            if (-not $statistics.ContainsKey($type)) {
                $statistics[$type] = @{
                    Count = 0
                    Completed = 0
                    InProgress = 0
                    Files = @()
                }
            }
            $statistics[$type].Count++
            $statistics[$type].Files += $artifact.Name
            
            if ($content -match 'status:\s*(\w+)') {
                $status = $matches[1]
                if ($status -eq 'completed') {
                    $statistics[$type].Completed++
                }
                elseif ($status -eq 'in-progress') {
                    $statistics[$type].InProgress++
                }
            }
        }
    }

    return $statistics
}

<#
.SYNOPSIS
    Exports project metrics to a report file

.PARAMETER ProjectPath
    Root path of the ELA project

.PARAMETER OutputPath
    Path where report will be saved

.PARAMETER Format
    Report format (HTML, JSON, PDF)

.EXAMPLE
    Export-ProjectReport -ProjectPath "." -OutputPath "./Reports/project-report.html" -Format "HTML"
#>
function Export-ProjectReport {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProjectPath,
        
        [Parameter(Mandatory = $true)]
        [string]$OutputPath,
        
        [Parameter(Mandatory = $false)]
        [ValidateSet('HTML', 'JSON')]
        [string]$Format = 'HTML'
    )

    # Ensure output directory exists
    $outputDir = Split-Path $OutputPath -Parent
    if (-not (Test-Path $outputDir)) {
        New-Item -Path $outputDir -ItemType Directory -Force | Out-Null
    }

    # Get project status
    $status = Get-ProjectStatus -ProjectPath $ProjectPath -OutputFormat $Format
    
    # Save report
    if ($Format -eq 'JSON') {
        $status | ConvertTo-Json -Depth 4 | Out-File -FilePath $OutputPath -Encoding UTF8
    }
    else {
        # HTML report would be generated here
        $status | Out-File -FilePath $OutputPath -Encoding UTF8
    }

    Write-Host "Report exported to: $OutputPath" -ForegroundColor Green
    return $OutputPath
}

<#
.SYNOPSIS
    Analyzes catalog file and generates statistics

.PARAMETER CatalogPath
    Path to the catalogue.csv file

.EXAMPLE
    Get-CatalogStatistics -CatalogPath "./catalogue.csv"
#>
function Get-CatalogStatistics {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$CatalogPath = $script:CatalogPath
    )

    if (-not (Test-Path $CatalogPath)) {
        Write-Warning "Catalog file not found: $CatalogPath"
        return $null
    }

    try {
        $catalog = Import-Csv -Path $CatalogPath
        
        $stats = @{
            TotalEntries = $catalog.Count
            ByPhase = $catalog | Group-Object -Property Phase | Select-Object Name, Count
            ByType = $catalog | Group-Object -Property Type | Select-Object Name, Count
            ByStatus = $catalog | Group-Object -Property Status | Select-Object Name, Count
            LatestUpdate = ($catalog | Sort-Object -Property LastModified -Descending | Select-Object -First 1).LastModified
        }

        return $stats
    }
    catch {
        Write-Error "Error reading catalog: $_"
        return $null
    }
}

<#
.SYNOPSIS
    Generates a quick project health dashboard

.PARAMETER ProjectPath
    Root path of the ELA project

.EXAMPLE
    Show-ProjectDashboard -ProjectPath "."
#>
function Show-ProjectDashboard {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProjectPath
    )

    Write-Host "\n" + ("=" * 60) -ForegroundColor Cyan
    Write-Host "ELA PROJECT DASHBOARD" -ForegroundColor Cyan
    Write-Host ("=" * 60) + "\n" -ForegroundColor Cyan

    # Project Status
    $status = Get-ProjectStatus -ProjectPath $ProjectPath -OutputFormat 'Console'
    
    # Artifact Statistics
    Write-Host "\n=== Artifact Type Distribution ===" -ForegroundColor Yellow
    $artStats = Get-ArtifactStatistics -ProjectPath $ProjectPath
    foreach ($type in $artStats.Keys) {
        Write-Host "$type: $($artStats[$type].Count) (Completed: $($artStats[$type].Completed))" -ForegroundColor White
    }

    Write-Host "\n" + ("=" * 60) + "\n" -ForegroundColor Cyan
}

# Helper function to convert to HTML (stub)
function ConvertTo-HtmlReport {
    param($ProjectStatus)
    # This would generate a proper HTML report
    # For now, return a simple representation
    return $ProjectStatus | ConvertTo-Json -Depth 4
}

# Export module functions
Export-ModuleMember -Function @(
    'Get-ProjectStatus',
    'Get-ArtifactStatistics',
    'Export-ProjectReport',
    'Get-CatalogStatistics',
    'Show-ProjectDashboard'
)

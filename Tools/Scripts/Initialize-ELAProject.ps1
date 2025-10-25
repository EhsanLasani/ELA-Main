<#!
.SYNOPSIS
Scaffolds a new ELA project structure, seeds catalogue and README, and copies phase templates.


.DESCRIPTION
Creates standard SDLC folders, Validation subfolders, and optional Systems Integration blueprint stubs.


.PARAMETER ProjectPath
Base path where the project will be scaffolded. Defaults to current directory.


.PARAMETER ProjectName
Logical project name used in generated README and Catalogue.


.EXAMPLE
./Tools/Scripts/Initialize-ELAProject.ps1 -ProjectPath "." -ProjectName "MyELAProject"
#>

[CmdletBinding()]
param(
[string]$ProjectPath = ".",
[Parameter(Mandatory=$true)][string]$ProjectName
)
$ErrorActionPreference = 'Stop'


function New-Dir($p) {
if (-not (Test-Path $p)) { New-Item -Type Directory -Path $p | Out-Null }
}


# Normalize project root
$root = Resolve-Path $ProjectPath
Write-Host "Scaffolding ELA project at: $root"


# Folder map
$folders = @(
"00_Policy",
"00_Policy/Templates",
"00_Policy/Templates/phasewise/01_Definition",
"00_Policy/Templates/phasewise/02_Design",
"00_Policy/Templates/phasewise/03_Development",
"00_Policy/Templates/phasewise/05_Testing",
"00_Policy/Templates/phasewise/06_Deployment",
"00_Policy/Templates/phasewise/07_Operations",
"00_Policy/Templates/phasewise/08_Change_Management",
"01_Definition/Validation",
"02_Design/Validation",
"03_Development/Validation",
"05_Testing/Validation",
"06_Deployment/Validation",
"07_Operations/Validation",
"08_Change_Management/Validation",
"Tools/Scripts",
"Reports",
".codex"
)


foreach ($f in $folders) { New-Dir (Join-Path $root $f) }


# Seed Catalogue.csv if missing
$catalogue = Join-Path $root "Catalogue.csv"
if (-not (Test-Path $catalogue)) {
@(
'Artifact_ID,Artifact_Name,Artifact_Type,Phase,Owner,Status,Path',
"PROJ-$($ProjectName),$ProjectName,PROJECT,ALL,Owner TBD,Active,.",
'DOC-00-ELA_Development_Systems_Integration_Policy,ELA Development & Systems Integration Policy,DOC,Policy,EAO,Draft,00_Policy/ELA_Development_Systems_Integration_Policy.md'
) | Set-Content -Encoding UTF8 $catalogue
}


# Seed README.md if missing
$readme = Join-Path $root "README.md"
if (-not (Test-Path $readme)) {
@(
"# $ProjectName",
"\n> Bootstrapped using ELA-Main Initialize-ELAProject.ps1",
"\n## New Project Quickstart",
"1. Fill phase templates under \`00_Policy/Templates/phasewise\` and commit to phase folders.",
"2. Create \`00_Policy/Systems_Integration_Blueprint.md\` and \`00_Policy/Systems_Integration_Blueprint.png\`.",
"3. Open a PR — CI will run \`blueprint-guard\` and \`validate-policy\`.",
"4. Fix any reported issues, then merge.",
"5. Tag the release; archival is handled per policy.",
"\n## Structure",
"- 01_Definition … 08_Change_Management (each with /Validation)",
"- 00_Policy — master templates & policies",
"- Tools/Scripts — automation",
"- Reports — exports and compliance output"
) | Set-Content -Encoding UTF8 $readme
}


# Seed minimal blueprint stub if missing
$bpMd = Join-Path $root "00_Policy/Systems_Integration_Blueprint.md"
if (-not (Test-Path $bpMd)) {
@(
"# Systems Integration Blueprint",
"\n- **Project:** $ProjectName",
"- **Last Updated:** $(Get-Date -Format 'yyyy-MM-dd')",
"\n## Context",
"(Describe domains, systems, and bounded contexts)",
"\n## Integration Points",
"(List services, protocols, data contracts, auth, SLAs)",
"\n## Non-Functional Requirements",
"(Latency, throughput, availability, security, compliance)",
"\n## Diagrams",
"(Reference Systems_Integration_Blueprint.png)"
) | Set-Content -Encoding UTF8 $bpMd
}


$bpPng = Join-Path $root "00_Policy/Systems_Integration_Blueprint.png"
Write-Host "\n✅ ELA project scaffold completed." -ForegroundColor Green
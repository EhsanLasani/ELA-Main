<#
.SYNOPSIS
  Generic Git sync helper for any repository.
.DESCRIPTION
  - Auto-detects repo root, current branch, and origin remote
  - Stages all changes, prompts for a commit message (configurable), commits
  - Pushes to upstream (or sets it using defaultRemote/defaultBranch)
  - Pulls latest to keep local in sync
  - Supports global defaults (~/.ela-sync.defaults.json) and repo overrides (.ela-sync.json)
#>

# ---------------- Utilities & Config ----------------

function Load-JsonFile($path) {
  if (Test-Path $path) {
    try { return Get-Content $path -Raw | ConvertFrom-Json }
    catch { Write-Host "⚠️  Failed to parse JSON at $path. Ignoring file." -ForegroundColor Yellow }
  }
  return $null
}

function Merge-Configs($globalConfig, $repoConfig) {
  $merged = @{}
  if ($globalConfig) {
    foreach ($p in $globalConfig.PSObject.Properties) { $merged[$p.Name] = $p.Value }
  }
  if ($repoConfig) {
    foreach ($p in $repoConfig.PSObject.Properties) { $merged[$p.Name] = $p.Value }  # repo overrides
  }
  return $merged
}

function Find-RepoRoot {
  param([string]$StartDir = (Get-Location).Path)
  $dir = Get-Item -LiteralPath $StartDir
  while ($null -ne $dir -and -not (Test-Path (Join-Path $dir.FullName ".git"))) { $dir = $dir.Parent }
  if ($null -eq $dir) { throw "Not inside a Git repository (no .git found in current or parent folders)." }
  return $dir.FullName
}

function Get-CurrentBranch {
  $b = (git rev-parse --abbrev-ref HEAD 2>$null).Trim()
  if (-not $b) { throw "Cannot determine current branch." }
  return $b
}

function Get-RemoteUrl { (git config --get remote.origin.url 2>$null).Trim() }

function Get-Upstream {
  $up = (git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>$null).Trim()
  return $up  # e.g., origin/main
}

function Ensure-Upstream($branch, $fallbackRemote, $fallbackBranch) {
  $up = Get-Upstream
  if ($up) { return $up }
  $remote = if ($fallbackRemote) { $fallbackRemote } else { "origin" }
  $target = if ($fallbackBranch) { $fallbackBranch } else { $branch }
  Write-Host "⚠️  No upstream set for '$branch'. Setting upstream to $remote/$target..." -ForegroundColor Yellow
  git push -u $remote $branch
  if ($LASTEXITCODE -ne 0) { throw "Failed to set upstream $remote/$branch." }
  return "$remote/$target"
}

# --------------- Banner & Git Check -----------------

Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "        🚀 Generic Git Sync Utility       " -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host ""

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Host "❌ Git is not installed or not in PATH." -ForegroundColor Red
  exit 1
}

# --------------- Repo & Config Load -----------------

try {
  $repoRoot = Find-RepoRoot
  Set-Location $repoRoot
} catch {
  Write-Host "❌ $($_.Exception.Message)" -ForegroundColor Red
  exit 1
}

# load configs: global then repo, then merge (repo overrides)
$globalConfigPath = Join-Path $env:USERPROFILE ".ela-sync.defaults.json"
$repoConfigPath   = Join-Path $repoRoot ".ela-sync.json"
$globalConfig     = Load-JsonFile $globalConfigPath
$repoConfig       = Load-JsonFile $repoConfigPath
$config           = Merge-Configs $globalConfig $repoConfig

# derive defaults
$defaultRemote  = if ($config.defaultRemote)  { "$($config.defaultRemote)" } else { "origin" }
$defaultBranch  = if ($config.defaultBranch)  { "$($config.defaultBranch)" } else { $null }
$autoPrompt     = if ($null -ne $config.autoCommitPrompt) { [bool]$config.autoCommitPrompt } else { $true }

$currentBranch  = Get-CurrentBranch
$originUrl      = Get-RemoteUrl
Write-Host "📂 Repo: $repoRoot" -ForegroundColor Yellow
Write-Host "🌐 Remote (origin): $originUrl" -ForegroundColor Yellow
Write-Host "🌱 Branch: $currentBranch" -ForegroundColor Yellow

# -------------------- Pre Steps ---------------------

if ($config -and $config.pre) {
  Write-Host "`n⚙️  Running pre-sync steps..." -ForegroundColor Cyan
  foreach ($cmd in $config.pre) {
    if ([string]::IsNullOrWhiteSpace($cmd)) { continue }
    Write-Host "→ $cmd" -ForegroundColor DarkGray
    Invoke-Expression $cmd
    if ($LASTEXITCODE -ne 0) { throw "Pre-step failed: $cmd" }
  }
}

# ----------------- Stage & Commit -------------------

Write-Host "`n📦 Staging all changes..." -ForegroundColor Cyan
git add -A

$status = git status --porcelain
if (-not $status) {
  Write-Host "✅ No changes to commit." -ForegroundColor Green
  # still pull to stay in sync
  $up = Get-Upstream
  if (-not $up) { $up = Ensure-Upstream $currentBranch $defaultRemote ($defaultBranch ?? $currentBranch) }
  $parts = $up.Split('/')
  Write-Host "`n🔄 Pulling latest from $up..." -ForegroundColor Cyan
  git pull $parts[0] $parts[1]
  if ($LASTEXITCODE -eq 0) { Write-Host "`n✅ Up to date." -ForegroundColor Green }
  else { Write-Host "⚠️  Pull reported a warning/conflict. Resolve as needed." -ForegroundColor Yellow }
  exit 0
}

# get commit message
$commitMessage = ""
if ($autoPrompt) {
  $commitMessage = Read-Host "`n✏️  Enter commit message"
  if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    Write-Host "⚠️  Commit message cannot be empty. Aborting." -ForegroundColor Red
    exit 1
  }
} else {
  # fallback non-interactive default
  $commitMessage = "chore: sync via Git-Sync.ps1"
}

Write-Host "`n💾 Committing..." -ForegroundColor Cyan
git commit -m "$commitMessage"
if ($LASTEXITCODE -ne 0) { Write-Host "❌ Commit failed." -ForegroundColor Red; exit 1 }

# ---------------- Push & Pull Sync ------------------

$upstream = Get-Upstream
if (-not $upstream) { $upstream = Ensure-Upstream $currentBranch $defaultRemote ($defaultBranch ?? $currentBranch) }

$u = $upstream.Split('/')
$remoteName = $u[0]; $remoteBranch = $u[1]

Write-Host "`n🌐 Pushing to $remoteName/$currentBranch..." -ForegroundColor Cyan
git push $remoteName $currentBranch
if ($LASTEXITCODE -ne 0) { Write-Host "❌ Push failed. Check your network or permissions." -ForegroundColor Red; exit 1 }

Write-Host "`n🔄 Pulling latest from $remoteName/$remoteBranch..." -ForegroundColor Cyan
git pull $remoteName $remoteBranch
if ($LASTEXITCODE -eq 0) { Write-Host "`n✅ Sync complete." -ForegroundColor Green }
else { Write-Host "⚠️  Pull reported a warning/conflict. Resolve as needed." -ForegroundColor Yellow }

# ------------------- Post Steps ---------------------

if ($config -and $config.post) {
  Write-Host "`n⚙️  Running post-sync steps..." -ForegroundColor Cyan
  foreach ($cmd in $config.post) {
    if ([string]::IsNullOrWhiteSpace($cmd)) { continue }
    Write-Host "→ $cmd" -ForegroundColor DarkGray
    Invoke-Expression $cmd
    if ($LASTEXITCODE -ne 0) { throw "Post-step failed: $cmd" }
  }
}

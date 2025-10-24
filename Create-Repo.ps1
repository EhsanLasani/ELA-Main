# Repository Creator Helper (PowerShell)
# Save as: Create-Repo.ps1

Write-Host "Do you want to create a Main (M) or Child (C) repository?" -ForegroundColor Cyan
$repoType = Read-Host "Type 'M' for Main or 'C' for Child"

if ($repoType -eq "M") {
    $mainRepoName = Read-Host "Enter the Main Repository Name"
    New-Item -ItemType Directory -Path $mainRepoName -Force | Out-Null
    Set-Location $mainRepoName
    git init
    "## $mainRepoName Main Repository" | Out-File -Encoding UTF8 README.md
    git add .
    git commit -m "Initial commit for main repository"
    Write-Host "Main repository '$mainRepoName' initialized and committed locally."

    # Create and push to GitHub (public repo)
    gh repo create $mainRepoName --public --source . --remote origin --push
    Write-Host "GitHub repository '$mainRepoName' created and code pushed."
}
elseif ($repoType -eq "C") {
    $childRepoName = Read-Host "Enter the Child Repository Name"
    New-Item -ItemType Directory -Path $childRepoName -Force | Out-Null
    Set-Location $childRepoName
    git init
    "## $childRepoName Child Repository" | Out-File -Encoding UTF8 README.md
    git add .
    git commit -m "Initial commit for child repository"
    Write-Host "Child repository '$childRepoName' initialized and committed locally."

    # Create and push to GitHub (public repo)
    gh repo create $childRepoName --public --source . --remote origin --push
    Write-Host "GitHub repository '$childRepoName' created and code pushed."
}
else {
    Write-Host "Invalid input. Please run the script again and choose 'M' or 'C'."
}

# End of script

# Repository Creator Helper (PowerShell)
# Save as: Create-Repo.ps1

Write-Host "Do you want to create a Main or Child repository?" -ForegroundColor Cyan
$repoType = Read-Host "Type 'main' or 'child'"

if ($repoType -eq "main") {
    $mainRepoName = Read-Host "Enter the Main Repository Name"
    New-Item -ItemType Directory -Path $mainRepoName -Force | Out-Null
    Set-Location $mainRepoName
    git init
    "## $mainRepoName Main Repository" | Out-File -Encoding UTF8 README.md
    git add .
    git commit -m "Initial commit for main repository"
    Write-Host "Main repository '$mainRepoName' created, initialized, and first commit done."

    if (Get-Command gh -ErrorAction SilentlyContinue) {
        $createRemote = Read-Host "Do you want to create a corresponding GitHub repo? (y/n)"
        if ($createRemote -eq "y") {
            gh repo create $mainRepoName --public --source . --remote origin --push
            Write-Host "GitHub repository created and pushed."
        }
    }

}
elseif ($repoType -eq "child") {
    $childRepoName = Read-Host "Enter the Child Repository Name"
    New-Item -ItemType Directory -Path $childRepoName -Force | Out-Null
    Set-Location $childRepoName
    git init
    "## $childRepoName Child Repository" | Out-File -Encoding UTF8 README.md
    git add .
    git commit -m "Initial commit for child repository"
    Write-Host "Child repository '$childRepoName' created, initialized, and first commit done."

    if (Get-Command gh -ErrorAction SilentlyContinue) {
        $createRemote = Read-Host "Do you want to create a corresponding GitHub repo? (y/n)"
        if ($createRemote -eq "y") {
            gh repo create $childRepoName --public --source . --remote origin --push
            Write-Host "GitHub repository created and pushed."
        }
    }
}
else {
    Write-Host "Invalid input. Please run the script again and choose 'main' or 'child'."
}

# End of script

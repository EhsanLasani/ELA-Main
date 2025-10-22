# Run from repo root; updates catalog + metadata and commits
Write-Host "Syncing ELA catalog & metadata..." -ForegroundColor Cyan
python 03_Development/tools/scan_and_sync_catalog.py
python 03_Development/tools/backfill_metadata.py
python 03_Development/tools/fix_catalog.py

git add -A
if ((git status --porcelain) -ne $null) {
  git commit -m "chore(catalog): resync inventory, backfill metadata, normalize URLs"
  git push origin main
  Write-Host "Done. Changes pushed to main." -ForegroundColor Green
} else {
  Write-Host "No changes needed." -ForegroundColor Yellow
}

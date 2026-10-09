# ============================================================
# Push feature/data-import branch to GitHub
# Run this AFTER installing Git from https://git-scm.com/download/win
# ============================================================

$repoUrl = "https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD.git"
$projectPath = "C:\Users\DELL\.bob\playground"

Set-Location $projectPath

# Switch to main and pull latest
Write-Host "Switching to main branch..." -ForegroundColor Cyan
git checkout main
git pull origin main 2>$null

# Create and switch to data-import branch
Write-Host "Creating branch: feature/data-import..." -ForegroundColor Cyan
git checkout -b feature/data-import

# Stage the updated dashboard file
git add curriculum-dashboard.html

# Commit with descriptive message
git commit -m "feat: add Data Import tab (feature/data-import)

- New nav tab: Import Data (Tab 11)
- Step 1: Data type selector (Kurikulum / Akreditasi / KPI)
- Step 2: Drag & drop + click-to-browse CSV upload zone (max 5MB)
- Step 3: Automatic CSV validation (column count, header names, required fields)
- Step 4: Live data preview table (up to 50 rows shown)
- Apply import: Replace or Append mode - injects data into live dashboard tables
- renderMasterTable() and renderAccTable() updated with imported data
- CSV template download for all 3 data types (with UTF-8 BOM for Excel)
- Export current dashboard data to CSV (programmes, accreditation, kpi)
- Import activity log panel with timestamps
- Full CSV parser supporting quoted fields and CRLF/LF line endings"

# Push branch to GitHub
Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push -u origin feature/data-import 2>&1

Write-Host ""
Write-Host "SUCCESS! Branch pushed to GitHub." -ForegroundColor Green
Write-Host "View branch: https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD/tree/feature/data-import" -ForegroundColor Green
Write-Host ""
Write-Host "To create a Pull Request, visit:" -ForegroundColor Yellow
Write-Host "https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD/compare/feature/data-import" -ForegroundColor Yellow

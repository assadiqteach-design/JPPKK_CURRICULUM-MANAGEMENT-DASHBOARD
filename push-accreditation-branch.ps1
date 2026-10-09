# ============================================================
# Push feature/accreditation-monitor branch to GitHub
# Run this AFTER installing Git from https://git-scm.com/download/win
# ============================================================

$repoUrl = "https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD.git"
$projectPath = "C:\Users\DELL\.bob\playground"

Set-Location $projectPath

Write-Host "Checking git status..." -ForegroundColor Cyan

# If not yet a git repo, init it
if (-not (Test-Path ".git")) {
    Write-Host "Initializing git repo..." -ForegroundColor Yellow
    git init
    git remote add origin $repoUrl
    git add .
    git commit -m "chore: initial commit"
    git branch -M main
    git push -u origin main
}

# Switch to main and pull latest
Write-Host "Switching to main branch..." -ForegroundColor Cyan
git checkout main
git pull origin main 2>$null

# Create and switch to accreditation branch
Write-Host "Creating branch: feature/accreditation-monitor..." -ForegroundColor Cyan
git checkout -b feature/accreditation-monitor

# Stage the updated dashboard file
git add curriculum-dashboard.html

# Commit with descriptive message
git commit -m "feat: add Programme Accreditation Monitor tab

- New nav tab: Akreditasi Program (Tab 10)
- 5 KPI cards: Diakreditasi Penuh, Dalam Proses, Perlu Baharui, Tamat Tempoh, Belum Mohon
- Alert panel: Kritikal (5), Perlu Baharui (11), On Track (28)
- Accreditation status table by body: MQA, EAC, BEM, ETAC, Lain-lain
- 5-stage accreditation pipeline tracker
- MQA Standards score analysis by field (7 standards, scale 1.0-4.0)
- Accreditation expiry Gantt timeline 2026
- Master accreditation table (16 programmes) with clickable modal details
- showAccModal() and renderAccTable() JavaScript functions"

# Push branch to GitHub
Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push -u origin feature/accreditation-monitor 2>&1

Write-Host ""
Write-Host "✅ DONE! Branch pushed to GitHub." -ForegroundColor Green
Write-Host "🔗 View branch: https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD/tree/feature/accreditation-monitor" -ForegroundColor Green
Write-Host ""
Write-Host "💡 To create a Pull Request, visit:" -ForegroundColor Yellow
Write-Host "   https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD/compare/feature/accreditation-monitor" -ForegroundColor Yellow

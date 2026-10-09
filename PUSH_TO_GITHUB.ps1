# =======================================================
# AUTO PUSH ALL BRANCHES TO GITHUB
# Run this script after installing Git
# Repo: https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD.git
# =======================================================

$gitPaths = @(
    "C:\Program Files\Git\cmd\git.exe",
    "C:\Program Files\Git\bin\git.exe",
    "C:\Program Files (x86)\Git\cmd\git.exe",
    "$env:LOCALAPPDATA\Programs\Git\cmd\git.exe"
)

$gitExe = $gitPaths | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $gitExe) {
    Write-Host ""
    Write-Host "==================================================" -ForegroundColor Red
    Write-Host "  Git NOT FOUND. Please install Git first:" -ForegroundColor Red
    Write-Host "  https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "  Then run this script again." -ForegroundColor Yellow
    Write-Host "==================================================" -ForegroundColor Red
    pause
    exit 1
}

Write-Host "Git found: $gitExe" -ForegroundColor Green

$repo = "https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD.git"
$dir  = "C:\Users\DELL\.bob\playground"

Set-Location $dir

function git { & $gitExe @args }

# ---- Configure identity (change if needed) ----
git config user.email "assadiqteach@github.com"
git config user.name  "assadiqteach-design"

# ---- Init if needed ----
if (-not (Test-Path ".git")) {
    Write-Host "Initializing repository..." -ForegroundColor Cyan
    git init
    git remote add origin $repo
}

# ---- Make sure remote is set ----
$remotes = git remote 2>&1
if ($remotes -notcontains "origin") {
    git remote add origin $repo
} else {
    git remote set-url origin $repo
}

# ================================================================
# PUSH main BRANCH
# ================================================================
Write-Host ""
Write-Host "--- Pushing: main ---" -ForegroundColor Cyan
git checkout main 2>$null
if ($LASTEXITCODE -ne 0) {
    git add .
    git commit -m "chore: initial commit - JPPKK Curriculum Management Dashboard"
    git branch -M main
}
git push -u origin main
Write-Host "  main pushed" -ForegroundColor Green

# ================================================================
# PUSH ALL FEATURE BRANCHES
# ================================================================
$branches = @(
    @{ name = "feature/kpi-cards";              msg = "feat: KPI Cards component" },
    @{ name = "feature/navigation-tabs";         msg = "feat: Navigation Tabs component" },
    @{ name = "feature/filter-bar";              msg = "feat: Filter Bar component" },
    @{ name = "feature/curriculum-table";        msg = "feat: Curriculum Table component" },
    @{ name = "feature/charts-analytics";        msg = "feat: Charts and Analytics component" },
    @{ name = "feature/accreditation-monitor";   msg = "feat: Programme Accreditation Monitor tab" },
    @{ name = "feature/data-import";             msg = "feat: Data Import tab - CSV upload, validate, preview, inject" }
)

foreach ($b in $branches) {
    Write-Host ""
    Write-Host "--- Pushing: $($b.name) ---" -ForegroundColor Cyan

    # Create or switch to branch from main
    git checkout main
    $exists = git branch --list $b.name
    if ($exists) {
        git checkout $b.name
    } else {
        git checkout -b $b.name
    }

    # Commit current state if branch has no unique commit yet
    $ahead = git log origin/main..$($b.name) --oneline 2>$null
    if (-not $ahead) {
        git add .
        git commit -m $b.msg --allow-empty
    }

    git push -u origin $b.name
    Write-Host "  $($b.name) pushed" -ForegroundColor Green
}

# Return to main
git checkout main

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host " ALL BRANCHES PUSHED SUCCESSFULLY!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Repo: https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD" -ForegroundColor Cyan
Write-Host ""
Write-Host "Branches on GitHub:" -ForegroundColor Yellow
Write-Host "  main" -ForegroundColor White
foreach ($b in $branches) { Write-Host "  $($b.name)" -ForegroundColor White }
Write-Host ""
Write-Host "GitHub Pages preview URL (enable in Settings > Pages):" -ForegroundColor Yellow
Write-Host "  https://assadiqteach-design.github.io/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD/curriculum-dashboard.html" -ForegroundColor Cyan
Write-Host ""

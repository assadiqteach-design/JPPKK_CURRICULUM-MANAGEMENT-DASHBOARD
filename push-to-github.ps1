# ============================================
# Push Project to GitHub
# Repo: https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD.git
# ============================================

$repoUrl = "https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD.git"
$projectPath = "C:\Users\DELL\.bob\playground"

Set-Location $projectPath

Write-Host "📁 Initializing Git repository..." -ForegroundColor Cyan
git init

Write-Host "🔗 Adding remote origin..." -ForegroundColor Cyan
git remote remove origin 2>$null
git remote add origin $repoUrl

Write-Host "📝 Staging all files..." -ForegroundColor Cyan
git add .

Write-Host "💾 Committing files..." -ForegroundColor Cyan
git commit -m "Initial commit - JPPKK Curriculum Management Dashboard"

Write-Host "🚀 Pushing to GitHub (main branch)..." -ForegroundColor Cyan
git branch -M main
git push -u origin main

Write-Host ""
Write-Host "✅ DONE! Your project is now on GitHub." -ForegroundColor Green
Write-Host "🌐 Repo URL: https://github.com/assadiqteach-design/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD" -ForegroundColor Green
Write-Host ""
Write-Host "💡 To enable GitHub Pages preview:" -ForegroundColor Yellow
Write-Host "   1. Go to your repo on GitHub" -ForegroundColor Yellow
Write-Host "   2. Settings > Pages > Source: Deploy from branch > main > / (root)" -ForegroundColor Yellow
Write-Host "   3. Your preview URL will be:" -ForegroundColor Yellow
Write-Host "   https://assadiqteach-design.github.io/JPPKK_CURRICULUM-MANAGEMENT-DASHBOARD/curriculum-dashboard.html" -ForegroundColor Yellow

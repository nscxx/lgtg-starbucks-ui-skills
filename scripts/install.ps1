# Install Cursor skills (Windows PowerShell)
# Must be saved as UTF-8 with BOM for Chinese output on Windows PowerShell 5.x.
$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$SkillsSrc = Join-Path $RepoRoot "skills"
$CursorSkills = Join-Path $env:USERPROFILE ".cursor\skills"

if (-not (Test-Path $SkillsSrc)) {
  Write-Error "skills folder not found: $SkillsSrc"
}

New-Item -ItemType Directory -Force -Path $CursorSkills | Out-Null

$SkillNames = @("admin-ui-redesign", "deep-green-theme")
foreach ($name in $SkillNames) {
  $dest = Join-Path $CursorSkills $name
  if (Test-Path $dest) {
    Write-Host "Replacing: $dest"
    Remove-Item $dest -Recurse -Force
  }
  Copy-Item (Join-Path $SkillsSrc $name) $dest -Recurse -Force
  Write-Host "Installed: $dest"
}

Write-Host ""
Write-Host "Done. Restart Cursor, then say in chat:"
Write-Host '  请按 admin-ui-redesign + deep-green-theme 改版 src/views/xxx/Page.vue'

git push @args
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$branch = git branch --show-current
$repo = (git config --get remote.origin.url) -replace '^.*github.com[:/]', '' -replace '\.git$', ''

for ($i = 0; $i -lt 30; $i++) {
  $url = gh pr list --repo $repo --head $branch --state open --json url --jq '.[0].url' 2>$null
  if ($url) {
    Write-Host ""
    Write-Host "=============================="
    Write-Host "  PR: $url"
    Write-Host "=============================="
    Write-Host ""
    break
  }
  Start-Sleep -Seconds 2
}

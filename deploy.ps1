Set-Location $PSScriptRoot
./build.ps1 -environment $environment

if (!(Get-Module -ListAvailable -Name azure.databricks.cicd.Tools)) {
    Install-Module azure.databricks.cicd.Tools -Force -Scope CurrentUser
}
Import-Module -Name azure.databricks.cicd.Tools

$BearerToken = Get-Content -Path ./MyBearerToken.txt -Raw # Create this file with your bearer token and add to gitignore
$Region = "westeurope"
$localBinfolder = Join-Path $PSScriptRoot "/bin/"
$TargetDBFSFolderCode = "/MyApplication/Code"

# Clean Target Folder
Remove-DatabricksDBFSItem -BearerToken $BearerToken -Region $Region -Path $TargetDBFSFolderCode

# Upload files to DBFS
Add-DatabricksDBFSFile -BearerToken $BearerToken -Region $Region -LocalRootFolder $localBinfolder -FilePattern "main.py"  -TargetLocation $TargetDBFSFolderCode -Verbose
Add-DatabricksDBFSFile -BearerToken $BearerToken -Region $Region -LocalRootFolder $localBinfolder -FilePattern "*.zip"  -TargetLocation $TargetDBFSFolderCode -Verbose

Set-Location $PSScriptRoot
if (!(Get-Module -ListAvailable -Name azure.databricks.cicd.Tools)) {
   Install-Module azure.databricks.cicd.Tools -Force -Scope CurrentUser
}
Import-Module -Name azure.databricks.cicd.Tools
$BearerToken = Get-Content "MyBearerToken.txt"  # Create this file in this folder with just your bearer token in
$Region = "westeurope"

$JobName = "MyApplication-Test-PythonJob"
$SparkVersion = "4.1.x-scala2.11"
$NodeType = "Standard_D3_v2"
$MinNumberOfWorkers = 1
$MaxNumberOfWorkers = 1
$Timeout = 1000
$MaxRetries = 1
$ScheduleCronExpression = "0 15 22 ? * *"
$Timezone = "UTC"
$PythonPath = "dbfs:/MyApplication/Code/Main.py"
$PythonParameters = "Job1.MyMethod", "2018/11/30"

 Add-DatabricksPythonJob -BearerToken $BearerToken -Region $Region -JobName $JobName `
    -SparkVersion $SparkVersion -NodeType $NodeType `
    -MinNumberOfWorkers $MinNumberOfWorkers -MaxNumberOfWorkers $MaxNumberOfWorkers `
    -Timeout $Timeout -MaxRetries $MaxRetries `
    -ScheduleCronExpression $ScheduleCronExpression `
    -Timezone $Timezone -PythonPath $PythonPath `
    -PythonParameters $PythonParameters `
    -PythonVersion 3 
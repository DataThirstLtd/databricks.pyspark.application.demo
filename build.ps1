Set-Location $PSScriptRoot
Remove-Item ./bin -Recurse -Force -ErrorAction:SilentlyContinue
New-Item ./bin -ItemType Directory -Force | Out-Null
Copy-Item "Jobs/*.py" ./bin
Copy-Item "Utils/*.py" ./bin
$source = Resolve-Path ./bin/*.py
$ZipFilePath = "./bin/scripts"
Compress-Archive -LiteralPath $source -DestinationPath $ZipFilePath 
Remove-Item ./bin/*.py -Force
Copy-Item "./main.py" ./bin

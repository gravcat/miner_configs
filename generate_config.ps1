$outputDir = "datastore"

# check and create $outputDir as necessary
try {
    Test-Path $outputDir
}
catch {
    New-Item -Type Directory -Path $outputDir
}

# Create configuration
$global_config = New-Object -TypeName Object
$computer_configs = New-Object -TypeName Object

# global addresses
$global_addresses = (Invoke-WebRequest https://gist.githubusercontent.com/gravcat/f69e4fa73090af0253fed7ace459310e/raw/91c74c00a2b0de7f0d1cc22478ff2af8285759b7/addresses.json).Content | ConvertFrom-Json

# special snowflake addresses for certain miners
# none at this time

# Configuration items to add to $global_config object
Add-Member -InputObject $global_config -MemberType NoteProperty -Name "DEFAULT_PACKAGE" -Value "claymore"
Add-Member -InputObject $global_config -MemberType NoteProperty -Name "CLAYMORE_VERSION" -Value "9.8"

# Configuration items to add to $computer_configs object
Add-Member -InputObject $computer_configs -MemberType NoteProperty -Name "TELMAR_DCRI" -Value "106"
Add-Member -InputObject $computer_configs -MemberType NoteProperty -Name "EVA00_DCRI" -Value "15,143"
Add-Member -InputObject $computer_configs -MemberType NoteProperty -Name "MARCUS_DCRI" -Value "15,143"
Add-Member -InputObject $computer_configs -MemberType NoteProperty -Name "FUZZ_DCRI" -Value "120"
Add-Member -InputObject $computer_configs -MemberType NoteProperty -Name "NT_DCRI" -Value "108,108"
Add-Member -InputObject $computer_configs -MemberType NoteProperty -Name "BOOKIE_DCRI" -Value "108,143"

$global_addresses | ConvertTo-Json | Out-File "$outputDir\addresses.json"
$global_config    | ConvertTo-Json | Out-File "$outputDir\global_config.json"
$computer_configs | ConvertTo-Json | Out-File "$outputDir\computer_configs.json"
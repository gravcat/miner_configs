param (
    [String]
    $mode = "mine"
)

$baseDir = "C:\miners"
$configDir = "$installDir\local_resources\"
$repo = "https://github.com/gravcat/miner_configs"
$repoArchive = "https://github.com/gravcat/miner_configs/archive/master.zip"

if ($mode = "install") {
    # create installDir if not found
    try {
        Test-Path $baseDir
    }
    catch {
        Write-Output "Creating base directory at $baseDir"
        New-Item -Type Directory $baseDir
    }

    # create installedDir if not found
    try {
        Test-Path $configDir
    }
    catch {
        Write-Output "Creating config directory at $configDir"
        New-Item -Type Directory $configDir
    }

    # download and expand the repository's files
    Invoke-WebRequest $repoArchive -OutFile $baseDir
    Expand-Archive $repoArchive -DestinationPath $configDir
}

if ($mode = "mine") {
    #placeholder todo

    # try { test-item check if config files exist
    # if catch (not exist), fetch them
    # after, checksum config files again latest (even if they were just freshly fetched), download if not matching
    # start $package executable based on global config or computer config (if applicable)
}
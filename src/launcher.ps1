param (
    [string]$batchFilePath
)

Start-Process $batchFilePath -Verb RunAs
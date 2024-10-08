param (
    [string]$batchFilePath
)

# Check if the $batchFilePath parameter is provided and the file exists
if ([string]::IsNullOrWhiteSpace($batchFilePath) -eq $false -and $batchFilePath.Length -gt 0) {
    # Now, safely check if the file exists
    if (Test-Path -Path $batchFilePath) {
        if ($batchFilePath -notmatch "downloadcenter") {
            Start-Process $batchFilePath -Verb RunAs
        } else {
            Start-Process -FilePath "conhost.exe" -ArgumentList "cmd /c `"$batchFilePath`""
        }
    }
} else {
    # This workflow will be triggered to obtain deblobat over the internet with a command

    # Define the temp directory path
    $tempPath = [System.IO.Path]::GetTempPath()

    # Define the URL to download the ZIP file
    $url = "https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip"

    # Define the destination file path for the downloaded ZIP
    $zipFile = Join-Path -Path $tempPath -ChildPath "DebloBat-main.zip"

    # Download the ZIP file
    Invoke-WebRequest -Uri $url -OutFile $zipFile

    # Define the extraction path
    $extractPath = Join-Path -Path $tempPath -ChildPath "DebloBat"

    # Extract the ZIP file
    Expand-Archive -Path $zipFile -DestinationPath $extractPath -Force

    # Define the path to the batch file to be executed
    $batchFilePath = Join-Path -Path $extractPath -ChildPath "DebloBat-main\code\deblo.bat"

    # Execute the batch file with administrative privileges
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c $batchFilePath"
}

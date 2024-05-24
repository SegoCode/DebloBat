param(
    [string]$SoftwareName
)

# Dictionary mapping software names to metadata URLs
$urlDictionary = @{
    "firefox"             = "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/firefox.json"
    "vlc"                 = "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/vlc.json"
    "7zip"                = "https://raw.githubusercontent.com/ScoopInstaller/Main/master/bucket/7zip.json"
    "qbittorrent-enhanced"= "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/qbittorrent-enhanced.json"
    "steam"               = "https://raw.githubusercontent.com/ScoopInstaller/Versions/master/bucket/steam.json"
    "discord"             = "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/discord.json"
    "file-converter"      = "https://raw.githubusercontent.com/ScoopInstaller/Nonportable/master/bucket/file-converter-np.json"
    "telegram"            = "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/telegram.json"
    "spotify"             = "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/spotify.json"
    "simplewall"          = "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/simplewall.json"
    "ungoogled-chromium"  = "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/ungoogled-chromium.json"
    "brave"               = "https://github.com/ScoopInstaller/Extras/blob/master/bucket/brave.json"
    "qview"               = "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/qview.json"
    "sublime"             = "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/sublime-text.json"
    "flameshot"           = "https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/flameshot.json"
}

# Check if the software name provided is valid in the dictionary
if (-not $urlDictionary.ContainsKey($SoftwareName)) {
    Write-Error "The provided software name is not valid. Please choose from: firefox, vlc, 7zip, qbittorrent-enhanced."
    exit
}

# Fetch the JSON from the corresponding URL
$json = Invoke-RestMethod -Uri $urlDictionary[$SoftwareName]

# Extract the 64-bit download URL or fall back to the root URL
$downloadUrl = $json.architecture.'64bit'.url
if ($null -eq $downloadUrl) {
    $downloadUrl = $json.url
}

# Validate the URL
if ([string]::IsNullOrWhiteSpace($downloadUrl)) {
    Write-Error "No valid URL was found in the provided JSON."
    exit
}

# Define the destination folder on the desktop
$destinationFolder = Join-Path ([Environment]::GetFolderPath("Desktop")) "install"

# Create the folder if it does not exist
if (-Not (Test-Path $destinationFolder)) {
    New-Item -Path $destinationFolder -ItemType Directory
}

# Correctly extract the file name from the URL before any fragment identifier
$fileName = [System.Uri]::UnescapeDataString((Split-Path -Path ($downloadUrl -split '#')[0] -Leaf))

# Define the full destination path for the download
$destinationPath = Join-Path $destinationFolder $fileName

# Download the file using curl.exe
curl.exe -L $downloadUrl -o $destinationPath

Write-Host "Download completed: $destinationPath"
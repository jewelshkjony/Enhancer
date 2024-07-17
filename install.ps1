# Scripts to install Enhancer 2.0.0
$zipBase = "aHR0cHM6Ly9naXRodWIuY29tL2pld2Vsc2hram9ueS9FbmhhbmNlci9yZWxlYXNlcy9kb3dubG9hZC8yLjAuMC9FbmhhbmNlci56aXA="
$zipBytes = [System.Convert]::FromBase64String($zipBase)
$zipUrl = [System.Text.Encoding]::UTF8.GetString($zipBytes)

# Define the destination path dynamically using the current user's profile path
$zipLocation = "$env:LOCALAPPDATA\Enhancer\Enhancer.zip"
$destinationDir = "$env:LOCALAPPDATA\Enhancer"

# Delete the destination directory if it already exists
if (Test-Path -Path $destinationDir) {
    Remove-Item -Path $destinationDir -Recurse -Force
}

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir -Force
}

# GitHub requires TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Download zip to path location
Invoke-WebRequest -Uri $zipUrl -OutFile $zipLocation -UseBasicParsing

# Extract it
if (Get-Command Expand-Archive -ErrorAction SilentlyContinue) {
  Expand-Archive $zipLocation -DestinationPath "$destinationDir" -Force
}
else {
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  [IO.Compression.ZipFile]::ExtractToDirectory($ZipLocation, $destinationDir)
}
Remove-Item $zipLocation

# Update PATH for the user
$User = [EnvironmentVariableTarget]::User
$Path = [Environment]::GetEnvironmentVariable('Path', $User)
if (!(";$Path;".ToLower() -like "*;$destinationDir;*".ToLower())) {
    [Environment]::SetEnvironmentVariable('Path', "$Path;$destinationDir", $User)
    $Env:Path += ";$destinationDir"
}

Write-Output "Enhancer-2.0.0 has been successfully installed."

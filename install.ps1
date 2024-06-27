# Try 3
# Base64 encoded URL
$baseUrl = "aHR0cHM6Ly9naXRodWIuY29tL2pld2Vsc2hram9ueS9FbmhhbmNlci9yZWxlYXNlcy9kb3dubG9hZC8xLjAuMC9FbmhhbmNlci5leGU="

# Decode the base64 string
$decodedBytes = [System.Convert]::FromBase64String($baseUrl)
$url = [System.Text.Encoding]::UTF8.GetString($decodedBytes)

# Output the decoded URL
Write-Output $url

# Define the destination path dynamically using the current user's profile path
$destination = "$env:LOCALAPPDATA\Enhancer\Enhancer.exe"
$destinationDir = "$env:LOCALAPPDATA\Enhancer"

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir -Force
    Write-Output "Created directory: $destinationDir"
} else {
    Write-Output "Directory already exists: $destinationDir"
}

# Download the file
Invoke-WebRequest -Uri $url -OutFile $destination
Write-Output "Downloaded Enhancer.exe to: $destination"

# Update PATH for the user
$User = [EnvironmentVariableTarget]::User
$Path = [Environment]::GetEnvironmentVariable('Path', $User)
if (!(";$Path;".ToLower() -like "*;$destinationDir;*".ToLower())) {
    [Environment]::SetEnvironmentVariable('Path', "$Path;$destinationDir", $User)
    $Env:Path += ";$destinationDir"
    Write-Output "Added $destinationDir to user PATH."
} else {
    Write-Output "$destinationDir is already in the user PATH."
}

Write-Output "Enhancer has been successfully installed and the path has been set."

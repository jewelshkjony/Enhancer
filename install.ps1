# Scripts to install Enhancer 1.0.0
$base = "aHR0cHM6Ly9naXRodWIuY29tL2pld2Vsc2hram9ueS9FbmhhbmNlci9yZWxlYXNlcy9kb3dubG9hZC8xLjAuMC9FbmhhbmNlci5leGU="
$baseBytes = [System.Convert]::FromBase64String($base)
$url = [System.Text.Encoding]::UTF8.GetString($baseBytes)

# Define the destination path dynamically using the current user's profile path
$destination = "$env:LOCALAPPDATA\Enhancer\Enhancer.exe"
$destinationDir = "$env:LOCALAPPDATA\Enhancer"

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir -Force
}

Invoke-WebRequest -Uri $url -OutFile $destination

# Update PATH for the user
$User = [EnvironmentVariableTarget]::User
$Path = [Environment]::GetEnvironmentVariable('Path', $User)
if (!(";$Path;".ToLower() -like "*;$destinationDir;*".ToLower())) {
    [Environment]::SetEnvironmentVariable('Path', "$Path;$destinationDir", $User)
    $Env:Path += ";$destinationDir"
}

Write-Output "Enhancer-1.0.0 has been successfully installed."

# Try 2
# Define the URL of the executable to download
$url = "https://github.com/jewelshkjony/Enhancer/releases/download/1.0.0/Enhancer.exe"

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

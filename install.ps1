# Define the URL of the executable to download
$url = "https://github.com/jewelshkjony/Enhancer/releases/download/1.0.0/Enhancer.exe"

# Define the destination path dynamically using the current user's profile path
$destination = "$env:LOCALAPPDATA\Enhancer\Enhancer.exe"

# Create the directory if it doesn't exist
$destinationDir = Split-Path -Path $destination
if (-not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir -Force
}

# Download the file
Invoke-WebRequest -Uri $url -OutFile $destination

# Add the destination directory to the system PATH variable if not already present
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
if (-not $currentPath.Split(';') -contains $destinationDir) {
    $newPath = $currentPath + ";" + $destinationDir
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::Machine)
}

Write-Output "Enhancer has been successfully installed and the path has been set."

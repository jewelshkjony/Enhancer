# Define the URL of the executable to download
$url = "https://github.com/jewelshkjony/Enhancer/releases/download/1.0.0/Enhancer.exe"

# Try: 1
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

# Get the current system PATH variable
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
Write-Output "Current system PATH: $currentPath"

# Add the destination directory to the system PATH variable if not already present
if (-not $currentPath.Split(';') -contains $destinationDir) {
    $newPath = $currentPath + ";" + $destinationDir
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::Machine)
    Write-Output "Added $destinationDir to system PATH."
} else {
    Write-Output "$destinationDir is already in the system PATH."
}

# Print the updated PATH
$updatedPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
Write-Output "Updated system PATH: $updatedPath"

# Refresh the PATH variable in the current session
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)

Write-Output "Enhancer has been successfully installed and the path has been set."

# Define the destination path dynamically using the current user's profile path
$destinationDir = "$env:LOCALAPPDATA\Enhancer"

# Delete the destination directory if it already exists
if (Test-Path -Path $destinationDir) {
    Remove-Item -Path $destinationDir -Recurse -Force
}

# Remove the directory from the user's PATH
$User = [EnvironmentVariableTarget]::User
$Path = [Environment]::GetEnvironmentVariable('Path', $User)

# Remove the directory from the PATH only if it exists
if ($Path -like "*$destinationDir*") {
    $NewPath = ($Path -split ";") -ne $destinationDir -join ";"
    [Environment]::SetEnvironmentVariable('Path', $NewPath, $User)
    $Env:Path = $NewPath
}

Write-Output "Enhancer has been successfully uninstalled."

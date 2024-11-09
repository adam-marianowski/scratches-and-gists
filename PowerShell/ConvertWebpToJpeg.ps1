# This script is looping over all files in the folder and will replace 
# all .webp suffixes with .jpeg.

param (
    [string]$sourceDir
)

# User must provide the source directory with -sourceDir parameter
# otherwise it will throw an error
Write-Host "Checking sourceDir parameter..."
if (-not $sourceDir) {
    throw "sourceDir is not set."
}

# this line will get all .webp files from the source directory
Write-Host "Looking for .webp files in specified directory..."
$webpFiles = Get-ChildItem -Path $sourceDir -Filter *.webp
Write-Host "Found $($webpFiles.Count) .webp files."

# this code will loop through .webp files and rename to .jpeg
foreach ($file in $webpFiles) {
    $newFileName = [System.IO.Path]::ChangeExtension($file.FullName, ".jpeg")
    Rename-Item -Path $file.FullName -NewName $newFileName
    Write-Host "Renamed $file to $newFileName"
}

Write-Host "Execution completed."


# Define the base name
$baseName = ""

# Prompt the user for a number
$number = Read-Host "Enter the number to be appended to the computer name"

# Construct the new computer name
$newComputerName = "$baseName$number"

# Change the computer name
Rename-Computer -NewName $newComputerName -Force

Write-Host "Computer name changed to $newComputerName "
Write-Host "Please restart the computer for the changes to take effect."
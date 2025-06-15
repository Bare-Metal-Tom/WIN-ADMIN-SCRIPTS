# PowerShell Script to Install Windows 11 on Unsupported Devices

# Step 1: Registry bypass for TPM and CPU checks
Write-Output "Applying registry patch to bypass TPM and CPU checks..."
$regPath = "HKLM:\SYSTEM\Setup\MoSetup"
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}
New-ItemProperty -Path $regPath -Name "AllowUpgradesWithUnsupportedTPMOrCPU" -Value 1 -PropertyType DWORD -Force | Out-Null
Write-Output "Registry patch applied."

# Step 2: Detect the mounted ISO drive (assumes only one drive labeled "CCCOMA_X64FRE_EN-US_DV9" or similar)
Write-Output "Detecting Windows 11 ISO volume..."
$isoDrive = Get-Volume | Where-Object { $_.FileSystemLabel -like "*CCCOMA*" -or $_.FileSystemLabel -like "*Win11*" }

if (-not $isoDrive) {
    Write-Error "Could not find the mounted ISO volume. Please make sure the ISO is mounted from the flash drive."
    exit 1
}

$isoPath = "$($isoDrive.DriveLetter):\setup.exe"

# Step 3: Run Windows 11 setup with custom arguments
Write-Output "Running setup from $isoPath ..."
Start-Process -FilePath $isoPath -ArgumentList "/Product Server /Compat IgnoreWarning /MigrateDrivers All" -Wait

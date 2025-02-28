# Install NodeJS
nvm install lts
nvm use lts

# Install .NET Tools
dotnet tool update --global dotnet-ef
dotnet tool update --global microsoft.dataapibuilder
dotnet tool install -g microsoft.sqlpackage # Required to generate DACPAC files

################################################################################################################################################

# PSReadLine
################################################################################################################################################
Install-Module PSReadLine -Force; 
New-Item -Path $PROFILE -ItemType File -Force
Add-Content -Path $PROFILE -Value "Set-PSReadLineOption -PredictionViewStyle ListView -PredictionSource History -HistoryNoDuplicates -MaximumHistoryCount 10000"
################################################################################################################################################

# Import Visual Studio Workloads
################################################################################################################################################
Write-Host "Download vs_professional.exe to $outFilePath."
$downloadUrl = "https://aka.ms/vs/17/release/vs_professional.exe"
$outFilePath = ".\vs_professional.exe"
Invoke-WebRequest -Uri $downloadUrl -OutFile $outFilePath -UseBasicParsing

Write-Host "Import Visual Studio 2022 Configuration"
.\vs_professional.exe --config ".\workloads.vsconfig" --passive --norestart

################################################################################################################################################

# WSL 2
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --install
wsl --set-default-version 2
wsl --install -d Ubuntu

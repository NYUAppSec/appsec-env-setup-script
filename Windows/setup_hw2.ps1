# Generated by ChatGPT, tested/tweaked by @robert-todora

# Define the Python installer URL
$pythonInstallerUrl = "https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe"
$pythonInstallerPath = "$env:TEMP\python-installer.exe"

# Download the Python installer
Write-Output "Downloading Python installer..."
Invoke-WebRequest -Uri $pythonInstallerUrl -OutFile $pythonInstallerPath

# Install Python silently
Write-Output "Installing Python..."
Start-Process -FilePath $pythonInstallerPath -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait

# Refresh environment variables to include Python
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine")

# Install pip (if not already included) and venv
Write-Output "Installing pip and venv..."
python -m ensurepip --upgrade
python -m pip install --upgrade pip setuptools
python -m pip install virtualenv

# Create a virtual environment
$venvPath = "$env:USERPROFILE\myenv"
Write-Output "Creating virtual environment at $venvPath..."
python -m venv $venvPath

# Activate the virtual environment
Write-Output "Activating virtual environment..."
& "$venvPath\Scripts\Activate.ps1"

# Install Django in the virtual environment
Write-Output "Installing Django..."
pip install django

Write-Output "You can now run 
python manage.py makemigrations LegacySite
python manage.py migrate
python manage.py shell -c 'import import_dbs'
and activate the virtual environment and test server by running 
$venvPath\Scripts\Activate.ps1
python manage.py runserver

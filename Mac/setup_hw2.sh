#!/usr/bin/env bash
set -ex 

PATH_TO_REPO="$1"

if [ -z "$PATH_TO_REPO" ]; then
    echo "Usage: $0 <PATH_TO_REPO>"
    exit 1
fi

echo "Installing necessary packages..."
echo "Updating Homebrew..."
brew update
brew install python

echo "Creating virtual environment and installing requirements..."
cd "$PATH_TO_REPO" || exit
python3 -m venv appsec_hw2
source ./appsec_hw2/bin/activate
pip3 install -r requirements.txt

python3 manage.py makemigrations LegacySite
python3 manage.py migrate
python3 manage.py shell -c 'import import_dbs'

echo "Setup for HW2 complete, you can now activate the virtual environment and test server by running"
echo "source PATH-TO-VENV/bin/activate"
echo "python3 manage.py runserver"


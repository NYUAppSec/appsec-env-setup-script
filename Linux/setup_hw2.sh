#!/usr/bin/env bash
set -ex 

PATH_TO_REPO="$1"

if [ -z "$PATH_TO_REPO" ]; then
    echo "Usage: $0 <PATH_TO_REPO>"
    exit 1
fi

echo "Installing necessary packages..."
sudo apt -y install python3-pip
sudo apt -y install python3-venv

echo "Creating virtual enviroment and installing requirements..."
python3 -m venv appsec_hw2
source ./appsec_hw2/bin/activate
pip3 install -r $PATH_TO_REPO/requirements.txt

python3 $PATH_TO_REPO/manage.py makemigrations LegacySite
python3 $PATH_TO_REPO/manage.py migrate
python3 $PATH_TO_REPO/manage.py shell -c 'import import_dbs'

echo "Setup for HW2 complete..."
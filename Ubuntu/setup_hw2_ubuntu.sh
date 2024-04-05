#!/usr/bin/env bash

confirm() {
    local response
    while true; do
        read -p "$1 (y/n): " response
        case "$response" in
            [yY][eE][sS]|[yY]) 
                return 0
                ;;
            [nN][oO]|[nN])
                return 1
                ;;
            *)
                echo "Invalid input. Please enter 'y' for yes or 'n' for no."
                ;;
        esac
    done
}

while true; do
    read -p "Enter the name of your repository to clone (make sure your SSH public key has been added to your Github account settings first or this will fail): " REPO_SSH_URL
    confirm "Your repository name is $REPO_SSH_URL, is this correct?" && break
done

echo "Cloning repository..."
git clone git@github.com:NYUAppSec/$REPO_SSH_URL.git

echo "Installing necessary packages..."
sudo apt install python3-pip
sudo apt install python3-venv

echo "Creating virtual enviroment..."
python3 -m venv appsec_hw2
pip3 install -r $REPO_SSH_URL/requirements.txt

python3 manage.py makemigrations LegacySite
python3 manage.py migrate
python3 manage.py shell -c 'import import_dbs'
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
    read -p "Enter the name of your repository to clone (make sure your SSH public key has been added to your Github account settings first or this will fail): " REPO_NAME
    confirm "Your repository name is $REPO_NAME, is this correct?" && break
done

echo "Cloning repository..."
git clone git@github.com:NYUAppSec/$REPO_NAME

echo "GPG key setup (make sure you add the key to your github account too!)"
while true; do
    read -p "Enter the email address associated with the GitHub account used for this class: " email
    confirm "Your email is: $email , is this correct?" && break
done

while true; do
    read -p "Enter your full name: " name
    confirm "Your name is: $name , is this correct?" && break
done

while true; do
    read -p "Enter your GPG key id (you can find this by running \"gpg --list-secret-keys --keyid-format=long\" in a separate terminal window)" gpg_id
    confirm "Your GPG key id is: $gpg_id, is this correct?" && break
done

echo "Updating package lists..."
sudo apt-get update
echo "Installing git..."
sudo apt install git

echo "Adding GPG keys to git config..."
git config --global user.email "$email"
git config --global user.name "$name"
git config --global user.signingkey $gpg_id
git config --global commit.gpgsign true

echo "Installing lcov..."
sudo apt-get install lcov

echo "Installing AFL++..."
sudo apt-get install afl++

echo "Installing GDB..."
sudo apt-get install gdb

echo "Setup for HW1 complete..."

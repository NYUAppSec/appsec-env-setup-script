#!/usr/bin/env bash

# Function to prompt for confirmation
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

# Prompt user for email address
while true; do
    read -p "Enter the email address associated with the GitHub account used for this class: " email
    confirm "Your email is: $email , is this correct?" && break
done

# Prompt user for full name
while true; do
    read -p "Enter your full name: " name
    confirm "Your name is: $name , is this correct?" && break
done


# read -p "Enter the email address associated with your github account used for HW1: " email
# read -p "Your email is: $email , is this correct? (y/n):"

# read -p "Enter your full name: " name
# read -p "Your name is: $name , is this correct? (y/n):" 
# read -p "Enter a name for your key to store in the ~/.ssh directory (Leave empty for \"id_rsa\"): " key_name

## Set default key name if empty
# if [ -z "$key_name" ]; then
#     key_name="id_rsa"
# fi
# KEY_PATH="$HOME/.ssh/$key_name"
# echo "Key path is: $KEY_PATH"

# echo "Generating SSH key..."
# ssh-keygen -t rsa -b 4096 -f $KEY_PATH

## Generate GPG key
# echo "Generating GPG key..."
# gpg --full-generate-key
while true; do
    read -p "Enter your GPG key id (you can find this by running \"gpg --list-secret-keys --keyid-format=long\" in a separate terminal window)" gpg_id
    confirm "Your GPG key id is: $gpg_id, is this correct?" && break
done
## Add SSH and GPG keys to git config
echo "Updating package lists..."
sudo apt-get update
echo "Installing git..."
sudo apt install git

echo "Adding GPG keys to git config..."
git config --global user.email "$email"
git config --global user.name "$name"
git config --global user.signingkey $gpg_id
git config --global commit.gpgsign true

while true; do
    read -p "Enter the name of your repository to clone (make sure your SSH public key has been added to your Github account settings first or this will fail): " REPO_URL
    confirm "Your repository name is $REPO_URL, is this correct?" && break
done

echo "Cloning repository..."
git clone git@github.com:NYUAppSec/$REPO_URL

echo "Installing lcov..."
sudo apt-get install lcov

echo "Installing AFL++..."
sudo apt-get install afl++

echo "Installing GDB..."
sudo apt-get install gdb

echo "Setup for HW1 complete..."

# read -p "Start HW2 setup?" hw2_response
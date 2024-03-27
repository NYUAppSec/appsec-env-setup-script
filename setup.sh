#!/bin/bash

# Generate SSH key
read -p "Enter the email address associated with your github account used for HW1: " email
echo "Your email is: " $email

read -p "Enter a name for your key to store in the ~/.ssh directory (Leave empty for \"id_rsa\"): " key_name

# Set default key name if empty
if [ -z "$key_name" ]; then
    key_name="id_rsa"
fi
KEY_PATH="$HOME/.ssh/$key_name"
echo "Key path is: $KEY_PATH"

# echo "Generating SSH key..."
# ssh-keygen -t rsa -b 4096 -f $KEY_PATH

# # Generate GPG key
# echo "Generating GPG key..."
# gpg --full-generate-key

# Add SSH and GPG keys to git config
# echo "Adding keys to git config..."
# git config --global user.email "your_email@example.com"
# git config --global user.name "Your Name"
# git config --global user.signingkey YOUR_GPG_KEY_ID
# git config --global commit.gpgsign true

read -p "Enter the name of your repository to clone (make sure your SSH key has been added to your Github account first or this will fail): " REPO_URL

echo "Cloning repository..."
git clone git@github.com:NYUAppSec/$REPO_URL

# echo "Installing lcov..."
# sudo apt-get install lcov

# echo "Installing AFL++..."
# sudo apt-get update
# sudo apt-get install afl++

# echo "Installing GDB..."
# sudo apt-get install gdb



echo "Setup complete."

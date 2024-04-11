#!/usr/bin/env bash
set -e

# REPO_NAME="$1"
# EMAIL="$2"
# NAME="$3"
# GPG_ID="$4"

EMAIL="$1"
NAME="$2"
GPG_ID="$3"

# if [ -z "$REPO_NAME" ] || [ -z "$EMAIL" ] || [ -z "$NAME" ] || [ -z "$GPG_ID" ]; then
#     echo -e "This script will set the necessary settings in git to use your GPG key to sign your commits\n\nMake sure you have generated a key before this and added it to your github account in settings\n"
#     echo "Usage: $0 <REPO_NAME> <email> <name> <gpg_id>"
#     exit 1
# fi


if [ -z "$EMAIL" ] || [ -z "$NAME" ] || [ -z "$GPG_ID" ]; then
    echo -e "This script will set the necessary settings in git to use your GPG key to sign your commits\n\nMake sure you have generated a key before this and added it to your github account in settings\n"
    echo "Usage: $0 <email> <name> <gpg_id>"
    exit 1
fi



# echo "Updating package lists..."
# sudo apt-get update
# echo "Installing git..."
# sudo apt install git

# echo "Cloning repository..."
# git clone "git@github.com:NYUAppSec/$REPO_NAME.git" || git clone "$REPO_NAME"

# if [ $? -ne 0 ]; then
#     echo "Error: Failed to clone repository, make sure you have set up SSH keys on your machine and added the public key to your GitHub account"
#     exit 1
# fi

echo "Adding GPG keys to git config..."
git config --global user.email "$EMAIL"
git config --global user.name "$NAME"
git config --global user.signingkey "$GPG_ID"
git config --global commit.gpgsign true

echo "Listing git config, double check everything is correct!"
cat ~./gitconfig
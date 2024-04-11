#!/usr/bin/env bash

# This script was converted from the Ubuntu script using ChatGPT, so I cannot verify its accuracy without testing it on mac hardware

set -e

EMAIL="$1"
NAME="$2"
GPG_ID="$3"

if [ -z "$EMAIL" ] || [ -z "$NAME" ] || [ -z "$GPG_ID" ]; then
    echo -e "This script will set the necessary settings in git to use your GPG key to sign your commits\n\nMake sure you have generated a key before this and added it to your GitHub account in settings\n"
    echo "Usage: $0 <email> <name> <gpg_id>"
    exit 1
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing..."
    brew install git
fi

echo "Adding GPG keys to git config..."
git config --global user.email "$EMAIL"
git config --global user.name "$NAME"
git config --global user.signingkey "$GPG_ID"
git config --global commit.gpgsign true

echo "Listing git config, double check everything is correct!"
cat ~/.gitconfig

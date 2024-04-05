#!/usr/bin/env bash

REPO_NAME="$1"
EMAIL="$2"
NAME="$3"
GPG_ID="$4"

if [ -z "$REPO_NAME" ] || [ -z "$EMAIL" ] || [ -z "$NAME" ] || [ -z "$GPG_ID" ]; then
    echo "Usage: $0 <REPO_NAME> <email> <name> <gpg_id>"
    exit 1
fi

echo "Updating package lists..."
sudo apt-get update
echo "Installing git..."
sudo apt install git

echo "Cloning repository..."
if ! git clone "git@github.com:NYUAppSec/$REPO_NAME.git"; then
    if ! git clone "$REPO_NAME"; then 
        echo "Error: Failed to clone repository, make sure you have setup SSH keys on your machine and added the public key to your github account"
        exit 1
fi

echo "Adding GPG keys to git config..."
git config --global user.email "$EMAIL"
git config --global user.name "$NAME"
git config --global user.signingkey "$GPG_ID"
git config --global commit.gpgsign true

echo "Installing lcov..."
sudo apt-get install lcov

echo "Installing AFL++..."
sudo apt-get install afl++

echo "Installing GDB..."
sudo apt-get install gdb

echo "Setup for HW1 complete..."
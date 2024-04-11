#!/usr/bin/env bash
set -ex 

# This script was converted using ChatGPT, so I cannot verify its accuracy without testing it on mac hardware

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update

echo "Installing git..."
brew install git

echo "Installing lcov..."
brew install lcov

git clone https://github.com/AFLplusplus/AFLplusplus
cd AFLplusplus
make
sudo make install

brew install lcov

echo "Installing GDB..."
brew install gdb

echo "Setup for HW1 complete..."

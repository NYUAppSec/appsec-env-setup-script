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

# docker pull aflplusplus/aflplusplus
# docker run -ti -v /location/of/your/target:/src aflplusplus/aflplusplus

echo "Setup for HW1 complete..."

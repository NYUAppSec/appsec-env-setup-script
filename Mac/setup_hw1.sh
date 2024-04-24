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

# install llvm and export path so build of AFL++ can find llvm-config
brew install llvm
echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc 
# clone and build AFLplusplus
git clone https://github.com/AFLplusplus/AFLplusplus
cd AFLplusplus

sudo afl-system-config

# Your Homebrew base may be different, you may need to uncomment the line below and comment out the other one if the script fails. Check your Homebrew base first

export HOMEBREW_BASE="/opt/homebrew/opt"
# export HOMEBREW_BASE="/usr/local/opt"

export PATH="$HOMEBREW_BASE/coreutils/libexec/gnubin:/usr/local/bin:$HOMEBREW_BASE/llvm/bin:$PATH"
export CC=clang
export CXX=clang++

brew install wget git make cmake llvm gdb coreutils

make distrib
sudo make install
which afl-clang-fast


echo "Setup for HW1 complete..."

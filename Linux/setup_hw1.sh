#!/usr/bin/env bash
set -ex 

sudo apt-get update
echo "Installing git..."
sudo apt install git

echo "Installing lcov..."
sudo apt-get -y install lcov

echo "Installing AFL++..."
sudo apt-get -y install afl++

echo "Installing GDB..."
sudo apt-get -y install gdb

echo "Setup for HW1 complete..."
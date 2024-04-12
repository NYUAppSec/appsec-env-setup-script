#!/usr/bin/env bash
set -ex 

sudo apt update
# https://ubuntu.com/tutorials/install-jre#2-installing-openjdk-jre
sudo apt -y install default-jre
java -version 

sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt update
sudo apt -y install android-studio

cd /opt/android-studio/bin
./studio.sh

echo "Setup for HW4 complete..."
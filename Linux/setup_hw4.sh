#!/usr/bin/env bash
set -ex 

sudo apt update
# https://ubuntu.com/tutorials/install-jre#2-installing-openjdk-jre
sudo apt -y install default-jre
java -version 

sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt update
sudo apt -y install android-studio

echo "Setup for HW4 complete..."
echo "run to launch android studio: cd /opt/android-studio/bin"
echo "./studio.sh"
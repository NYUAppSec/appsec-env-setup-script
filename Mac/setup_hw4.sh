# WIP

#!/usr/bin/env bash
set -ex 

# https://ubuntu.com/tutorials/install-jre#2-installing-openjdk-jre
sudo apt install default-jre
java -version 

sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt update
sudo apt install android-studio

cd /usr/local/android-studio/bin
./studio.sh

echo "Setup for HW4 complete, you can now launch the android studio application and continue with the homework steps ..."
#!/usr/bin/env bash
set -ex 
echo "Updating Homebrew..."
brew update

# https://apple.stackexchange.com/questions/276772/how-to-install-java-using-terminal
brew install oracle-jdk --cask
java -version 

echo "Installing Android Studio..."
brew install --cask android-studio

# Check Android Studio version
/Applications/Android\ Studio.app/Contents/MacOS/studio --version

echo "Setup for HW4 complete, you can now launch the android studio application and continue with the homework steps ..."
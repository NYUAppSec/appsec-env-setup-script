# Homework Setup Scripts for NYU's Application Security Course
These sets of scripts will install all necessary software to run the applications provided in this course. Setup for homeworks 1,2,3,4 are currently implemented for Linux and MacOS machines (Windows WIP). Simply pull this repo and then navigate to the directory that your OS corresponds to and run the scripts as needed before working on your homework assignment. Please read all of the instructions and pay attention to the outputs of the scripts for more information.

## TODO
1. Add windows script for HW2, HW3, HW4 (skipping HW1 as that is not a recommended platform for that assignment)


## Setup GPG

This script will add your name, email, and GPG key ID to your gitconfig so that when you commit and push to github your commits will be signed with the GPG key you created. 

Make sure you create the GPG and SSH keys beforehand if you do not have them already 

[Generating a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

[Generating a new GPG Key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

The setup needs the GPG key ID to set up your git config settings, this can be found by running 

`gpg --list-secret-keys --keyid-format=long`
 
 See the link above for more information about the GPG key ID

```
chmod +x setup_gpg.sh
./setup_gpg.sh <email> <name> <gpg_id>
```
- email: email associated with github account used for this class
- name: "your name" (dont forget quotes)
- gpg_id: as mentioned above

## Setup HW1

- installs AFL++ 
- installs GDB 
- installs lcov

Usage: 
```
chmod +x setup_hw1.sh
./setup_hw1.sh
```

## Setup HW2

- installs python
- installs pip and venv
- creates virtual enviroment
- installs django via pip in venv
- runs makemigrations and import dbs 

Usage: 
```
chmod +x setup_hw2.sh
./setup_hw2.sh <PATH-TO-REPO>
```
The path to repo here means the location on your filesystem where the root of the repository resides. So if you git cloned your repo to /home/example-user/appsec-homework-1-example, supply this as the argument to this script

## Setup HW3

- installs docker within linux vm  
- installs kubectl 
- installs minikube

Usage: 
```
chmod +x setup_hw3.sh
./setup_hw3.sh
```

## Setup HW4

- install java
- checks java installation
- install android studios

Usage: 
```
chmod +x setup_hw4.sh
./setup_hw4.sh
```


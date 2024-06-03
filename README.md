# Homework Setup Scripts for NYU's Application Security Course
These sets of scripts will install all necessary software to run the applications provided in this course. Setup for homeworks 1,2,3,4 are currently implemented for Linux and MacOS machines, and setup for homeworks 2,3,4 are currently implemented for Windows machines (windows is not recommended for HW1). Simply pull this repo and then navigate to the directory that your OS corresponds to and run the scripts as needed before working on your homework assignment. Please read all of the instructions and pay attention to the outputs of the scripts for more information.

These scripts are here for your convenience, but if you'd rather do the setups yourself that is totally cool too. If you have any problems with the scripts open an issue for the repo.  

My personal advice after taking this course: use an Ubuntu VM or WSL with ubuntu for homeworks 1,2, and 3, and then just run android studio on your Windows host machine for homework 4. 

## Setup GPG (Mac and Linux only)

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

Usage (Linux and MacOS): 
```
chmod +x setup_hw1.sh
./setup_hw1.sh
```

Usage (Windows): 
In an open powershell terminal, 
```
pwsh ./Windows/setup_hw1.ps1
```

## Setup HW2

- installs python
- installs pip and venv
- creates virtual enviroment
- installs django via pip in venv
- runs makemigrations and import dbs 

Usage (Linux and MacOS): 
```
chmod +x setup_hw2.sh
./setup_hw2.sh <PATH-TO-REPO>
```
The path to repo here means the location on your filesystem where the root of the repository resides. So if you git cloned your repo to /home/example-user/appsec-homework-1-example, supply this as the argument to this script

Usage (Windows): 
In an open powershell terminal, 
```
pwsh ./Windows/setup_hw2.ps1
```
Ignore the PATH-TO-REPO argument in the linux/mac installation, you'll need to run those db setup and manage.py commands manually after cloning your repository to your local machine

## Setup HW3

- installs docker within linux vm  
- installs kubectl 
- installs minikube

Usage (Linux and MacOS): 
```
chmod +x setup_hw3.sh
./setup_hw3.sh
```

Usage (Windows): 
In an open powershell terminal, 
```
pwsh ./Windows/setup_hw3.ps1
```


## Setup HW4

- install java
- checks java installation
- install android studios

Usage (Linux and MacOS): 
```
chmod +x setup_hw4.sh
./setup_hw4.sh
```

Usage (Windows): 
In an open powershell terminal, 
```
pwsh ./Windows/setup_hw4.ps1
```

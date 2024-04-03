# appsec-env-setup-script
Setup script for HW 1-3 of NYU's application security class on a freshly installed ubuntu VM

## Usage

### HW1
Run this script from the location where you want your homework repo to be cloned into

Helpful tips for usage: 
Make sure you create the GPG and SSH keys beforehand if you do not have them already 

[Generating a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

[Generating a new GPG Key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

The HW1 setup script will ask for the GPG key ID, this can be found by running 

`gpg --list-secret-keys --keyid-format=long`
 
 See the link above for more information about the GPG key ID

```
chmod +x setup_hw1_ubuntu.sh
./setup_hw1_ubuntu.sh <repo_name> <email> <name> <gpg_id>
```
- repo_name: this is just the name of the repository, not the whole url 
- email: email associated with github account used for this class
- name: your name
- gpg_id: as mentioned above

### HW2

## Actions performed

### HW 1  
- Adds gpg key to git config, enable automatic signing on commit
- git clone repo by name  
- installs AFL++ 
- installs GDB 
- installs lcov

### HW 2
- git clone repo by name 
- installs pip and venv
- creates virtual enviroment
- installs django via pip in venv
- runs makemigrations and import dbs 

### HW 3 (WIP)
- install docker within linux vm  
- install kubectl 
- install minikube


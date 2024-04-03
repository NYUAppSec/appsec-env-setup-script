# appsec-env-setup-script
Setup script for HW 1-3 of NYU's application security class on a freshly installed ubuntu VM

## Usage
Run this script from the location where you want your homework repo to be cloned into

Helpful tips for usage: 
Make sure you create the GPG and SSH keys beforehand if you do not have them already 

[Generating a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

[Generating a new GPG Key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

The HW1 setup script will ask for the GPG key ID, this can be found by running 

`gpg --list-secret-keys --keyid-format=long`
 
 See the link above for more information about the GPG key ID


```
chmod +x setup.sh
./setup.sh
```

### Assumptions about setup

- GPG key and SSH key already exist

### HW 1  
- Add gpg key to git config, enable automatic signing on commit
- git clone repo by name  
- install AFL++ 
- install GDB 
- install lcov

### HW 2
- git clone repo by name 
- create virtual enviroment
- install django via pip in venv
- makemigrations and import dbs 
- test runserver  

### HW 3
- install docker within linux vm  
- install kubectl 
- install minikube


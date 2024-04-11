# appsec-env-setup-script
Setup script for HW 1-3 of NYU's application security class (currently for Ubuntu/Debian machines only) 

## TODO
1. Finish HW4 script for ubuntu  
2. Add MacOS scripts
3. Add windows script for HW2, HW3, HW4 (skipping HW1 as that is not a recommended platform for that assignment)

### setup_gpg

Make sure you create the GPG and SSH keys beforehand if you do not have them already 

[Generating a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

[Generating a new GPG Key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

The HW1 setup needs the GPG key ID to set up your git config settings, this can be found by running 

`gpg --list-secret-keys --keyid-format=long`
 
 See the link above for more information about the GPG key ID

```
chmod +x setup_gpg.sh
./setup_gpg.sh <email> <name> <gpg_id>
```
- email: email associated with github account used for this class
- name: "your name" (dont forget quotes)
- gpg_id: as mentioned above

### setup_hw1

- installs AFL++ 
- installs GDB 
- installs lcov

Usage: 
```
chmod +x setup_hw1.sh
./setup_hw1.sh
```

### setup_hw2

- git clone repo by name 
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

### setup_hw3

- install docker within linux vm  
- install kubectl 
- install minikube

Usage: 
```
chmod +x setup_hw3.sh
./setup_hw3.sh
```



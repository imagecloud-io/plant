# Requirements

Various parts of this image factory have external dependencies. Please make sure you have the following installed:

## General

For the core, we need the following components:

* The latest version of Ansible 2.5. This version of the image factory might work with later minor versions of Ansible, 
however as Ansible is rapidly evolving, some keywords or constructs may become deprecated or even phased out. 
Version 2.4 or
lower will not work.
* InSpec by Chef, available from [inspec.io](https://www.inspec.io)
* The following packages: 
  * Python 2.7 and pip
  * gcc
  * OpenSSL development library (libssl-dev on Debian and Ubuntu, openssl-devel on RHEL and derivatives)
* The following Python packages from PyPi (installed through pip):
  * cryptography>=2.2.2
  * pyopenssl>=18.0.0
  * pycrypto>=2.6.1
  * pywinrm>=0.3.0
  
## VMware vSphere

For deployment to VMware vSphere, we need the following components:

* HashiCorp's Packer, available from [packer.io](https://www.packer.io)
* The following Python packages from PyPi (installed through pip):
  * pyvmomi
  
## Amazon AWS

For deployment to Amazon AWS, we need the following components:

* 


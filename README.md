## Overview
This project allows me to test what I've learned in the Terraform course and the Jenkins course

The infrastructure consists of private VPC with 3 Public Subnets and an Internet Gateway
Each Subnet contains an EC2 application instance
One submnet also contains the Jenkins server which is also an Ansible master

The Terraform files in /infra stand up the entire infrastructure environment complete with all components

The Jenkins file runs the continuous integraiton pipeline wich will checkout the git source, 
create the container and push the latest version of container to the Docker Hub public repository

The configureation of the application is done via Ansible playbook and hosts file that contains the inventory

It has the following directories:
 app - for application source files
 configure - where Ansible components live
 deploy - where Jenkins files live 
 infra - where Terraform files live
 misc - where misc scripts live

 


#!/bin/bash

ansible-playbook -i hosts --private-key ~/.ssh/archerkey $1 

#!/bin/bash

ansible-playbook -i hosts --private-key ~/.ssh/archerkey -u ubuntu playbook.yml --check

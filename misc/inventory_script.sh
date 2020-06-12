#!/bin/bash 

# This script will simply fetch a list of public IP addresses from all EC2 instances (filtered by tag Name=archer-app)
# I can be modified to fetch other ec2 instances as necessary


aws ec2 describe-instances --filters Name=tag:Name,Values=archer-app | jq -r '.Reservations[].Instances[] | .PublicIpAddress' >> ./latest_inventory

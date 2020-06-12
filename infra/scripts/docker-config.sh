#!/bin/bash

set +x

# Add ubuntu to the docker group 
sudo usermod -aG docker ${USER} 

# Run sample container
docker run hello-world


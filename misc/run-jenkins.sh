#!/bin/bash

# Start Docker Jenkins with all the trimmings
docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker-sock:/var/run/docker-sock -d --name jenkins jenkins/jenkins:latest

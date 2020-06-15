FROM jenkins/jenkins:lts
USER root

# Install docker client 
RUN mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 groupadd -g 999 docker && \
 usermod -aG staff,docker jenkins

# Install Ansible
RUN apt-get update && apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt install -y ansible

USER jenkins

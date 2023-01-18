FROM jenkins/jenkins:lts

USER root
RUN apt-get update 
RUN apt-get install docker.io

USER jenkins
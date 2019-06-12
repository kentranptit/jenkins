# Starting off with the Jenkins base Image
FROM jenkins/jenkins:lts

MAINTAINER Khai Tran Quang <khaitq8401@co-well.com.vn>

# Skipping initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Installing the plugins we need using the in-built install-plugins.sh script
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Setting up environment variables for Jenkins admin user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Start-up scripts to set number of executors and creating the admin user
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

VOLUME /var/jenkins_home

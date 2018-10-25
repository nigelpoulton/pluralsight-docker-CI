FROM centos:centos7

LABEL MAINTAINER=nigelpoulton@hotmail.com

# Install Node etc...
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install nodejs npm; yum clean all

# Copy source code to /src in container
COPY . /src

# Change working directory to /src
WORKDIR /src

# Install app and dependencies into /src in container
RUN npm install

# Document the port the app listens on
EXPOSE 8080

# Run this command (starts the app) when the container starts
CMD node ./app.js

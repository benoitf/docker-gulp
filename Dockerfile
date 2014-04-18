# Pull base image.
FROM ubuntu:13.10

MAINTAINER Florent Benoit

# Set working directory.
ENV HOME /root
WORKDIR /root


# ruby is required for compass / sass
# unzip is required for unzipping application
# software-properties is used for add-apt-repository command
# python-software-properties is used for nodejs
RUN apt-get install -y software-properties-common python-software-properties unzip git ruby-full rubygems1.8
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs

# Install sass/compass
RUN gem install sass
RUN gem install compass

# Install gulp
RUN npm install -g gulp

# Add a user
RUN adduser --disabled-password --home=/home/user --gecos "" user

# Run all operations in user mode
USER user
ENV HOME /home/user
WORKDIR /home/user


### Steps that can be done by applications :
# Unpack application
#ADD angularjs.zip /home/user/application.zip
#RUN unzip -uo /home/user/application.zip -d /home/user/application
#RUN rm /home/user/application.zip

#WORKDIR /home/user/application


# Download npm dependencies
#RUN [ -e /home/user/application/node_modules ] || npm install

# Download bower dependencies
#RUN [ -e /home/user/application/app/bower_components ] || bower install

# Application will listen on 5000 port number
#EXPOSE 5000


#CMD gulp serve:app

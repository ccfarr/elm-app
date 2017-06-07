# See https://github.com/codeschool/WatchUsBuild-SimpleNodeAppWithDocker.git

# Start with image for node version 4.8
FROM node:4.8

# Maintainer
LABEL maintainer="ccfarr@gmail.com"

# Use port 4000 in container
EXPOSE 4000

# Add directory inside container
# -p create intermediate directories
RUN mkdir -p /usr/src/app/

# Set working directory
WORKDIR /usr/src/app

# Copy files into app folder
COPY elm-package.json /usr/src/app/
COPY gulpfile.js /usr/src/app/
COPY index.html /usr/src/app/
COPY package.json /usr/src/app/

# Install npm modules
RUN npm install
RUN npm install -g gulp
RUN npm install -g elm

# Start the node app
CMD ["gulp"]

# Shared directory on container side
# still need to specify path when running container
VOLUME /usr/src/app/src

# See https://github.com/codeschool/WatchUsBuild-SimpleNodeAppWithDocker.git

# Start with image for node version 4.8
FROM node:4.8

# Maintainer
LABEL maintainer="ccfarr@gmail.com"

# Use port 8888 in container
EXPOSE 8888

# Add directory inside container
# -p create intermediate directories
RUN mkdir -p /usr/src/app/

# Set working directory
WORKDIR /usr/src/app

# Copy package.json into app folder
# as Dockerfile and package.json are in same folder
# no need to specify path
COPY package.json /usr/src/app/

# Install npm modules
RUN npm install

# Start the node app
CMD ["npm","start"]

# Shared directory on container side
# still need to specify path when running container
VOLUME /usr/src/app/src

# Use image for node version 4.8
FROM node:4.8

# Maintainer
LABEL maintainer="ccfarr@gmail.com"

# Use port 8888 in container
EXPOSE 8888

# Make dir inside container
RUN mkdir -p /usr/src/app/

# Set working directory
WORKDIR /usr/src/app

# Copy package.json into app folder
# works because Dockerfile and package.json # are in same folder, otherwise would
# need to provide a path
COPY package.json /usr/src/app/

# Install npm modules
RUN npm install

# Start the node app
CMD ["npm","start"]

# Does not establish volume, only to document
VOLUME /usr/src/app/src

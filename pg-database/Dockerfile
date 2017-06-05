# See https://github.com/codeschool/WatchUsBuild-SimpleNodeAppWithDocker.git

# Use image for postgres version 9.6
FROM postgres:9.6

# Maintainer
LABEL maintainer="ccfarr@gmail.com"

# Use port 5432 in container (default)
EXPOSE 5432

# Move seed.sql into the image
COPY seed.sql /docker-entrypoint-initdb.d/

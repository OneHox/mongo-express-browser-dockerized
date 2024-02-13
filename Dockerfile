FROM mongo-express:latest

ENV ME_CONFIG_MONGODB_URL=mongodb://127.0.0.1:27017

ENV ME_CONFIG_MONGODB_AUTH_DATABASE="false"
# ENV ME_CONFIG_MONGODB_AUTH_USERNAME=admin
# ENV ME_CONFIG_MONGODB_AUTH_PASSWORD=pass
# ENV ME_CONFIG_BASICAUTH_USERNAME=admin
# ENV ME_CONFIG_BASICAUTH_PASSWORD=pass

# To Install more tools, checkout the below url, it's a repository of .apk pacakges,
# Find out if your desire package is available in that place

# Install MongoDB
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories
RUN apk update
RUN apk add mongodb=4.0.5-r0
# RUN mongo --version

RUN mkdir -p /data/db

# Expose MongoDB port
EXPOSE 8081

# Start MongoDB and mongo-express
CMD mongod --fork --logpath /var/log/mongod.log & node app.js
# CMD sleep 36000

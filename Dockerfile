FROM mongo-express:latest

ENV ME_CONFIG_MONGODB_URL=mongodb://localhost:27017

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
EXPOSE 27017 8081

# Start MongoDB and mongo-express
CMD mongod --fork --logpath /var/log/mongod.log & node app.js
# CMD sleep 36000

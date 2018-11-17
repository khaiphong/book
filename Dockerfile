# node.js for PWA
FROM node:10.13.0 AS node-env
ADD ca-certificates.crt /etc/ssl/certs/

COPY . /node/src/github.com/khaiphong/book
WORKDIR /node/src/github.com/khaiphong/book

# the mount point and activate personadb in the same machine
# VOLUME /khaiphong/personadb

# RUN npm install in working directory first
# If you are building your code for production
# RUN npm install --only=production

# Make 8081 available to outside this container for Node
EXPOSE 8081

# run personadb - a REST API - when the container launches
CMD [ "npm", "start" ]

# package the image in alpine for image built and serviced from personadb
#FROM 1.11.0-alpine
#COPY --from=node-env /node/src/github.com/khaiphong/mu \
#                      /node/src/github.com/khaiphong/mu

#RUN chown nobody:nogroup /go/src/github.com/khaiphong/mu
#USER nobody

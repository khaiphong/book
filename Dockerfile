# start an official go which installs golang and sets GOPATH
FROM golang:1.11 AS build-env
# copy the ca-certificates.crt from our machine into our container
ADD ca-certificates.crt /etc/ssl/certs/

COPY . /go/src/github.com/khaiphong/book
WORKDIR /go/src/github.com/khaiphong/book

# get all dependencies and compile go program
RUN go get -d -v ./...
RUN go build -o main .

# the mount point for different containers in the same machine
VOLUME /khaiphong/personadb

# run book service, a REST API when the container launches
CMD ["/go/src/github.com/khaiphong/book/main"]

# Make port 8080 available to the world outside this container
EXPOSE 8080

# package the image in alpine for image built and serviced from personadb
#FROM 1.11.0-alpine
#COPY --from=build-env /go/src/github.com/khaiphong/mu \
#                      /go/src/github.com/khaiphong/mu

#RUN chown nobody:nogroup /go/src/github.com/khaiphong/mu
#USER nobody

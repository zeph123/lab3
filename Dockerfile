# syntax=docker/dockerfile:1

FROM alpine AS download

# Create app directory
WORKDIR /app

# Install ssh client and git
RUN apk add --no-cache openssh-client git

# Download public key for github.com
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

# Clone repository
RUN --mount=type=ssh,id=my_ssh,required git clone git@github.com:zeph123/simple-web-app Simpleweb

# Specify a base image
FROM node:alpine AS build

COPY --from=download /app/Simpleweb /app

WORKDIR /app

## Install lts version of npm
RUN npm install

# Expose app on port: 8080
EXPOSE 8080

# Default command
CMD ["npm", "start"]


# Lab 3

## Table of contents
* [General info](#general-info)
* [Build image](#build-image)
* [Push image](#push-image)
* [Setup](#setup)

## General info
This project is about develop a Dockerfile that serves as a frontend (Dockerfile) for Buildkit. It allow to download the contents of the prepared repository, then build Docker image based on repository, which is containing simple Node.js web app.

The repository download have to be done via the SSH protocol.

## Build image
To build docker image of this project, execute commands below:

```
$ docker build --ssh my_ssh=./ssh/id_rsa -t lab2.v1 -f Dockerfile .
```

## Push image
To push docker image to public repository on DockerHub, execute commands below:

```
$ # Login into your DockerHub account
$ docker login -u username -p password

$ # Tag your image to specific repository
$ docker tag lab2.v1 01234ab909f/lab3

$ # Push your image to specific repository
$ docker push 01234ab909f/lab3
```

## Setup
To run this project, execute commands below:

```
$ docker run -d --rm -p 8080:8080 --name simple-web-app lab2.v1
```
[![Build Status](https://travis-ci.org/agave/golang-base.svg?branch=master)](https://travis-ci.org/agave/golang-base)
# golang-base
Base image that includes golang 1.7.4 and a functional protobuf compiler

Build using:

 `docker build -t <your-org>/<tag> --build-arg PROTOBUF_VER=<version-number> .`

PROTOBUF_VER defaults to 3.1.0.

Feel free to delete any packages left in the image in case of not needing them.

Once pushed use it in your Dockerfiles like so:

`FROM <your-org>/golang-base:<tag>`

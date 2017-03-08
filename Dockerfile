FROM golang:1.8-alpine
MAINTAINER Fernando Mendoza <fernando@agavelab.com>

ARG TORUS_VER=0.22.0

RUN apk add -U --no-progress bash curl g++ gcc git make postgresql-client protobuf protobuf-dev \
	&& curl -#L https://get.torus.sh/${TORUS_VER}/torus_${TORUS_VER}_linux_amd64.zip >> torus.zip \
	&& unzip -q torus.zip \
	&& mv torus bin/ \
	&& rm torus.zip \
	&& curl -# https://glide.sh/get | sh \
    && go get github.com/mattes/migrate

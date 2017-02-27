FROM golang:1.7.5-alpine
MAINTAINER Fernando Mendoza <fernando@agavelab.com>

ARG PROTOBUF_VER=3.1.0
ARG TORUS_VER=0.22.0

RUN apk add -U --no-progress autoconf automake bash curl g++ gcc git libtool make \
	&& curl -#L https://get.torus.sh/${TORUS_VER}/torus_${TORUS_VER}_linux_amd64.zip >> torus.zip \
	&& unzip -q torus.zip \
	&& mv torus bin/ \
	&& rm torus.zip \
	&& curl -#L https://github.com/google/protobuf/archive/v${PROTOBUF_VER}.zip >> ${PROTOBUF_VER}.zip \
	&& unzip -q ${PROTOBUF_VER}.zip \
	&& cd protobuf-${PROTOBUF_VER} \
	&& ./autogen.sh \
	&& ./configure --prefix=/usr --disable-shared \
	&& make \
	&& make check \
	&& make install \
	&& apk del --purge autoconf automake libtool \
	&& cd $GOPATH \
	&& rm -rf ${PROTOBUF_VER}.zip protobuf-${PROTOBUF_VER}

FROM alpine:latest

LABEL maintainer "lihungte96"

ARG BRANCH_OR_TAG=master
RUN env \
  && apk update && apk upgrade \
  && apk add --no-cache -q -f git cmake make g++ \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build
WORKDIR /googletest/build
RUN cmake .. && make && make install
ENV GOOGLETEST_DIR=/googletest

FROM ubuntu:latest

LABEL maintainer "lihungte96"

ARG BRANCH_OR_TAG=master
RUN env \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y git cmake make g++ lcov \
  && apt-get clean

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build
WORKDIR /googletest/build
RUN cmake .. && make && make install
ENV GOOGLETEST_DIR=/googletest

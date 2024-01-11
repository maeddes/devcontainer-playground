FROM golang:1.21-alpine as base

FROM base as installer

RUN apk add --update --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    hugo

RUN apk add --update --no-cache \
    sudo \
    bash \
    git \
    python3

FROM installer as rt

ARG USER=otel
ENV HOME /home/$USER

RUN adduser -D $USER \
    && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

WORKDIR /workspace

USER ${USER}
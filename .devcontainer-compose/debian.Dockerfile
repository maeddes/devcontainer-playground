FROM golang:1.21-bullseye as base

FROM base as deps

ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=${DEBIAN_FRONTEND}

RUN apt-get -qq update
RUN apt-get install -qq -y --no-install-recommends \
    sudo \
    bash \
    git \
    hugo \
    python3

FROM deps as rt

ARG USER=otel
ENV HOME /home/$USER

RUN adduser --disabled-password $USER \
        && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
        && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR $HOME

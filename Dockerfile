FROM alpine:3.18
LABEL name="lg-common"
LABEL description="Common tools for bioinformatics workflows I develop."
LABEL url="https://github.com/LeoGillet/lg-common"
LABEL maintainer="Léo Gillet <leo@leogillet.com>"
ENV PYTHONUNBUFFERED=1

# Installing bash
RUN apk add --update --no-cache bash
SHELL ["/bin/bash", "-c"]
CMD /bin/bash

# Install Java 11 & Perl
RUN apk add --update --no-cache openjdk11 perl

# Install Python 3 and pip
RUN apk add --update --no-cache python3  && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools wheel

# Install dev/build tools
RUN apk add --update --no-cache --virtual .build-deps git make musl-dev linux-headers gcc g++ cmake libc-dev zlib-dev ncurses-dev bzip2-dev xz-dev python3-dev py3-numpy py3-numpy-dev jpeg-dev
RUN apk add --update --no-cache --virtual .kslam-deps boost-dev libgomp

# Prepare tool compilation
RUN mkdir /tmp/dep-installers
COPY install/* /tmp/dep-installers/
RUN mkdir /tmp/dep-installers/downloads

# Install xtl, xtensor
RUN chmod +x /tmp/dep-installers/xtensor.sh
RUN /tmp/dep-installers/xtensor.sh

# Install python dependencies
COPY python/requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt


# Install bioinformatics tools
RUN chmod +x /tmp/dep-installers/dependencies_install.sh
RUN /tmp/dep-installers/dependencies_install.sh


# Install bioinformatics tools
RUN chmod +x /tmp/dep-installers/agent_install.sh
RUN /tmp/dep-installers/agent_install.sh

# Remove unused building tools
RUN apk del .build-deps
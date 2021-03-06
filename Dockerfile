#
# DIAMONTIS Informatique
# STIEN Jordan
#

FROM ubuntu:20.04

# Configure Env
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install requirements
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    apt-utils \
    apt-transport-https \
    xz-utils \
    gcc \
    g++ \
    make \
	openssh-client \
	rsync \
	git \
	libmcrypt-dev \
	libjpeg-dev \
	libzlcore-dev \
	libtiff5-dev \
	libfreetype6-dev \
	libwebp-dev \
	libtk-img-dev \
	unzip \
	zip \
	bzip2 \
	python3 \
	python3-pip \
	lsb-release \
	sudo

# Install Node 14 source
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

# Install env requirements
RUN apt-get update && apt-get install -y nodejs

# Install a local MySQL server
RUN apt-get update \
  && apt-get install -y mysql-server mysql-client libmysqlclient-dev --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## NPM
RUN npm install -g gulp grunt bower typescript yarn webpack discord.js
RUN echo '{ "allow_root": true }' > /root/.bowerrc

CMD ["/bin/bash"]

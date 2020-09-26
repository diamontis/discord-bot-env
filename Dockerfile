#
# DIAMONTIS Informatique
# STIEN Jordan
#

FROM ubuntu:20.04

# Install minimum requirements
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    apt-utils \
    apt-transport-https \
    xz-utils \
    gcc \
    g++ \
    make

# Install Node 14 source
RUN -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

# Install env requirements
RUN apt-get update && apt-get install -y \
  openssh-client \
  rsync \
  bzip2 \
  python3 \
  python3-pip \
  lsb-release \
  nodejs \
  git \
  libmcrypt-dev \
  libjpeg-dev \
  libzlcore-dev \
  libtiff5-dev \
  libfreetype6-dev \
  libwebp-dev \
  libtk-img-dev \
  unzip \
  zip

# Set Env
ENV DEBIAN_FRONTEND noninteractive

# Install a local MySQL server
RUN apt-get update \
  && apt-get install -y mysql-server mysql-client libmysqlclient-dev --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## NPM
RUN npm install -g gulp grunt bower typescript yarn webpack
RUN echo '{ "allow_root": true }' > /root/.bowerrc

CMD ["/bin/bash"]

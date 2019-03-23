#################################################
# Node JS
#################################################

FROM amazonlinux:2

# Updating yum
RUN yum -y update

# Installing dependencies
RUN yum -y install curl gcc-c++ tar gzip which mysql

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ARG NODE_VERSION

# Installing nvm
RUN mkdir ${NVM_DIR}
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# Installing node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

# 日本語対応
RUN yum -y reinstall glibc-common
ENV LANG ja_JP.UTF-8

# 開発ツールインストール
RUN yum -y install vim-enhanced wget zsh

# Git依存ファイルのインストール
RUN yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
# RUN yum install -y git2u-svn


# # Start Up Scripts
# RUN adduser -m app
# RUN mkdir -p /var/app && chown app:app /var/app
# ADD ./Scripts/startup.sh /var/app/startup.sh
# RUN chmod +x /var/app/startup.sh
# CMD ["/var/app/startup.sh"]


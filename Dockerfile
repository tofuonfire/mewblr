FROM ruby:2.6.5-alpine

ARG APP_ROOT=/mewblr
WORKDIR $APP_ROOT

RUN apk add --no-cache \
    git \
    bash perl \
    libxslt-dev libxml2-dev build-base --no-cache \
    mysql-client mysql-dev --no-cache \
    file \
    yarn \
    tzdata \
    imagemagick

COPY . $APP_ROOT

RUN gem update --system && \
    gem install bundler && \
    bundle install
RUN yarn install

RUN mkdir -p $APP_ROOT/tmp/sockets $APP_ROOT/tmp/pids

RUN mkdir -p /tmp/public && \
    cp -rf $APP_ROOT/public/* /tmp/public

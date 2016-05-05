FROM debian:jessie
MAINTAINER Scott Stephenson <macsteps@gmail.com>

ENV APP_HOME /usr/src/lnat_app
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y --no-install-recommends \
    curl ca-certificates gnupg apt-transport-https libpq-dev && \
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
    echo 'gem: --no-document' >> ~/.gemrc && \
    echo 'source /usr/local/rvm/scripts/rvm' >> /etc/profile && \
    curl -sSL https://get.rvm.io | bash -s stable --ruby --rails && \
    /bin/bash --login -c 'rm /bin/sh && ln -s /bin/bash /bin/sh' && \
    rm -rf /var/lib/apt/lists

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME
COPY Gemfile.lock $APP_HOME
RUN /bin/bash --login -c 'bundle install'

COPY . $APP_HOME

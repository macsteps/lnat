FROM centurylink/alpine-rails
MAINTAINER Scott Stephenson <macsteps@gmail.com>

ENV APP_HOME /usr/src/lnat_app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME
COPY Gemfile.lock $APP_HOME
RUN bundle install

COPY . $APP_HOME

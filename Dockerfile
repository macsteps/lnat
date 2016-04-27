FROM ruby:2.2

RUN apt-get update -qq && apt-get install -y build-essential nodejs

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

ENV APP_HOME /usr/src/lnat_app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME
COPY Gemfile.lock $APP_HOME
RUN bundle install

COPY . $APP_HOME

CMD ["rails", "server", "--binding", "0.0.0.0”]

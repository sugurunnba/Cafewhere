FROM ruby:2.6.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       vim

RUN mkdir /Cafewhere

WORKDIR /Cafewhere

ADD Gemfile /Cafewhere/Gemfile
ADD Gemfile.lock /Cafewhere/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /Cafewhere

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids
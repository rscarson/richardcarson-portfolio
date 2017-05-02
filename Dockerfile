FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /richardcarson.ca
WORKDIR /richardcarson.ca

ADD Gemfile /richardcarson.ca/Gemfile
ADD Gemfile.lock /richardcarson.ca/Gemfile.lock

RUN bundle install
ADD . /richardcarson.ca
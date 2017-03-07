FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy mysql-client vim libpq-dev nodejs

RUN mkdir /notes_app

WORKDIR /notes_app
ADD Gemfile /notes_app/Gemfile
ADD Gemfile.lock /notes_app/Gemfile.lock
RUN bundle install

ADD . /notes_app

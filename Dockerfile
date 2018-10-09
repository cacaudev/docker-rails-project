FROM ruby:2.3.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
#your apps name
RUN mkdir /first_app_docker 
WORKDIR /first_app_docker
ADD Gemfile /first_app_docker/Gemfile
ADD Gemfile.lock /first_app_docker/Gemfile.lock
RUN bundle install
ADD . /first_app_docker


FROM ruby:2.4.0
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev
RUN apt-get install -y imagemagick netcat-traditional
ENV RAILS_ROOT /var/www/rails_comfy_docker_app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
COPY comfy_app/Gemfile Gemfile
COPY comfy_app/Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY ./comfy_app .

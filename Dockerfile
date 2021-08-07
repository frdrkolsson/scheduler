FROM ruby:3.0-alpine

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD bundle exec sidekiq -r ./config/application.rb -C ./config/sidekiq.yml

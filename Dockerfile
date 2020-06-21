FROM ruby:2.6.5

# core dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app
WORKDIR /app

RUN gem install bundler:2.1.2
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD puma -C config/puma.rb

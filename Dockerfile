FROM ruby:2.6.5

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Instala dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick

RUN gem install bundler:2.1.2

ENV LANG C.UTF-8
ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

ENV BUNDLE_PATH /gems

COPY . .

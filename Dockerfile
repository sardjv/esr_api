FROM ruby:2.7.1-alpine

RUN apk update && apk add build-base nodejs mysql-dev git freetds-dev

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /bundle_cache
COPY . .

CMD puma -C config/puma.rb

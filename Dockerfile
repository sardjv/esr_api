FROM ruby:2.7-alpine

RUN apk update && apk add build-base nodejs postgresql-dev git

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /bundle_cache
COPY . .

CMD puma -C config/puma.rb

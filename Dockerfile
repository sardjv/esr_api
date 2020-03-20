FROM ruby:2.6-alpine

RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /box
COPY . .

CMD puma -C config/puma.rb

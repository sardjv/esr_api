FROM ruby:2.7.2-alpine

RUN apk update
RUN apk add build-base git nodejs yarn

# MySQL option.
RUN apk add mysql-dev

WORKDIR /app

ENV BUNDLE_PATH /bundle_cache

COPY package.json yarn.lock ./

COPY . .

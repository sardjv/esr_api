FROM ruby:3.3.6-alpine

RUN apk update
RUN apk add build-base git nodejs yarn mariadb-dev openssl tzdata
RUN apk add less # Required to solve this issue when using Pry: https://github.com/pry/pry/issues/1248
RUN apk add shared-mime-info # For this issue: https://github.com/mimemagicrb/mimemagic/issues/98

WORKDIR /app

ENV BUNDLE_PATH /bundle_cache

COPY package.json yarn.lock ./

COPY . .

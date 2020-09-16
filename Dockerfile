FROM ruby:2.7.1-alpine

RUN apk update
RUN apk add build-base git nodejs yarn

# PostgreSQL option.
# RUN apk add postgresql-dev

# MySQL option.
RUN apk add mysql-dev

# SQL Server option.
# RUN apk add unixodbc-dev unixodbc freetds-dev freetds

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /bundle_cache

COPY package.json yarn.lock ./

COPY . .

CMD puma -C config/puma.rb

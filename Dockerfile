FROM ruby:2.7.1-alpine

# RUN apk update && apk add build-base git nodejs yarn postgresql-dev # PostgreSQL option.
RUN apk update && apk add build-base git nodejs yarn mysql-dev # MySQL option.
# RUN apk update && apk add build-base git nodejs yarn freetds-dev # SQL Server option.

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /bundle_cache

COPY package.json yarn.lock ./

COPY . .

CMD puma -C config/puma.rb

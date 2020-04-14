FROM ruby:2.7.1-alpine

# RUN apk update && apk add build-base nodejs postgresql-dev git # PostgreSQL option.
# RUN apk update && apk add build-base nodejs mysql-dev git # MySQL option.
RUN apk update && apk add build-base nodejs freetds-dev git # SQL Server option.

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /bundle_cache
COPY . .

CMD puma -C config/puma.rb

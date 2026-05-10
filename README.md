# ESR_API: a Ruby on Rails API for the NHS ESR System

[![CircleCI Build Status](https://circleci.com/gh/sardjv/esr_api.svg?style=shield)](https://circleci.com/gh/sardjv/esr_api)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/sardjv/esr_api/blob/master/LICENSE)
[![Public Money Public Code - Community](https://img.shields.io/badge/Public_Money_Public_Code-Community-2ea44f)](https://publicmoneypubliccode.org.uk/)

ESR API is an open source project to improve the ability of NHS Trusts to interface with their ESR Data.

It's a collaboration between [SARD JV](https://sardjv.co.uk/) and [Oxleas NHS Foundation Trust](http://oxleas.nhs.uk/), funded by NHS Improvements. It's currently under active development and is not yet ready for production use.

Click [here](https://sardjv.github.io/esr_api/) to check out the documentation for this project.

## Stack

- **Ruby** 3.3.6
- **Rails** 6.1.7.x
- **MySQL** 8.0
- **Redis** 6+
- **Node** 18+ (Webpacker 5 / Webpack 4 — `NODE_OPTIONS=--openssl-legacy-provider` is wired into `bin/webpack` for Node 17+)
- **Sidekiq** 6.5

## Local development (without Docker)

```bash
# Install Ruby + bundler
rbenv install 3.3.6 && rbenv local 3.3.6
gem install bundler

# Install gems and JS deps
bundle install
yarn install

# Boot a local MySQL (bound to localhost only)
docker run -d --name esr-api-mysql \
  -p 127.0.0.1:13306:3306 \
  -e MYSQL_ROOT_PASSWORD=esr_api_dev \
  mysql:8.0

# Copy .env.example to .env and fill it in, then:
bundle exec rails db:create db:schema:load
bundle exec rspec
```

## Local development (with Docker)

```bash
cp .env.example .env  # fill in passwords / secrets
cp docker-compose.override.yml.sample docker-compose.override.yml
docker-compose up
```

# ESR_API: a Ruby on Rails API for the NHS ESR System

[![CircleCI Build Status](https://circleci.com/gh/sardjv/esr_api.svg?style=shield)](https://circleci.com/gh/sardjv/esr_api)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/sardjv/esr_api/blob/master/LICENSE)

ESR API is an open source project to improve the ability of NHS Trusts to interface with their ESR Data.

Click [here](https://sardjv.github.io/esr_api_docs/) to check out the documentation.

## .env file

To get started, you need a `.env` file with secrets. If you use bash, you can generate one with the command `sh ./script/generate_env_file.sh`. If not, there is an `.env.example` file included in the repo that you can use, just remove the `.example` from the filename. Make sure to change all secrets marked with YOU_MUST_CHANGE_THIS_PASSWORD before running in production!

## Booting up

If you have Docker on your machine:

### Setup

```
cp docker-compose.override.yml.sample docker-compose.override.yml
docker-compose build
```

### Start
```
docker-compose up
```

It can then be accessed at [http://localhost:3000/](http://localhost:3000/)

### Stop

Stop containers but do not remove them:

```
docker-compose stop
```

Stop containers and remove them:

```
docker-compose down --remove-orphans
```

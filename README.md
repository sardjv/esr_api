# ESR_API: a Ruby on Rails API for the NHS ESR System

[![CircleCI Build Status](https://circleci.com/gh/sardjv/esr_api.svg?style=shield)](https://circleci.com/gh/sardjv/esr_api)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/sardjv/esr_api/blob/master/LICENSE)

ESR API is an open source project to improve the ability of NHS Trusts to interface with their ESR Data.

Click [here](https://sardjv.github.io/esr_api/) to check out the documentation for this project.
It can also be viewed

## Quickstart Guide

### .env file

To get started, you need a `.env` file with secrets. If you use bash, you can generate one with the command `sh ./script/generate_env_file.sh`. If not, there is an `.env.example` file included in the repo that you can use, just remove the `.example` from the filename. Make sure to change all secrets marked with YOU_MUST_CHANGE_THIS_PASSWORD before running in production!

### Booting up

```
docker-compose up
```

It can then be accessed at [http://localhost:3001/](http://localhost:3001/).

### Admin Setup

- Click "Create an account" and enter your details.
- Admins can access ALL user data so this must be a highly privileged account with a very strong password. You will be immediately logged in.
- Any subsequent admin that signs up must be manually approved by an existing admin, via the Admins page, clicking Edit and then Activated and Update User.

### API

The API documentation can be viewed at [http://localhost:3001/api_docs](http://localhost:3001/api_docs).

# ESR_API: a Ruby on Rails API for the NHS ESR System

[![CircleCI Build Status](https://circleci.com/gh/sardjv/esr_api.svg?style=shield)](https://circleci.com/gh/sardjv/esr_api)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/sardjv/esr_api/blob/master/LICENSE)

ESR API is an open source project to improve the ability of NHS Trusts to interface with their ESR Data.

It's a collaboration between [SARD JV](https://sardjv.co.uk/) and [Oxleas NHS Foundation Trust](http://oxleas.nhs.uk/), funded by NHS Improvements. It's currently under active development and is not yet ready for production use.

Click [here](https://sardjv.github.io/esr_api/) to check out the documentation for this project.

## Quickstart Guide

### .env file

- To get started, you need a `.env` file with secrets.
- Generate it with the command `sh ./script/generate_env_file.sh`.

### Booting up

```
docker-compose up
```

It can then be accessed at [http://localhost:3001/](http://localhost:3001/).

### Create the first Admin

- Click "Create an account" and enter your details.
- Admins can access ALL user data so this must be a highly privileged account with a very strong password. You will be immediately logged in.
- Any subsequent admin that signs up must be manually approved by an existing admin, via the Admins page, clicking Edit and then Activated and Update User.

### Set up the FTP Connection

- You need to add the FTP connection details for your trust in order to use the API.
- Click "Ftp Credentials".
- Click "New ftp credential".
- Enter your FTP connection details and press "Create Ftp credential".
- This will immediately send a request file to the FTP server `/In` directory for the initial seed data.
- From this point the API will attempt to fetch and import new data from the FTP server each day at 8am.

### Create an API Token

- Each client application requires a Token to use the API.
- Click "API Tokens".
- Click "New token".
- Give the token a name to identify which client application will use the token.
- Add permissions to give access to the data that the client application requires.
- Click Create Token.
- Securely add this token to the client application so that it can use the API.

### Use the API

- The API documentation can be viewed at [http://localhost:3001/api_docs](http://localhost:3001/api_docs).
- You can use this page to test the API - click "Authorize" and add a Token.
- Click on an endpoint and click "Try it out" and "Execute" to get a response.

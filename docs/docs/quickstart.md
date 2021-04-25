---
id: quickstart
title: Quickstart
slug: quickstart
---

:::warning
  Any server or computer running this software MUST be totally secure, accessible only to privileged users, and administered by a professional sysadmin, as it will grant total access to ALL personally identifiable ESR data that is imported into it. The Docker environment is not inherently secure, and passwords set in the .env file are available on the host, as well as downloaded .DAT files containing ALL personally identifiable data.
:::

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

:::info
Note: if your trust is already using the FTP service, you may need to change the filename of the seed request to match the time of the last delta. [Click here for more info.](quickstart.md)
:::

### Create an API Token

- Each client application requires a Token to use the API.
- Click "API Tokens".
- Click "New token".
- Give the token a name to identify which client application will use the token.
- Add permissions to give access to the data that the client application requires.
- Click Create Token.
- You will be able to view the secret token only once. Be very careful with it as it grants unimpeded access to confidential user data.
- Securely add to your client application so that it can use the API.

### Use the API

- The API documentation can be viewed at [http://localhost:3001/api_docs](http://localhost:3001/api_docs).
- You can use this page to test the API - click "Authorize" and add a Token.
- Click on an endpoint and click "Try it out" and "Execute" to get a response.

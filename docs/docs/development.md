---
id: development
title: Development
---

## .env file

To get started, you need a `.env` file with secrets. A script is provided to generate this file with new secrets:

```
sh script/generate_env_file.sh
```

If the script succeeds, it will print ".env file generation complete."

## Development mode

To use development mode, activate the docker-compose override file:

```
cp docker-compose.override.yml.sample docker-compose.override.yml
docker-compose build
```

## Booting up

If you have Docker on your machine, run:

```
docker-compose up
```

It can then be accessed at [http://localhost:3001/](http://localhost:3001/)

## API Documentation

The Swagger docs are generated from the RSpec tests in `spec/controllers/api` To rebuild the swagger docs:

```
docker-compose run api bundle exec rails rswag
```

## Licenses

You can check the licenses of unaccepted dependencies using:

```
bundle exec license_finder
```

To add accepted licenses:

```
bundle exec license_finder permitted_licenses add MIT
```

## ETL and Kiba

This project uses the [Kiba](https://github.com/thbar/kiba) gem for scalable and maintainable data processing.

[This talk](https://www.youtube.com/watch?v=fxVtbog7pIQ) contains a short, clear explanation of how Kiba works.

### Tips
- Don't insert rows one by one - use bulk insert.
- Skip activerecord validations because they are too slow, find other ways to validate data.
- Fail fast; raise an exception and stop on failure rather than trying to carry on and creating bad data.

## Specs

To run Rubocop, and listen for file changes:

```
docker-compose run api bundle exec guard
```

Just press enter to run the whole test suite straight away.

## Code Coverage

After running the test suite, open the coverage/index.html file in a web browser to check what code is covered by the tests.

```
open coverage/index.html
```

## Debugging

To access a 'binding.pry' debugging point, run with:

```
docker-compose run --service-ports api
```

## Accessing the database console

To access the MySQL database console:

```
docker-compose exec db bash
mysql -u root -p
(enter root password)
show databases;
use esr_api_development;
SELECT * FROM person_records;
```

## Emails

The application does not currently send any emails.

## Stop

Stop containers but do not remove them:

```
docker-compose stop
```

Stop containers and remove them:

```
docker-compose down --remove-orphans
```

## Documentation

The documentation can be found in the `/docs` directory. When Docker is running the documentation site
is served locally at [http://localhost:3002/esr_api](http://localhost:3002/esr_api). Any changes made
in the `/docs` directory will be immediately visible.

We also serve the documentation online at [https://sardjv.github.io/esr_api/](https://sardjv.github.io/esr_api/).

To deploy changes to this site:

```
cd docs # Very important! The following commands will not work at the project's root directory.
yarn install # Only the first time.
GIT_USER=<Your GitHub username> USE_SSH=true yarn deploy
```

It may take a few minutes to update.

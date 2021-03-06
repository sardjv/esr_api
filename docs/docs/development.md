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
docker-compose run rails bundle exec rails rswag
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
docker-compose run rails bundle exec guard
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
## Model Annotation

To annotate rails models with schema run

```
docker-compose run rails bundle exec annotate --models
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

## Testing an import

If you need to compare 2 files, e.g. an export from ESR and an export form another system, you can compare the 2 files like this:

```
cd spec/fixtures/file_diffing
bash in_left_not_right.sh
```

This will print out any lines which appear in `spec/fixtures/left_hand_file` and not in `spec/fixtures/right_hand_file`.

## Versioning

After a bug is fixed (0.0.x), a new feature is added (0.x.0), or a breaking change is introduced(x.0.0), please:
- Bump the relevant version number in `config/initializers/version.rb`
- Add brief notes about the changes to `CHANGELOG.md`.
- Add a git tag to the merge commit in the format `v0.1.0`:
  ```
    git checkout master
    git pull
    git tag v0.1.0 && git push --tags
  ```
- [Add a release on Github](https://github.com/sardjv/esr_api/releases/new) using the tag number (for example) `v0.1.0` as the title and the changelog info as the description.

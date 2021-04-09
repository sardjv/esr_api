---
id: development
title: Development
---

## .env file

To get started, you need a `.env` file with secrets. For testing there is a `.env.example` file included in the repo that you can use, just remove the `.example` from the filename. Make sure to change all these secrets before running in production!

## Lockbox encryption key

In order to generate tokens, you need to add a 64 hex digit key to the .env file.

```
docker-compose run api sh
bundle exec rails console
Lockbox.generate_key
```

Copy the key and paste it into the .env file under

```
LOCKBOX_MASTER_KEY=master_key_goes_here
```

Reboot the server to use the new key:

```
docker-compose down && docker-compose up
```


## Booting up

If you have Docker on your machine, run:

```
docker-compose up
```

It can then be accessed at [http://localhost:3000/](http://localhost:3000/)

## Admin Authentication

You need to bootstrap the initial user via the command line. First go to [http://localhost:3000/](http://localhost:3000/), click Admin login and Admin signup and enter your details. Once that is done you need to activate your account using these commands:

```
docker-compose run api bundle exec rails console
User.first.update(confirmed_at: Time.current)
```

You should then be able to log in. Any subsequent admin that signs up can be added via the Admins page and clicking Edit.

## Documentation

The API documentation can be viewed at [http://localhost:3000/api_docs](http://localhost:3000/api_docs).

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

To access a 'byebug' debugging point, run with:

```
docker-compose run --service-ports api
```

## Database

To change database between MySQL, PostgreSQL and SQL Server:

1) Uncomment the relevent line in Dockerfile
2) Uncomment the relevant section in docker-compose.yml
3) Uncomment the relevant config in database.yml
4) Uncomment the relevant gem(s) in the Gemfile.

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

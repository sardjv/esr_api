# ESR_API: a Ruby on Rails API for the NHS ESR System

## .env file

To get started, you need a `.env` file with secrets. For testing there is a `.env.example` file included in the repo that you can use, just remove the `.example` from the filename. Make sure to change all these secrets before running in production!

## Booting up

If you have Docker on your machine, run:

```
docker-compose up
```

It can then be accessed at [http://localhost:3000/](http://localhost:3000/)

On the first run you need to create, migrate and optionally seed the database:

```
docker-compose run api bundle exec rails db:create db:migrate db:seed
docker-compose run api bundle exec rails db:migrate RAILS_ENV=test
```

## Logging in

Auth0 is required for login. You also need to add your client ID and secret to the env file in the Auth0 section.

## Deployment without Docker

If you can run [Docker](https://en.wikipedia.org/wiki/Docker_(software)), that is the quickest way to get started. If Docker install is not possible, the Dockerfile, docker-compose.yml and Gemfile files included in the repository can be used as a guide for dependencies.

Core dependencies:

- Ruby 2.7 [https://github.com/ruby/ruby](https://github.com/ruby/ruby)
- Rails 6.0.2.1 [https://github.com/rails/rails](https://github.com/rails/rails)
- Redis 5.0.8 [https://redis.io/](https://redis.io/)
- Sidekiq 6.0.6 [https://github.com/mperham/sidekiq](https://github.com/mperham/sidekiq)
- PostgreSQL 12.2, MySQL 8.0.19 or SQL Server 2017
- Multiple supporting gems as listed in the Gemfile, Bundler (included in Ruby) should take care of installing these.

## Documentation

The API documentation can be viewed at [http://localhost:3000/api_docs](http://localhost:3000/api_docs).

The Swagger docs are generated from the RSpec tests in `spec/controllers/api` To rebuild the swagger docs:

```
docker-compose run api bundle exec rails rswag
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
docker-compose exec mysql bash
mysql -u root -p
(enter root password)
show databases;
use esr_api_development;
SELECT * FROM person_records;
```

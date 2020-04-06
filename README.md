# ESR_API: a Ruby on Rails API for the NHS ESR System

To get started, you need Docker on your machine. Clone the project and run:

```
docker-compose up
```

It can then be accessed at [http://localhost:4000/](http://localhost:4000/)

On the first run you need to create and migrate the database:

```
docker-compose run api bundle exec rails db:create
docker-compose run api bundle exec rails db:migrate RAILS_ENV=development
docker-compose run api bundle exec rails db:migrate RAILS_ENV=test
```

To generate seed data for demonstration purposes:

```
docker-compose run api bundle exec rails db:seed
```

## Documentation

The API documentation can be viewed at [/api_docs](http://localhost:4000/api_docs).

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
docker-compose run --service-ports app
```

## Database

To access the database console:

```
docker-compose exec mysql bash
mysql -u root -p
(enter root password)
show databases;
use esr_api_development;
SELECT * FROM person_records;
```

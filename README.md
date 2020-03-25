# ESR_API: a Ruby on Rails API for the NHS ESR System

## ETL and Kiba

This project uses the [Kiba](https://github.com/thbar/kiba) gem for scalable and maintainable data processing.

[This talk](https://www.youtube.com/watch?v=fxVtbog7pIQ) contains a short, clear explanation of how Kiba works.

### Tips
- Don't insert rows one by one - use bulk insert with [Sequel](https://github.com/jeremyevans/sequel).
- Skip activerecord validations because they are too slow, find other ways to validate data.
- Fail fast; raise an exception and stop on failure rather than trying to carry on and creating bad data.

## Specs

To run Rubocop, and listen for file changes:

```
docker-compose run app bundle exec guard
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

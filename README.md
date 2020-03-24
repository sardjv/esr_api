# README

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

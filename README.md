## Execute database migrations after a service become healthy

Flywait is a container to execute migrations after a service become healthy. It uses [Flyway](https://flywaydb.org/) and [wait-for-healthy](https://github.com/ninjaneers-team/wait-for-healthy).

[![Build Status](https://travis-ci.org/ninjaneers-team/flywait.svg?branch=master)](https://travis-ci.org/ninjaneers-team/flywait)

## How to use this image

```
docker run ./wait-for-healthy -t 60 http://httpbin:80/status/200 -- flyway -url=jdbc:postgresql://database/test -user=test -password=test -connectRetries=60 migrate
```

## With docker-compose

```
version: '3'

services:
  database:
    image: postgres
    restart: unless-stopped
    environment:
      POSTGRES_USER: test
      POSTGRES_PASSWORD: test
      POSTGRES_DB: test
    ports:
      - 5432:5432
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "test"]
      interval: 5s
      timeout: 5s
      retries: 5
  flywait:
    image: ninjaneers/flywait:latest
    restart: on-failure
    command: ./wait-for-healthy -t 60 http://httpbin:80/status/200 -- flyway -url=jdbc:postgresql://database/test -user=test -password=test -connectRetries=60 migrate
    depends_on:
      - httpbin
    volumes:
      - ./migrations:/flyway/sql
  httpbin:
    image: kennethreitz/httpbin
    # sleep for 10 seconds to simulate slow startup
    command: sh -c 'sleep 10 && gunicorn -b 0.0.0.0:80 httpbin:app -k gevent'
    ports:
      - 80:80
```


# Docker-compose

## Build the apps

Please make sure to build the Docker images following the instructions in the project README. The images are stored in your public DockerHub so you might need to update your docker profile name.

## Source Code

First, set up [Source Code Integration](https://docs.datadoghq.com/integrations/guide/source-code-integration/?tab=github) by adding `git.commit.sha` and `git.repository_url` information when creating the Docker images.

```shell
$ cd 5-dynamic-instrumentation
$ IMAGE=hello-python-with-random-error
$ docker build --no-cache ../0-app/hello-python-random-error \
    --tag leopaillier/$IMAGE:1.0 \
    --label org.opencontainers.image.revision=$(git rev-parse HEAD) \
    --label org.opencontainers.image.source=github.com/leo-p/datadog-playground
$ docker push leopaillier/$IMAGE:1.0
```

## Start the apps

```shell
$ export DD_API_KEY=<YOUR_DD_API_KEY>
$ docker-compose up -d
$ docker-compose down -v # teardown
```

You can check the two apps are working by using the following URLs:
* Python app: [localhost:5000](http://localhost:5000/)
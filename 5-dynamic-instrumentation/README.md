# Dynamic Instrumentation

## Build the apps

Please make sure to build the Docker images following the instructions in the project README. The images are stored in your public DockerHub so you might need to update your docker profile name.

## Source Code

First, set up [Source Code Integration](https://docs.datadoghq.com/integrations/guide/source-code-integration/?tab=github) by adding `git.commit.sha` and `git.repository_url` information to the `DD_TAGS` in `docker-compose.yaml`

```shell
$ export DD_TAGS="git.commit.sha:$(git rev-parse HEAD) git.repository_url:github.com/leo-p/datadog-playground"
```

## Start the apps

```shell
$ export DD_API_KEY=<YOUR_DD_API_KEY>
$ docker-compose up -d
$ docker-compose down -v # teardown
```

You can check the two apps are working by using the following URLs:
* Python app: [localhost:5000](http://localhost:5000/)
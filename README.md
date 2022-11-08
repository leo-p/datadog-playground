# Datadog Playground

This repo serves as a playground to test out various Datadog functionalities.

## Applications

It's composed of two applications `hello-node` running with Node.js and `hello-python` running with Python.

## Use cases

So far you find:
* `0-app`: Dockerfiles and applications files
* `1-host`: Applications and agent installed diretly on the host
* `2-docker-compose`: Applications and agent deployed through `docker-compose`
* `3-kubernetes`: Applications and agent deployed through `kubernetes`
* `4-kubernetes-lib-injection`: Applications and agent deployed through `kubernetes` with the particularity that the application have not been instrumented with the tracer which is injected directly through the Datadog Admission Controller.
* `5-dynamic-instrumentation`: Todo

## Build the apps

The applications are build locally using Docker then made available on the DockerHub registry. You might want to update your username in the following commands.

```shell
# Build the node app with tracer
$ docker build --no-cache --tag hello-node ./0-app/hello-node
$ docker tag hello-node leopaillier/hello-node:1.0
$ docker push leopaillier/hello-node:1.0

# Build the node app without tracer
$ docker build --no-cache --tag hello-node-no-tracer ./0-app/hello-node-no-tracer
$ docker tag hello-node-no-tracer leopaillier/hello-node-no-tracer:1.0
$ docker push leopaillier/hello-node-no-tracer:1.0

# Build the python app with tracer
$ docker build --no-cache --tag hello-python ./0-app/hello-python
$ docker tag hello-python leopaillier/hello-python:1.0
$ docker push leopaillier/hello-python:1.0

# Build the python app without tracer
$ docker build --no-cache --tag hello-python-no-tracer ./0-app/hello-python-no-tracer
$ docker tag hello-python-no-tracer leopaillier/hello-python-no-tracer:1.0
$ docker push leopaillier/hello-python-no-tracer:1.0
```
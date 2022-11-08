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
# Build all images
$ cd docker-playground
$ for IMAGE in hello-node hello-node-no-tracer hello-python hello-python-no-tracer hello-python-random-error
$ do
$     docker build --no-cache ./0-app/$IMAGE --tag leopaillier/$IMAGE:1.0
$     docker push leopaillier/$IMAGE:1.0
$ done
```
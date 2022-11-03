# Kubernetes

## Build the apps

Please make sure to build the Docker images following the instructions in the project README. The images are stored in your public DockerHub so you might need to update your docker profile name.

## Minikube

Create a minikube cluster.
```shell
$ minikube start
```

## Deploy Datadog Agent

Then deploy the Datadog agent with helm.
```shell
$ cd 3-kubernetes
$ export DD_API_KEY=<YOUR_DD_API_KEY>
$ helm repo add datadog https://helm.datadoghq.com
$ helm repo update
$ helm install datadog-agent -f datadog-values.yaml --set datadog.site='datadoghq.com' --set datadog.apiKey=$DD_API_KEY datadog/datadog
```

## Deploy the app
```shell
$ minikube kubectl -- create namespace my-namespace
$ minikube kubectl -- apply -n my-namespace -f app.yaml
$ minikube service -n my-namespace my-service --url
```

## Check traces
Go to the Datadog [live traces](https://app.datadoghq.com/apm/traces) page and make sure traces from both your Node.js and Python apps are present.
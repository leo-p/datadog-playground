# Kubernetes Library Injection

## Build the apps

Please make sure to build the Docker images following the instructions in the project README. The images are stored in your public DockerHub so you might need to update your docker profile name.

## Minikube

Create a minikube cluster.
```shell
$ minikube start
$ minikube addons enable metrics-server
```

## Deploy Datadog Agent

Then deploy the Datadog agent with helm.
```shell
$ cd 4-kubernetes-lib-injection
$ export DD_API_KEY=<YOUR_DD_API_KEY>
$ helm repo add datadog https://helm.datadoghq.com
$ helm repo update
$ helm install datadog -f values.yaml --set datadog.site='datadoghq.com' --set datadog.apiKey=$DD_API_KEY datadog/datadog
```

## Deploy the apps

```shell
$ minikube kubectl -- apply -f app-python-lib-injection.yaml
$ minikube kubectl -- apply -f app-node-lib-injection.yaml
$ # Run each port-forward command in a new terminal
$ kubectl port-forward svc/hello-python-no-tracer 5000:5000
$ kubectl port-forward svc/hello-node-no-tracer 5001:5001
```

## Check traces

Go to the Datadog [live traces](https://app.datadoghq.com/apm/traces) page and make sure traces from both your Node.js and Python apps are present.
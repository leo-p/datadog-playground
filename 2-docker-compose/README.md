# Docker-compose

## Build the apps

Please make sure to build the Docker images following the instructions in the project README. The images are stored in your public DockerHub so you might need to update your docker profile name.

## Start the apps
```shell
$ cd 2-docker-compose
$ export DD_API_KEY=<YOUR_DD_API_KEY>
$ docker-compose up -d
$ docker-compose down -v # teardown
```

You can check the two apps are working by using the following URLs:
* Python app: [localhost:5000](http://localhost:5000/)
* Node.js app: [localhost:5001](http://localhost:5001/)

## Check traces
Go to the Datadog [live traces](https://app.datadoghq.com/apm/traces) page and make sure traces from both your Node.js and Python apps are present.
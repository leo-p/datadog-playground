# Host

## Install the agent

First, install the agent on your host following the [instructions](https://app.datadoghq.com/account/settings#agent).

## Start the Node.js app

Open a new terminal:
```shell
$ cd 0-app/hello-node
$ npm install --save dd-trace
$ DD_ENV="prod"
$ DD_LOGS_INJECTION=true
$ node app.js
```

Go to the webpage and you should see `Hello from Node.js!`.

## Start the Python app

Open a new terminal:
```shell
$ cd 0-app/hello-python
$ pip3 install ddtrace
$ pip3 install flask
$ DD_SERVICE="hello-python"
$ DD_ENV="prod"
$ DD_LOGS_INJECTION=true
$ ddtrace-run python3 app.py
```

Go to the webpage and you should see `Hello from Python!`.

## Check traces
Go to the Datadog [live traces](https://app.datadoghq.com/apm/traces) page and make sure traces from both your Node.js and Python apps are present.
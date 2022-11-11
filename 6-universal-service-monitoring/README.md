# Universal Service Monitoring

## Environment

This application is meant to be deployed on a Linux machine so we'll use the [AWS Sandbox and Terraform](https://datadoghq.atlassian.net/wiki/spaces/TS/pages/346557463/AWS+Sandbox+Account) to do that. Make sure you have configured your environment to use `tf` and `ssh_sand`.
```shell
$ tf init
$ export DD_CREATOR=<YOUR_NAME>
$ export DD_TEAM=<YOUR_TEAM>
$ export DD_PROJECT=<YOUR_PROJECT>
$ tf apply \
    -var creator="$DD_CREATOR" \
    -var team="$DD_TEAM" \
    -var project="$DD_PROJECT"
```

Then ssh into your host with `ssh_sand ubuntu@<YOUR_EC2_IP>`, make sure to be connected through AppGate. You can find it as the Terraform output.

Install `docker` and `docker-compose` on the EC2 instance.

## Start the apps

Copy the `docker-compose.yml` file to the EC2 instances then start the app
```shell
$ scp -i ~/.ssh/cake-sandbox.pem docker-compose.yml ubuntu@<YOUR_EC2_IP>:/home/ubuntu
$ ssh_sand ubuntu@<YOUR_EC2_IP>
$ export DD_API_KEY=<YOUR_DD_API_KEY>
$ docker-compose up -d
$ curl localhost:5000
Hello from Python!
$ while true; do curl localhost:5000; sleep 0.2; done
Hello from Python!Hello from Python!Hello from Python!
```
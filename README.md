# Blast-radius container setup

This Dockerfile define the necessary dependencies for Blast-Radius to work on Ubuntu 20.04 base.

It expect a mounted volume on /opt/tf with the content of a terraform plan directory previously initiated with terraform init.

To build it:
```sh
docker build -t blast-radius .
```

To run it after it is built:
```sh
docker run --mount src="$(pwd)",target=/opt/tf,type=bind -p 8888:5000 blast-radius
```

Then access port 8888 on your docker host.
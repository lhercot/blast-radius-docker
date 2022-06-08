FROM ubuntu:20.04

RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install curl gnupg2 software-properties-common lsb-core -y
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-add-repository universe
RUN apt-get update -y
RUN apt-get install terraform python3.9 python3-pip net-tools graphviz -y
RUN pip3 install --upgrade pip
RUN pip3 install blastradius graphviz
RUN pip3 install -U jinja2

# expose port 5000 to the outer world
EXPOSE 5000

ENTRYPOINT [ "blast-radius","--serve","/opt/tf"]

FROM ubuntu:16.04

MAINTAINER Cosmo (hello@cloudify.co)

RUN apt-get update

RUN apt-get -y install build-essential python-dev gcc openssl libffi-dev libssl-dev libvirt-dev python-netaddr python-pip python-virtualenv

RUN cd / && \
    virtualenv env && \
    env/bin/pip install --upgrade pip==9.0.1 && \
    env/bin/pip install --upgrade virtualenv==15.1.0 && \
    env/bin/pip install wagon==0.3.2

WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

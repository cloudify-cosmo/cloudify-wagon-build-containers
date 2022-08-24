FROM ubuntu:18.04

MAINTAINER Cosmo (hello@cloudify.co)

RUN apt-get update

RUN apt-get -y install build-essential python-dev gcc openssl libffi-dev libssl-dev libvirt-dev python-netaddr libpq-dev zlib1g-dev git

RUN  apt-get install -y python3-venv

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN cd / && \
    python3 -m venv env && \
    env/bin/pip3 install --upgrade pip==19.3.1 setuptools && \
    env/bin/pip3 install --upgrade virtualenv==15.1.0 && \
    env/bin/pip3 install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip

WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

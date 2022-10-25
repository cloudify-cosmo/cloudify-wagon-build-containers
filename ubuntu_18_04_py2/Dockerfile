FROM ubuntu:18.04

MAINTAINER Cosmo (hello@cloudify.co)

RUN apt-get update

RUN apt-get -y install build-essential python-dev gcc openssl libffi-dev libssl-dev libvirt-dev python-netaddr python-pip python-virtualenv git

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8


# patching pip
RUN curl --silent --show-error --retry 5 http://pylegacy.org/hub/get-pip-pyopenssl.py | python

RUN cd / && \
    virtualenv env && \
    env/bin/pip install --upgrade pip==9.0.1 && \
    env/bin/pip install --upgrade virtualenv==15.1.0 && \
    env/bin/pip install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip

WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

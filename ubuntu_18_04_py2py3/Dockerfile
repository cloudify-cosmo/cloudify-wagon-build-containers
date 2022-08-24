FROM ubuntu:18.04

MAINTAINER Cosmo (hello@cloudify.co)

RUN apt-get update

RUN apt-get -y install build-essential python-dev gcc openssl libffi-dev libssl-dev libvirt-dev python-netaddr curl libpq-dev zlib1g-dev wget  python-pip python-virtualenv git

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN cd / && \
    virtualenv py2env && \
    py2env/bin/pip install --upgrade pip==9.0.1 && \
    py2env/bin/pip install --upgrade virtualenv==15.1.0 && \
    py2env/bin/pip install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip

RUN  apt-get install -y python3-venv

RUN cd / && \
    python3 -m venv py3env && \
    py3env/bin/pip3 install --upgrade pip==19.3.1 setuptools && \
    py3env/bin/pip3 install --upgrade virtualenv==15.1.0 && \
    py3env/bin/pip3 install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh","py2env" ,"py3env"]

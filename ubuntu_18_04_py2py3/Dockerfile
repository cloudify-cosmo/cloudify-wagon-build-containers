FROM ubuntu:18.04

MAINTAINER Cosmo (hello@cloudify.co)

RUN apt-get update

RUN apt-get -y install build-essential python-dev gcc openssl libffi-dev libssl-dev libvirt-dev python-netaddr curl libpq-dev zlib1g-dev wget  python-pip python-virtualenv git

RUN cd / && \
    virtualenv py2env && \
    py2env/bin/pip install --no-cache-dir --upgrade pip==9.0.1 && \
    py2env/bin/pip install --no-cache-dir --upgrade virtualenv==15.1.0 && \
    py2env/bin/pip install --no-cache-dir wagon==0.11.0

RUN  apt-get install -y python3-venv

RUN cd / && \
    python3 -m venv py3env && \
    py3env/bin/pip3 install --no-cache-dir --upgrade pip==19.3.1 setuptools && \
    py3env/bin/pip3 install --no-cache-dir --upgrade virtualenv==15.1.0 && \
    py3env/bin/pip3 install --no-cache-dir wagon==0.11.0


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh","py2env" ,"py3env"]

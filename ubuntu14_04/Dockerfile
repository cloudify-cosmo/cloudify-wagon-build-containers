FROM ubuntu:14.04

MAINTAINER Cosmo (hello@cloudify.co)

RUN apt-get update

RUN apt-get -y install build-essential python-dev gcc openssl libffi-dev libssl-dev libvirt-dev python-netaddr curl

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"

RUN python get-pip.py

RUN pip install --upgrade pip==9.0.3

RUN ln -s /usr/local/bin/pip /usr/bin/pip

RUN pip install wagon==0.6.3

WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

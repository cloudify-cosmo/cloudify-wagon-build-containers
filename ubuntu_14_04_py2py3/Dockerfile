FROM ubuntu:14.04

MAINTAINER Cosmo (hello@cloudify.co)

RUN apt-get update

RUN apt-get -y install build-essential python-dev gcc openssl libffi-dev libssl-dev libvirt-dev python-netaddr curl libpq-dev zlib1g-dev wget  python-pip python-virtualenv git-all locales ca-certificates

RUN dpkg-reconfigure locales
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN cd / && \
    virtualenv py2env && \
    py2env/bin/pip install --upgrade pip==9.0.1 && \
    py2env/bin/pip install --upgrade virtualenv==15.1.0 && \
    py2env/bin/pip install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip

RUN cd /tmp && \
    wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz && \
    tar xvfz Python-3.6.0.tgz && \
    cd Python-3.6.0 && \
    ./configure --prefix=/usr/local && \
    make && \
    make altinstall


RUN cd / && \
    python3.6 -m venv py3env && \
    py3env/bin/pip3 install --upgrade pip==19.3.1 setuptools && \
    py3env/bin/pip3 install --upgrade virtualenv==15.1.0 && \
    py3env/bin/pip3 install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh","py2env" ,"py3env"]

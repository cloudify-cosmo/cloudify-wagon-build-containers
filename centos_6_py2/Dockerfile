FROM centos:centos6

MAINTAINER Cosmo (hello@cloudify.co)

RUN yum -y update && \
    yum groupinstall -y development && \
    yum install -y \
    bzip2-devel \
    git \
    hostname \
    openssl \
    openssl-devel \
    sqlite-devel \
    gcc \
    python-devel \
    libxslt-devel \
    libxml2-devel \
    openldap-devel \
    libffi-devel \
    libvirt-devel \
    python-netaddr \
    sudo \
    tar \
    wget \
    zlib-dev

RUN cd /tmp && \
    wget https://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz && \
    tar xvfz Python-2.7.5.tgz && \
    cd Python-2.7.5 && \
    ./configure --prefix=/usr/local && \
    make && \
    make altinstall

RUN cd /tmp && \
    wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-28.8.0.tar.gz && \
    tar -xvf setuptools-28.8.0.tar.gz && \
    cd setuptools-28.8.0 && \
    python2.7 setup.py install && \
    curl https://bootstrap.pypa.io/get-pip.py | python2.7

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# patching pip
RUN curl --silent --show-error --retry 5 http://pylegacy.org/hub/get-pip-pyopenssl.py | python

RUN pip install virtualenv==15.1.0
RUN cd / && \
    virtualenv env && \
    source env/bin/activate && \
    pip install --upgrade pip==9.0.1 && \
    pip install --upgrade virtualenv==15.1.0 && \
    pip install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

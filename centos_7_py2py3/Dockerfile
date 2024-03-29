FROM amd64/centos:7

MAINTAINER Cosmo (hello@cloudify.co)

RUN yum install centos-release-scl -y
RUN yum-config-manager --enable rhel-server-rhscl-7-rpms
RUN yum install python27 -y
RUN scl enable python27 bash

RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr

RUN yum install -y python-virtualenv

RUN cd / && \
    virtualenv py2env && \
    source py2env/bin/activate && \
    pip install --upgrade pip && \
    pip install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip


RUN yum -y install --enablerepo=updates python3 python3-devel

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN cd / && \
    python3 -m venv py3env && \
    source py3env/bin/activate && \
    pip3 install --upgrade pip==19.3.1 && \
    pip3 install --upgrade setuptools && \
    pip3 install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh","py2env" ,"py3env"]

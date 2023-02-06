FROM amd64/centos:7

MAINTAINER Cosmo (hello@cloudify.co)

RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr dos2unix

RUN yum update -y

RUN yum install python3-pip -y

RUN yum -y install --enablerepo=updates python3 python3-devel

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN pip3 install virtualenv==15.1.0
RUN cd / && \
    virtualenv env && \
    source env/bin/activate && \
    pip3 install --upgrade pip==19.3.1 && \
    pip3 install --upgrade virtualenv==15.1.0 && \
    pip3 install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh
# RUN dos2unix /cloudify-wagon-builder.sh && yum remove -y dos2unix && rm -rf /var/lib/apt/lists/*
RUN dos2unix /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

FROM amd64/centos:7

MAINTAINER Cosmo (hello@cloudify.co)

RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr

RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python

RUN pip install virtualenv==15.1.0
RUN cd / && \
    virtualenv env && \
    source env/bin/activate && \
    pip install --upgrade pip==9.0.1 && \
    pip install --upgrade virtualenv==15.1.0 && \
    pip install wagon==0.9


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

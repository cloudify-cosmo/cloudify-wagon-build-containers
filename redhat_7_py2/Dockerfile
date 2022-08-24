FROM registry.access.redhat.com/rhel7

MAINTAINER Cosmo (hello@cloudify.co)

ARG USERNAME

ARG PASSWORD

RUN subscription-manager register --username "$USERNAME" --password "$PASSWORD" --auto-attach

RUN yum-config-manager --enable rhel-server-rhscl-7-rpms

RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr

RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/pip/2.7/get-pip.py | python

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN pip install virtualenv==15.1.0
RUN cd / && \
    virtualenv env && \
    source env/bin/activate && \
    pip install --upgrade pip==9.0.1 && \
    pip install --upgrade virtualenv==15.1.0 && \
    pip install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip

RUN subscription-manager unregister

WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

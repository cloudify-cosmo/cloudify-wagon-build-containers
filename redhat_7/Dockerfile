FROM registry.access.redhat.com/rhel7

MAINTAINER Cosmo (hello@cloudify.co)

ARG USERNAME

ARG PASSWORD

RUN subscription-manager register --username "$USERNAME" --password "$PASSWORD" --auto-attach

RUN yum-config-manager --enable rhel-server-rhscl-7-rpms

RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"

RUN python get-pip.py

RUN pip install virtualenv

RUN cd / && \
    virtualenv env && \
    source env/bin/activate && \
    pip install --upgrade pip==9.0.1 && \
    pip install wagon==0.3.2

RUN subscription-manager unregister

WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]
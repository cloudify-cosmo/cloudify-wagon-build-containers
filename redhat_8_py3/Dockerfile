FROM registry.access.redhat.com/ubi8/ubi

MAINTAINER Cosmo (hello@cloudify.co)

ARG USERNAME

ARG PASSWORD

RUN subscription-manager register --username "$USERNAME" --password "$PASSWORD" --auto-attach

RUN yum -y install yum-utils

RUN yum-config-manager --enable ubi-8-baseos

RUN yum -y install pkgconfig

RUN yum -y install python3 python3-devel

RUN yum -y install gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel
RUN yum -y install virt-manager libvirt-libs libvirt-devel
RUN curl "https://bootstrap.pypa.io/pip/3.6/get-pip.py" -o "get-pip.py"

RUN python3 get-pip.py

RUN pip3 install virtualenv==15.1.0
RUN cd / && \
    virtualenv env && \
    source env/bin/activate && \
    pip3 install --upgrade pip==19.3.1 && \
    pip3 install --upgrade virtualenv==15.1.0 && \
    pip3 install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip


RUN subscription-manager unregister

WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

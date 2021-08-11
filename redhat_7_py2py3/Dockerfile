FROM registry.access.redhat.com/rhel7

MAINTAINER Cosmo (hello@cloudify.co)

ARG USERNAME

ARG PASSWORD

RUN subscription-manager register --username "$USERNAME" --password "$PASSWORD" --auto-attach

RUN yum-config-manager --add-repo=https://copr.fedoraproject.org/coprs/rhscl/centos-release-scl/repo/epel-7/rhscl-centos-release-scl-epel-7.repo
RUN yum install centos-release-scl -y

RUN yum-config-manager --enable rhel-server-rhscl-7-rpms
RUN yum install python27 -y
RUN scl enable python27 bash
RUN yum list python27\*

RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr

RUN yum install -y python-virtualenv

RUN cd / && \
    virtualenv py2env && \
    source py2env/bin/activate && \
    pip install --upgrade pip && \
    pip install wagon==0.11.0

RUN yum -y install python3 python3-devel

RUN cd / && \
    python3 -m venv py3env && \
    source py3env/bin/activate && \
    pip3 install --upgrade pip==19.3.1 && \
    pip3 install --upgrade setuptools && \
    pip3 install wagon==0.11.0

RUN subscription-manager unregister

WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh","py2env" ,"py3env"]

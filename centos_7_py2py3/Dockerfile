FROM amd64/centos:7

MAINTAINER Cosmo (hello@cloudify.co)

RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr

RUN yum install -y python-virtualenv

RUN cd / && \
    virtualenv py2env && \
    source py2env/bin/activate && \
    pip install --no-cache-dir --upgrade pip==9.0.1 && \
    pip install --no-cache-dir wagon==0.11.0


RUN yum -y install --enablerepo=updates python3 python3-devel

RUN cd / && \
    python3 -m venv py3env && \
    source py3env/bin/activate && \
    pip3 install --no-cache-dir --upgrade pip==19.3.1 && \
    pip3 install --no-cache-dir --upgrade setuptools && \
    pip3 install --no-cache-dir wagon==0.11.0


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh","py2env" ,"py3env"]

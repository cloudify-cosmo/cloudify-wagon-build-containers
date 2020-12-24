FROM amd64/centos:7

MAINTAINER Cosmo (hello@cloudify.co)

RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr

RUN yum -y install --enablerepo=updates python3 python3-devel

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"

RUN python3 get-pip.py

RUN pip3 install --no-cache-dir virtualenv==15.1.0
RUN cd / && \
    virtualenv env && \
    source env/bin/activate && \
    pip3 install --no-cache-dir --upgrade pip==19.3.1 && \
    pip3 install --no-cache-dir --upgrade virtualenv==15.1.0 && \
    pip3 install --no-cache-dir wagon==0.11.0


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

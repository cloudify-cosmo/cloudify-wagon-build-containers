FROM amd64/centos:7

MAINTAINER Cosmo (hello@cloudify.co)

RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr

RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python

RUN pip install virtualenv==15.1.0
RUN cd / && \
    virtualenv py2env && \
    source py2env/bin/activate && \
    pip install --upgrade pip==9.0.1 && \
    pip install --upgrade virtualenv==15.1.0 && \
    pip install git+https://github.com/cloudify-cosmo/wagon.git@add-venvs-to-pip-wheel


RUN yum -y install --enablerepo=updates python3 python3-devel

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"

RUN python3 get-pip.py

RUN pip3 install virtualenv==15.1.0
RUN cd / && \
    virtualenv py3env && \
    source py3env/bin/activate && \
    pip3 install --upgrade pip==9.0.1 && \
    pip3 install --upgrade virtualenv==15.1.0 && \
    pip3 install wagon==0.10.0


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh","py2env" ,"py3env"]

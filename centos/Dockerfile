FROM amd64/centos:latest
MAINTAINER Cosmo (hello@cloudify.co)
RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN pip install --upgrade pip==9.0.3
RUN pip install wagon==0.6.3
WORKDIR /packaging
RUN mkdir -p /workspace/build/
COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh
RUN chmod +x /cloudify-wagon-builder.sh
CMD ["/cloudify-wagon-builder.sh"]

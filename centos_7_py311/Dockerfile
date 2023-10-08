FROM amd64/centos:7

MAINTAINER Cosmo (hello@cloudify.co)

RUN yum -y install python-devel gcc openssl git libxslt-devel libxml2-devel openldap-devel libffi-devel openssl-devel libvirt-devel python-netaddr libpq-devel postgresql-devel

RUN yum update -y
RUN yum install python3-pip -y

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum -y install wget make cmake gcc bzip2-devel libffi-devel zlib-devel

RUN yum -y groupinstall "Development Tools"

RUN wget https://www.openssl.org/source/openssl-1.1.1t.tar.gz
RUN tar xvf openssl-1.1.1t.tar.gz

RUN /openssl-1.1*/config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl
RUN make -j $(nproc)
RUN make install
RUN ldconfig
RUN echo 'export  PATH=/usr/local/openssl/bin:\$PATH\n\
export  LD_LIBRARY_PATH=/usr/local/openssl/lib:\$LD_LIBRARY_PATH\n'\
 >> /etc/profile.d/openssl.sh

RUN source /etc/profile.d/openssl.sh

RUN wget https://www.python.org/ftp/python/3.11.2/Python-3.11.2.tgz
RUN tar xvf Python-3.11.2.tgz

RUN LDFLAGS="${LDFLAGS} -Wl,-rpath=/usr/local/openssl/lib" /Python-3.11*/configure --with-openssl=/usr/local/openssl 
RUN make
RUN make altinstall

RUN rm -rf /usr/bin/python
RUN rm -rf /usr/local/bin/python
RUN ln -s /usr/local/bin/python3.11 /usr/bin/python 
RUN ln -s /usr/local/bin/python3.11 /usr/local/bin/python

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11
RUN pip3.11 install virtualenv
RUN cd / && \
    python3.11 -m venv /env && \
    source /env/bin/activate && \
    pip3.11 install distro>=1.7.0 && \
    pip3.11 install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip

WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

ENV PY311=1

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

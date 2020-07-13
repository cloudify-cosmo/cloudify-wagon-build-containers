FROM ubuntu:14.04

MAINTAINER Cosmo (hello@cloudify.co)

RUN apt-get update

RUN apt-get -y install build-essential python-dev gcc openssl libffi-dev libssl-dev libvirt-dev python-netaddr curl libpq-dev zlib1g-dev wget  python-pip python-virtualenv


RUN cd / && \
    virtualenv py2env && \
    py2env/bin/pip install --upgrade pip==9.0.1 && \
    py2env/bin/pip install --upgrade setuptools && \
    py2env/bin/pip install --upgrade virtualenv==15.1.0 && \
    py2env/bin/pip install wagon==0.10.0

RUN cd /tmp && \
    wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz && \
    tar xvfz Python-3.6.0.tgz && \
    cd Python-3.6.0 && \
    ./configure --prefix=/usr/local && \
    make && \
    make altinstall

# RUN cd /tmp && \
#     wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-28.8.0.tar.gz && \
#     tar -xvf setuptools-28.8.0.tar.gz && \
#     cd setuptools-28.8.0 && \
#     python3.6 setup.py install && \
#     curl https://bootstrap.pypa.io/get-pip.py | python3.6

# RUN ln -s /usr/local/bin/pip3 /usr/bin/pip3

# RUN pip3 install virtualenv==15.1.0
RUN cd / && \
    python3.6 -m venv py3env && \
#     virtualenv py3env && \
#     /bin/bash -c "source py3env/bin/activate" && \
    py3env/bin/pip3 install --upgrade pip==9.0.1 && \
    py3env/bin/pip3 install --upgrade pip setuptools && \
    py3env/bin/pip3 install --upgrade virtualenv==15.1.0 && \
    py3env/bin/pip3 install wagon==0.10.0


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh","py2env" ,"py3env"]

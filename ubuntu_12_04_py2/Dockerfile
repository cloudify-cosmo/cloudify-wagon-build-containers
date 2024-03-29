FROM ubuntu:12.04

MAINTAINER Cosmo (hello@cloudify.co)

RUN apt-get update

RUN apt-get -y install build-essential python-dev gcc openssl libffi-dev libssl-dev libvirt-dev python-netaddr curl git locales ca-certificates


RUN curl "https://bootstrap.pypa.io/pip/2.7/get-pip.py" -o "get-pip.py"

RUN python get-pip.py --trusted-host pypi.org --trusted-host files.pythonhosted.org --trusted-host pypi.python.org

RUN ln -s /usr/local/bin/pip /usr/bin/pip

RUN dpkg-reconfigure locales
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# patching pip
RUN curl --silent --show-error --retry 5 http://pylegacy.org/hub/get-pip-pyopenssl.py | python

RUN pip install virtualenv==15.1.0
RUN cd / && \
    virtualenv env && \
    /bin/bash -c "source env/bin/activate" && \
    pip install --upgrade pip==9.0.1 && \
    pip install --upgrade virtualenv==15.1.0 && \
    pip install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip


WORKDIR /packaging

RUN mkdir -p /workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

RUN chmod +x /cloudify-wagon-builder.sh

CMD ["/cloudify-wagon-builder.sh"]

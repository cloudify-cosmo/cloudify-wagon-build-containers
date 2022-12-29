FROM registry.access.redhat.com/ubi7/python-36:1-77

MAINTAINER Cosmo (hello@cloudify.co)

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN pip3 install virtualenv==15.1.0

RUN cd /tmp && \
    virtualenv env && \
    source env/bin/activate && \
    pip3 install --upgrade pip==19.3.1 && \
    pip3 install --upgrade virtualenv==15.1.0 && \
    pip3 install https://github.com/cloudify-cosmo/wagon/archive/refs/heads/master.zip

WORKDIR /packaging

RUN mkdir -p /tmp/workspace/build/

COPY cloudify-wagon-builder.sh /cloudify-wagon-builder.sh

CMD ["bash", "/cloudify-wagon-builder.sh"]

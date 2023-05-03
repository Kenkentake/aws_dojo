FROM node:12
LABEL maintainer="Ken Takemoto"

RUN apt-get update \
    && apt-get install nano

RUN cd /opt \
    && curl -q "https://www.python.org/ftp/python/3.7.6/Python-3.7.6.tgz" -o Python-3.7.6.tgz \
    && tar -xzf Python 3.7.6.tgz \
    && cd Python-3.7.6 \
    && ./configure --enable-optimizations \
    && make install

RUN cd /opt \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

RUN npm install -g aws-cdk@1.100

#clean up unnecessary files
RUN run -rf /opt/*

# copy hands-on source code in /root/
COPY handson/ /root/handson 

ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

#ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-arm.tar.gz
#RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1

ENV DEBUG false

ADD https://github.com/zewelor/bt-mqtt-gateway/archive/master.tar.gz ./
RUN tar -xzf master.tar.gz &&\
    rm master.tar.gz
RUN mv /bt-mqtt-gateway-master /application
WORKDIR /application

#COPY ./lib /application

RUN apk add --no-cache tzdata bluez bluez-libs sudo bluez-deprecated
RUN ln -s /config/bt-mqtt-gateway.yaml ./config.yaml
RUN pip3 install --no-cache-dir -r ./requirements.txt

RUN apk add --no-cache --virtual build-dependencies git bluez-dev musl-dev make gcc glib-dev musl-dev
RUN pip3 install --no-cache-dir  `./gateway.py -r all`
RUN apk del build-dependencies

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/bin/sh", "-c", "/start.sh"]

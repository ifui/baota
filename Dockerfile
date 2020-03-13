ARG CENTOS_VERSION
FROM centos:${CENTOS_VERSION}
LABEL maintainer="ifui <ifui@foxmail.com>"

RUN groupadd -f www && useradd -g www www

ARG BAOTA_INSTALL_PATH
# install pkg
RUN yum install -y wget \
    && yum install -y ca-certificates \
    && yum install -y gd

# install baota
RUN set -eux \
    && wget -O install.sh ${BAOTA_INSTALL_PATH} \
    && echo y | sh install.sh

COPY ./DockerScript /www/DockerScript

RUN set -eux \
    && mkdir -p /www/data/usr \
    && cp -rf -p /usr/bin /www/data/usr/bin \
    && cp -rf -p /usr/local /www/data/usr/local \
    \
    && mkdir -p /www/data/etc/rc.d \
    && cp -rf -p /etc/rc.d/init.d /www/data/etc/rc.d/init.d

CMD [ "/www/DockerScript/init.sh" ]

EXPOSE 8888 80 443 20 21 22 3306 888
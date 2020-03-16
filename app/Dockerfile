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

COPY app.sh /

RUN chmod 777 /app.sh

CMD [ "/app.sh" ]

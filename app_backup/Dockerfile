FROM alpine:3.9.5
LABEL maintainer="ifui <ifui@foxmail.com>"

COPY app_backup.sh /

RUN chmod +x /app_backup.sh

CMD [ "sh", "/app_backup.sh" ]
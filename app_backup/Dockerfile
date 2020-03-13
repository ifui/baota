FROM alpine:3.9.5
LABEL maintainer="ifui <ifui@foxmail.com>"

RUN mkdir /app_backup

COPY app_backup.sh /app_backup/app_backup.sh
COPY import.sh /app_backup/import.sh
COPY export.sh /app_backup/export.sh

RUN chmod +x /app_backup/app_backup.sh \
    && chmod +x /app_backup/import.sh \
    && chmod +x /app_backup/export.sh

CMD [ "sh", "/app_backup/app_backup.sh" ]
FROM --platform=amd64 alpine:latest
WORKDIR /scripts
RUN mkdir /mnt/src && mkdir /mnt/dst
RUN apk add bash vim rclone
COPY entrypoint.sh .

ENV SRC_KEY_ID set-your-key-id-here
ENV SRC_KEY_SECRET set-your-key-secret-here
ENV SRC_REGION ru-central1
ENV SRC_ENDPOINT https://storage.yandexcloud.net
ENV SRC_BUCKET set-your-bucket-here


ENV DST_KEY_ID set-your-key-id-here
ENV DST_KEY_SECRET set-your-key-secret-here
ENV DST_REGION ru-central1
ENV DST_ENDPOINT https://storage.yandexcloud.net
ENV DST_BUCKET set-your-bucket-here

ENTRYPOINT [ "/scripts/entrypoint.sh" ]
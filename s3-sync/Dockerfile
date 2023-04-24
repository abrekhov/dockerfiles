FROM --platform=amd64 alpine:latest
WORKDIR /scripts
RUN wget https://github.com/yandex-cloud/geesefs/releases/download/v0.35.2/geesefs-linux-amd64 -O /usr/local/bin/geesefs && chmod +x /usr/local/bin/geesefs && mkdir /mnt/src && mkdir /mnt/dst
RUN apk add bash vim rclone
COPY entrypoint.sh .

ENV SRC_KEY_ID somekey
ENV SRC_KEY_SECRET somesecret
ENV SRC_REGION ru-central1
ENV SRC_ENDPOINT https://storage.yandexcloud.net
ENV SRC_BUCKET set-your-bucket-here


ENV DST_KEY_ID somekey
ENV DST_KEY_SECRET somekey
ENV DST_REGION ru-central1
ENV DST_ENDPOINT https://storage.yandexcloud.net
ENV DST_BUCKET set-your-bucket-here

ENTRYPOINT [ "/scripts/entrypoint.sh" ]

# docker run --cap-add SYS_ADMIN --device /dev/fuse
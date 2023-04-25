# s3-sync

This image takes src and dst buckets (in any cloud provider) and synchronize them with rclone.

## Usage

```bash

docker run --rm -ti \
    -e SRC_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e SRC_KEY_SECRET=$AWS_SECRET_ACCESS_KEY \
    -e SRC_ENDPOINT=$SRC_ENDPOINT \
    -e SRC_REGION=$SRC_REGION \
    -e SRC_BUCKET=src-bucket-name \
    -e DST_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e DST_KEY_SECRET=$AWS_SECRET_ACCESS_KEY \
    -e DST_ENDPOINT=$DST_ENDPOINT \
    -e DST_REGION=$DST_REGION \
    -e DST_BUCKET=dst-bucket-name \
    abrekhov/s3-sync:rclone 
```

|ENV KEY|DEFAULT VALUE|
|---|---|
|SRC_ENDPOINT|storage.yandexcloud.net|
|SRC_REGION|storage.yandexcloud.net|
|DST_ENDPOINT|storage.yandexcloud.net|
|DST_REGION|storage.yandexcloud.net|

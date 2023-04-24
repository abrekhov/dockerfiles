#!/bin/bash

export

mkdir -p ~/.config/rclone
cat > ~/.config/rclone/rclone.conf <<EOF
[src]
type = s3
provider = Minio
access_key_id=$SRC_KEY_ID
secret_access_key=$SRC_KEY_SECRET
region = $SRC_REGION
endpoint = $SRC_ENDPOINT
location_constraint =
server_side_encryption =
[dst]
type = s3
provider = Minio
access_key_id=$DST_KEY_ID
secret_access_key=$DST_KEY_SECRET
region = $DST_REGION
endpoint = $DST_ENDPOINT
location_constraint =
server_side_encryption =
EOF


# geesefs --debug \
#     --region $SRC_REGION \
#     --profile=src \
#     --list-type 2 \
#     $SRC_BUCKET /mnt/src/

# geesefs --debug \
#     --region $DST_REGION \
#     --profile=src \
#     --list-type 2 \
#     $DST_BUCKET /mnt/dst/

# rsync -auv --omit-dir-times /mnt/src/ /mnt/dst
rclone sync src:$SRC_BUCKET dst:$DST_BUCKET
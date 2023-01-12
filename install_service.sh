#!/bin/env bash

CURRENT_DIR=$(cd $(dirname $0); pwd)

# give execution permission
chmod +x ${CURRENT_DIR}/filedownload
chmod +x ${CURRENT_DIR}/run.sh

# render place holders. We should use | instead of / as the delimiter, because the the path contains /
sed -i "s|\[\[PROJECTPATH\]\]|${CURRENT_DIR}|g" ${CURRENT_DIR}/filedownload.service

# install the service
cp -f ${CURRENT_DIR}/filedownload.service /usr/lib/systemd/system/filedownload.service
systemctl daemon-reload
systemctl enable filedownload
systemctl start filedownload
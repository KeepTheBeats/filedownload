#!/bin/env bash

systemctl stop filedownload
systemctl disable filedownload
rm /usr/lib/systemd/system/filedownload.service
systemctl daemon-reload
systemctl reset-failed
#!/usr/bin/env bash

set -e
set -x

username=$1
password=$2
remote_path=$3

cmd.exe /c C:/flutter-beta/bin/flutter.bat build web --release
ncftpput -R -v -u "${username}" -p "${password}" ftp.alkebuware.com "${remote_path}" build/web/*

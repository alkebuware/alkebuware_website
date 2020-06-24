#!/usr/bin/env bash

set -e
set -x

cmd.exe /c C:/flutter-beta/bin/flutter.bat build web --release
ncftpput -R -v -u "robot@staging.alkebuware.com" -p 'NEI}!0%%qbT!' ftp.alkebuware.com public_html/staging build/web/*

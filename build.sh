#!/bin/bash

go get -u -v github.com/xtaci/kcptun/client@v20191105
go get -u -v github.com/xtaci/kcptun/server@v20191105

VERSION=`date -u +%Y%m%d`
LDFLAGS="-X main.VERSION=$VERSION -s -w"
GCFLAGS=""

env CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -ldflags "$LDFLAGS" -gcflags "$GCFLAGS" -o client_linux_arm$v  github.com/xtaci/kcptun/client
env CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -ldflags "$LDFLAGS" -gcflags "$GCFLAGS" -o server_linux_arm$v  github.com/xtaci/kcptun/server

tar -zcf kcptun-linux-arm7-$VERSION.tar.gz client_linux_arm7 server_linux_arm7

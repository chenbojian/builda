#!/bin/bash

go get github.com/xtaci/kcptun/client
go get github.com/xtaci/kcptun/server

VERSION=`date -u +%Y%m%d`
LDFLAGS="-X main.VERSION=$VERSION -s -w"
GCFLAGS=""

env CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -ldflags "$LDFLAGS" -gcflags "$GCFLAGS" -o client_linux_arm$v  github.com/xtaci/kcptun/client
env CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -ldflags "$LDFLAGS" -gcflags "$GCFLAGS" -o server_linux_arm$v  github.com/xtaci/kcptun/server

tar -zcf kcptun-linux-arm7-$VERSION.tar.gz client_linux_arm7 server_linux_arm7

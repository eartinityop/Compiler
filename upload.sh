#!/bin/bash
compress() {
time tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1 ccache 1
}
echo "Compressing New CCACHE"
compress

uccache() {
cd /tmp/ccache
curl -sL https://git.io/file-transfer | sh
./transfer wet ccache.tar.gz
}
echo "Uploading CCACHE"
uccache

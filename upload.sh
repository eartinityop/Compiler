#!/bin/bash
rccache() {
cd /tmp
rm ccache.tar.gz
}
echo "Removing Old CCACHE"
rccache

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

rom_upload() {
cd ~/
curl --upload-file .$OUTPUT https://free.keep.sh > link0.txt && cat link0.txt
curl --upload-file .$OUTPUT https://free.keep.sh > link1.txt && cat link1.txt
}
echo "Uploading Rom & Boot From /Out"
rom_upload

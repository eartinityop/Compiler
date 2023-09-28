/bin/bash
chk() {
df -h
free -h
lscpu
}
echo "Checking System Configuration"
chk

sync() {
repo init --depth=1 --no-repo-verify -u $MANIFEST
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle -j$(nproc --all)
git clone $LOCAL_MANIFEST .repo/local_manifests
}
echo "Syncing Rom & Device Sources"
sync

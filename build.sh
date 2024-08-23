#!/bin/bash

rm -rf .repo/local_manifests/



# Initialize local repository
repo init -u https://github.com/CipherOS/android_manifest -b fourteen-qpr --git-lfs

# repo sync
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Jayzee-Zee/Local-Manifest -b Voltage-14 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=Jayzee-Zee
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch 
lunch lineage_earthap2a-userdebug
make installclean
mka bacon
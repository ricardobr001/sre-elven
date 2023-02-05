#!/bin/bash

set -e

echo export default \"$REACT_APP_API_ENDPOINT\" > ./src/services/config.ts

rm android/app/build/outputs/apk/release/app-* || true
rm android/app/build/outputs/apk/debug/app-* || true

cd android
./gradlew assembleRelease
cp ./app/build/outputs/apk/release/app-release.apk /usr/src/app/gobarber.apk

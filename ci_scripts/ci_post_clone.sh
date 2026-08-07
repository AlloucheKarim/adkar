#!/bin/sh

set -e

echo "===== Flutter Version ====="

if command -v flutter >/dev/null 2>&1; then
    flutter --version
else
    echo "Flutter n'est pas installé sur cette image."
    exit 1
fi

echo "===== Flutter Pub Get ====="

flutter pub get

echo "===== CocoaPods ====="

cd ios

pod install

cd ..
#!/bin/sh

set -e

brew install cocoapods

git clone https://github.com/flutter/flutter.git --depth 1

export PATH="$PATH:`pwd`/flutter/bin"

flutter precache --ios

flutter pub get

cd ios

pod install

cd ..
#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "===== Xcode Cloud ci_post_clone.sh Started ====="

# Navigate to project root directory containing pubspec.yaml
if [ -n "$CI_PRIMARY_REPOSITORY_PATH" ]; then
    cd "$CI_PRIMARY_REPOSITORY_PATH"
else
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    cd "$SCRIPT_DIR/.."
    if [ ! -f "pubspec.yaml" ] && [ -f "../pubspec.yaml" ]; then
        cd ..
    fi
fi

echo "Current Directory: $(pwd)"

# 1. Setup Flutter SDK
FLUTTER_DIR="$HOME/flutter"
if ! command -v flutter >/dev/null 2>&1; then
    if [ ! -d "$FLUTTER_DIR" ]; then
        echo "Cloning Flutter SDK (stable)..."
        git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$FLUTTER_DIR"
    fi
    export PATH="$PATH:$FLUTTER_DIR/bin"
fi

flutter --version

# 2. Precache iOS engine binaries
echo "===== 2. Precache iOS Binaries ====="
flutter precache --ios

# 3. Fetch Flutter packages
echo "===== 3. Fetch Flutter Packages ====="
flutter pub get

# 4. Generate iOS Ephemeral & Swift Package Files
echo "===== 4. Generate iOS Ephemeral & Swift Package Files ====="
flutter build ios --release --no-codesign

echo "===== Xcode Cloud Post-Clone Setup Complete ====="

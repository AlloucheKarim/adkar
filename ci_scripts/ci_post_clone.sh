#!/bin/bash

# Exit on command failure
set -e

# Navigate to project root directory
if [ -n "$CI_PRIMARY_REPOSITORY_PATH" ]; then
    cd "$CI_PRIMARY_REPOSITORY_PATH"
else
    cd "$(dirname "$0")/.."
fi

echo "===== 1. Setup Flutter SDK ====="
FLUTTER_DIR="$HOME/flutter"

if ! command -v flutter >/dev/null 2>&1; then
    if [ ! -d "$FLUTTER_DIR" ]; then
        echo "Cloning Flutter SDK (stable)..."
        git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$FLUTTER_DIR"
    fi
    export PATH="$PATH:$FLUTTER_DIR/bin"
fi

flutter --version

echo "===== 2. Precache iOS Binaries ====="
flutter precache --ios

echo "===== 3. Fetch Flutter Packages ====="
flutter pub get

echo "===== 4. Generate iOS Ephemeral & Swift Package Files ====="
flutter build ios --config-only

echo "===== Xcode Cloud Post-Clone Setup Complete ====="
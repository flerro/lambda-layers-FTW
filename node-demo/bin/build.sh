#!/bin/sh

cd $(dirname $(dirname $0))

BASE=`pwd`
BUILD_DIR="$BASE/build"

[ -d "$BUILD_DIR" ] || mkdir "$BUILD_DIR"

# Create code artifacts
cd "$BASE/src"

echo "Creating Lambda code artifact 1..."
zip -r9 "$BUILD_DIR/code-bikemi.zip" lambda_bikemi.js

echo "Creating Lambda code artifact 2..."
zip -r9 "$BUILD_DIR/code-mobike.zip" lambda_mobike.js

# Create layer artifact
echo "Building layer artifact..."

TMP=$(mktemp -d "$BASE/build/deployXXX")
NODE_LAYER_MODULES="$TMP/nodejs/node_modules"
mkdir -p "$NODE_LAYER_MODULES"
cp "$BASE/src/bikemi.js" "$BASE/src/mobike.js" "$NODE_LAYER_MODULES"
cd "$TMP" 
zip -r9 "$BUILD_DIR/layer.zip" .

cd "$BASE"
rm -rf "$TMP"


#!/bin/sh

cd $(dirname $(dirname $0))

BASE=`pwd`
BUILD_DIR="$BASE/build"
LIB_DIR="$BASE/venv/lib/python3.6/site-packages"

[ -d "$BUILD_DIR" ] || mkdir "$BUILD_DIR"

# Create code deploy artifact 
cd "$BASE/src"
zip "$BUILD_DIR/code.zip" wc.py

# Create layer artifact
TMP=$(mktemp -d "$BASE/build/deployXXX")

mkdir -p "$TMP/python"
rsync -a "$LIB_DIR/" "$TMP/python/"

cd "$TMP"
zip -r9 "$BUILD_DIR/layer.zip" .
rm -rf "$TMP"


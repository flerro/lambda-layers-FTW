#!/bin/sh

cd $(dirname $(dirname $0))

BASE=`pwd`
VENV_DIR="$BASE/venv"

[ -d "$VENV_DIR" ] || mkdir "$VENV_DIR"

cd $BASE
virtualenv venv
source venv/bin
pip install -r requirements.txt


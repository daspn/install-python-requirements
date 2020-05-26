#!/bin/bash
set -eu

INSTALL_DIR="$1/$3"
REQUIREMENTS_FILE_PATH="$2"

mkdir -p $INSTALL_DIR
cd $INSTALL_DIR

python -m venv .venv
source .venv/bin/activate

pip install -r $REQUIREMENTS_FILE_PATH -t $INSTALL_DIR

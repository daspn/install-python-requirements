#!/bin/bash
set -eu

echo "1: $1"
echo "2: $2"
echo "3: $3"

INSTALL_DIR="$1/$3"
REQUIREMENTS_FILE_PATH="$2"

echo "INSTALL_DIR: $INSTALL_DIR"
echo "REQUIREMENTS_FILE_PATH: $REQUIREMENTS_FILE_PATH"

mkdir -p $INSTALL_DIR
cd $INSTALL_DIR

python -m venv .venv
source .venv/bin/activate

pip install -r $REQUIREMENTS_FILE_PATH -t $INSTALL_DIR

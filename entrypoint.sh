#!/bin/sh -l

PYTHON_VERSION=$1
REQUIREMENTS_FILE_PATH=$2
INSTALL_DIR=$3

cd /docker-action
echo "creating docker image with Python version: $PYTHON_VERSION"

docker build -t docker-action --build-arg python_version="$PYTHON_VERSION" --build-arg workspace="$GITHUB_WORKSPACE" --build-arg requirements_file_path="$REQUIREMENTS_FILE_PATH" --build-arg install_dir="$INSTALL_DIR" .
docker run docker-action

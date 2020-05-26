#!/bin/sh -l

PYTHON_VERSION=$1
REQUIREMENTS_FILE_PATH=$2
INSTALL_DIR=$3

cd /docker-action
echo "creating docker image with Python version: $PYTHON_VERSION"

echo listing /github/workspace
ls /github/workspace

echo listing curdir
ls .

echo "GITHUB_WORKSPACE is $GITHUB_WORKSPACE"

docker build -t docker-action --build-arg python_version="$PYTHON_VERSION" --build-arg workspace="$GITHUB_WORKSPACE" --build-arg requirements_file_path="$REQUIREMENTS_FILE_PATH" --build-arg install_dir="$INSTALL_DIR" .
docker run -v /github/workspace:/github/workspace docker-action

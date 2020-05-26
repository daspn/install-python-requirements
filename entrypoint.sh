#!/bin/sh -l

PYTHON_VERSION=$1
REQUIREMENTS_FILE_PATH="$GITHUB_WORKSPACE/$2"
INSTALL_DIR="$GITHUB_WORKSPACE/$3"

echo "python version: $PYTHON_VERSION"
echo "requirements file: $REQUIREMENTS_FILE_PATH"
echo "install dir: $INSTALL_DIR"

CONTAINER_NAME="c-$(date +%Y%m%d%H%M%S)"

docker build --file docker-action/Dockerfile --force-rm --build-arg python_version="$PYTHON_VERSION" --build-arg requirements_file_path="$REQUIREMENTS_FILE_PATH" -t python-requirements .
docker create -ti --name $CONTAINER_NAME python-requirements bash

mkdir -p $INSTALL_DIR
docker cp $CONTAINER_NAME:/python $INSTALL_DIR
docker rm -f $CONTAINER_NAME
docker rmi python-requirements

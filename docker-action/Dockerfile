# Container image that runs your code
ARG python_version
FROM python:${python_version}

ARG workspace
ARG requirements_file_path
ARG install_dir

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh", "/ws", "requirements/base.txt", "deployment/lambda/layers"]

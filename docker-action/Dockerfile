ARG python_version
FROM python:${python_version}-slim-buster

ARG requirements_file_path

WORKDIR /python
COPY ${requirements_file_path} /python/requirements.txt

RUN pip install -r requirements.txt -t .

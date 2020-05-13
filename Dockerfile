#FROM ubuntu:18.04
FROM python:3.8-slim

## Conda setup
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local

RUN pip install vibora[fast]

ENV PATH /opt/conda/bin:$PATH

##Setup
ENV PORT 5000
EXPOSE ${PORT}

COPY vibora_server.py .

ENV PATH /root/.local/bin:$PATH

ENTRYPOINT ["/bin/sh", "-c", "python vibora_server.py ${PORT}"]


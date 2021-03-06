FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y \
    git \
    libfreetype6-dev \
    mpich \
    pkg-config \
    python3-pip \
    python3-tk \
    && pip3 install -U pip \
    && pip3 install \
    git+https://github.com/IntelPNI/brainiak \
    nibabel \
    nilearn

RUN mkdir -p /code

RUN mkdir /oasis
RUN mkdir /projects
RUN mkdir /scratch
RUN mkdir /local-scratch
COPY run.py /code/run.py

ENTRYPOINT ["/code/run.py"]

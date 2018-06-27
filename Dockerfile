FROM jupyter/scipy-notebook:1af3089901bb

ARG JUPYTERHUB_VERSION=0.8.1

# Install gfortran for fortranmagic example.
USER root
RUN apt-get update && \
    apt-get install -y libatlas-base-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install notebook reqs.
USER $NB_UID
COPY requirements.txt requirements.txt
RUN pip install numpy -c requirements.txt
RUN pip install -r requirements.txt -c requirements.txt
RUN jupyter nbextension install rise --py --sys-prefix
RUN jupyter nbextension enable rise --py --sys-prefix

COPY notebooks/Main.ipynb Main.ipynb

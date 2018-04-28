#!/bin/bash

venv_location="venv"

if [ ! -d $venv_location ];
then
    echo "Creating virtualenv at $venv_location."
    python3 -m virtualenv $venv_location
fi

source "$venv_location/bin/activate"
pip install numpy -c requirements.txt
pip install -r requirements.txt -c requirements.txt

export JUPYTER_CONFIG_DIR=config

jupyter nbextension install rise --py --sys-prefix
jupyter nbextension enable rise --py --sys-prefix
jupyter notebook notebooks/Main.ipynb --NotebookApp.token='' --NotebookApp.password=''

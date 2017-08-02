#!/bin/bash

venv_location="venv"

if [ ! -d $venv_location ];
then
    echo "Creating virtualenv at $venv_location."
    python3 -m virtualenv $venv_location
fi

source "$venv_location/bin/activate"

pip install -r requirements.txt

export JUPYTER_CONFIG_DIR=config

jupyter nbconvert notebooks/Main.ipynb --to slides --post serve&
SLIDES_PID=$!

# Give the notebook some time to come up.
sleep 3
docker run --rm --net=host -v `pwd`:/slides astefanutti/decktape http://localhost:8000 slides.pdf

kill $SLIDES_PID

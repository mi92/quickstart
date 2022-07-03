#!/usr/bin/env bash
#
# Line above ensures that the current 'active' bash version is used. In
# some cases, this might differ from the version that usually exists in
# `/bin/bash`.

# Stops execution of the script if one command fails. This also has some
# drawbacks, but it should ensure that the script does not create broken
# installations.
set -e

project_name=${1:-myproject}    
python_version=${2:-3.9.5}
packages=${3:-"numpy pandas scikit-learn matplotlib"}
# note: if you don't install jupyter this may cause errors when trying to open a notebook!

mkdir -p "${project_name}"
cd "${project_name}"

# 1. Setting up python version using pyenv 
if pyenv versions | grep -q $python_version; then
    echo "Python version "${python_version}" found, loading it.."
else
    echo "Python version "${python_version}" not found, installing it.."
    pyenv install "${python_version}"
fi
 
pyenv local "${python_version}"
pyenv shell "${python_version}"

# 2. Setting up the poetry environment 
yes "" | poetry init

poetry add ${packages[*]}

# Adding jupyter dev dependency:
poetry add -D jupyter

# 3. Installing the ipython kernel for jupyter:
poetry run python -m ipykernel install --user --name "${project_name}" --display-name "Python (${project_name})"

# 4. Launching jupyter notebook:
poetry run jupyter notebook 

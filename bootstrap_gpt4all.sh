#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

wget --no-check-certificate https://gpt4all.io/installers/gpt4all-installer-linux.run
chmod +x gpt4all-installer-linux.run
sudo -u vagrant ./gpt4all-installer-linux.run -q install
# prepare python environment
python3 -m venv gpt4all-env
source gpt4all-env/bin/activate
pip install gpt4all



#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e
apt install -y pipx
pipx ensurepath --global
pipx install jupyterlab
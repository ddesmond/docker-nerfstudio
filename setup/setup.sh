#!/bin/bash

# start
pip install nerfstudio
ns-install-cli
pip install -e .[dev]
pip install -e .[docs]
ns-install-cli
# end
rm -rf /.nerfstudio-init
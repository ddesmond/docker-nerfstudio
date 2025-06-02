#!/bin/bash

# start
uv pip install nerfstudio
ns-install-cli
uv pip install -e .[dev]
uv pip install -e .[docs]
ns-install-cli
# end
rm -rf /.nerfstudio-init
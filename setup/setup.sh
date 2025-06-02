#!/bin/bash

# start
uv pip install nerfstudio --system
ns-install-cli
uv pip install -e .[dev] --system
uv pip install -e .[docs] --system
ns-install-cli
# end
rm -rf /.nerfstudio-init
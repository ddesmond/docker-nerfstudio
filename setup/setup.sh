#!/bin/bash

# start
pip install nerfstudio
ns-install-cli
pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch

# end
rm -rf /.nerfstudio-init
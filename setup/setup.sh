#!/bin/bash

# start
pip install nerfstudio
ns-install-cli

export PATH=/usr/local/cuda-12/bin:$PATH

pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch

# end
rm -rf /setup/.nerfstudio-init
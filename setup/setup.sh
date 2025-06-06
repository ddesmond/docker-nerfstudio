#!/bin/bash

# start
conda init
conda create --name nerfstudio -y python=3.10
conda activate nerfstudio
python -m pip install --upgrade pip

conda install -c "nvidia/label/cuda-11.8.0" cuda-toolkit
export TCNN_CUDA_ARCHITECTURES=86
pip install torch==2.1.2+cu118 torchvision==0.16.2+cu118 --extra-index-url https://download.pytorch.org/whl/cu118

pip install ninja git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch

pip install nerfstudio

ns-install-cli

# cleanup
conda clean --all --yes
# end
rm -rf /setup/.nerfstudio-init
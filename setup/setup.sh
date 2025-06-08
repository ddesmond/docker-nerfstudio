#!/bin/bash

# start
echo "installing nerfstudio"

echo " setup gradio webui folder"
cd /opt/ && git clone https://github.com/nerfstudio-project/nerfstudio-webui.git
cd nerfstudio-webui

#
echo " setup conda "
conda create --name nerfstudio
conda activate nerfstudio

#
conda install -c "nvidia/label/cuda-11.8.0" cuda-toolkit

export TCNN_CUDA_ARCHITECTURES=86
pip install torch==2.1.2+cu118 torchvision==0.16.2+cu118 --extra-index-url https://download.pytorch.org/whl/cu118

pip install ninja git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch

pip install nerfstudio

ns-install-cli

# install gradio

#!/bin/bash
echo " pip installing gradio / traitlets "
pip install gradio traitlets

# end
rm -rf /setup/.nerfstudio-init

updatedb
locate nvcc
#!/bin/bash

# start
echo "installing nerfstudio"

#
pip uninstall torch torchvision functorch tinycudann

echo " setup gradio webui folder"
cd /opt/ && git clone https://github.com/nerfstudio-project/nerfstudio-webui.git
cd nerfstudio-webui

#
echo " setup conda "
#conda create --name nerfstudio
#conda activate nerfstudio

export TCNN_CUDA_ARCHITECTURES=86

#
conda install -c "nvidia/label/cuda-11.8.0" cuda-toolkit -y

pip uninstall numpy -y

pip install numpy==1.26.4

dnf install busybox which g++ -y


conda install pytorch torchvision cudatoolkit=11.8 -c pytorch

export CUDA_HOME=$CONDA_PREFIX

pip install nerfstudio

ns-install-cli
# install gradio

#!/bin/bash
pip uninstall numpy -y
pip install numpy==1.26.4

echo " pip installing gradio / traitlets "
pip install gradio==4.44.1 traitlets


conda install -c conda-forge colmap -y
conda install -c conda-forge glomap -y

# end
rm -rf /setup/.nerfstudio-init

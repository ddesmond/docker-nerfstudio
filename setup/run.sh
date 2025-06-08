#!/bin/bash
conda init bash
conda activate nerfstudio
echo "___ START GRADIO API ___"
cd /opt/nerfstudio-webui
python webui.py
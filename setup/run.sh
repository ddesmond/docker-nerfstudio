#!/bin/bash
conda init
conda activate nerfstudio
echo "___ START GRADIO API ___"
cd /opt/nerfstudio-webui
python webui.py
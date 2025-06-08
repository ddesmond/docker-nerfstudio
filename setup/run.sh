#!/bin/bash

echo "___ START GRADIO API ___"


cd /opt/nerfstudio-webui

conda init

conda activate nerfstudio

python webui.py
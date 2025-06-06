#!/bin/bash

dnf update -y
dnf upgrade --refresh -y

dnf install -y dnf-plugins-core
dnf config-manager --set-enabled crb
dnf install -y epel-release

dnf update -y

dnf install -y \
    nano zip \
    git git-lfs wget curl mlocate --allowerasing

dnf install -y \
    mesa-libGLU

updatedb
locate git | grep bin
/usr/bin/git lfs install
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

dnf install  -y \
  make gcc patch zlib-devel bzip2 bzip2-devel \
  readline-devel sqlite sqlite-devel openssl-devel \
  tk-devel libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2

# add cuda nvcc
dnf install -y \
  cuda-nvcc-12* \
  nvidia-cuda-toolkit \
  mesa-libGLU \
  libglvnd-glx

updatedb
locate git | grep bin
/usr/bin/git lfs install
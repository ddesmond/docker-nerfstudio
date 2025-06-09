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
    gcc \
    mesa-libGLU

/usr/bin/git lfs install


# ffmpeg gradio
dnf install -y --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm
dnf install -y --nogpgcheck https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm

dnf makecache

dnf install -y ffmpeg ffmpeg-devel

dnf install busybox which g++ -y

updatedb

# syntax=docker/dockerfile:1
FROM nvidia/cuda:12.3.2-runtime-rockylinux9
ENV TZ=Europe/Zagreb

WORKDIR /setup
COPY ./setup /setup
RUN chmod +x /setup/*.sh

# Deps
RUN bash /setup/deps.sh


ENV HOME=/root \
    PATH=/root/.local/bin:/root/miniconda3/bin:$PATH

# conda
RUN mkdir -p ~/miniconda3 && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh && \
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3  && \
    rm ~/miniconda3/miniconda.sh && \
    echo "Conda installed" && \
    updatedb && \
    locate conda && \
    conda -h && \
    conda install -c conda-forge python=3.10


# Install nerfstudio and gradio
RUN bash /setup/setup.sh

# Bash as default entrypoint.
CMD ["bash","/setup/startup.sh"]
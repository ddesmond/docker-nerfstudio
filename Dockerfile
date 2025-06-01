# syntax=docker/dockerfile:1
FROM nvidia/cuda:12.6.3-runtime-rockylinux9
ENV TZ=Europe/Zagreb

WORKDIR /setup
COPY ./setup /setup
RUN chmod +x /setup/*.sh

# Deps
RUN bash /setup/deps.sh


ENV HOME=/root \
    PATH=/root/.local/bin:$PATH

# Pyenv
RUN curl https://pyenv.run | bash
ENV PATH=$HOME/.pyenv/shims:$HOME/.pyenv/bin:$PATH

ARG PYTHON_VERSION=3.10.12

# Python
RUN pyenv install $PYTHON_VERSION && \
    pyenv global $PYTHON_VERSION && \
    pyenv rehash && \
    pip install --no-cache-dir --upgrade pip setuptools wheel


# Install nerfstudio cli auto completion
RUN /bin/bash -c 'ns-install-cli --mode install'

# Bash as default entrypoint.
CMD /bin/bash -l
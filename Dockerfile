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



# Install nerfstudio cli auto completion
RUN /bin/bash -c 'ns-install-cli --mode install'

# Bash as default entrypoint.
CMD /bin/bash -l
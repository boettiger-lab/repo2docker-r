FROM quay.io/jupyter/minimal-notebook

USER root

# Install R
RUN curl -s https://raw.githubusercontent.com/boettiger-lab/repo2docker-r/refs/heads/main/install_r.sh | bash

## RStudio
RUN conda install jupyter-rsession-proxy
RUN curl -s https://raw.githubusercontent.com/boettiger-lab/repo2docker-r/refs/heads/main/install_r.sh | bash

COPY environment.yml environment.yml
RUN conda env update -f environment.yml

COPY install.r install.r
RUN Rscript install.r

USER ${NB_USER}


# Choose any ubuntu-based Jupyter image, e.g.:
FROM quay.io/jupyter/minimal-notebook

# Install R, RStudio on any Ubuntu LTS
USER root
RUN curl -s https://raw.githubusercontent.com/boettiger-lab/repo2docker-r/refs/heads/main/install_r.sh | bash
RUN curl -s https://raw.githubusercontent.com/boettiger-lab/repo2docker-r/refs/heads/main/install_rstudio.sh | bash

# When run as root, install.r automagically handles any necessary apt-gets
COPY install.r install.r
RUN Rscript install.r

USER ${NB_USER}
COPY environment.yml environment.yml
RUN conda env update -f environment.yml

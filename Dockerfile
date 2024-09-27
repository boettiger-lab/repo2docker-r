FROM quay.io/jupyter/minimal-notebook

USER root

# Install R
COPY install_r.sh install_r.sh
RUN bash install_r.sh

## RStudio
RUN conda install jupyter-rsession-proxy
COPY install_rstudio.sh install_rstudio.sh
RUN bash install_rstudio.sh

COPY environment.yml environment.yml
RUN conda env update -f environment.yml

COPY install.r install.r
RUN Rscript install.R

USER ${NB_USER}


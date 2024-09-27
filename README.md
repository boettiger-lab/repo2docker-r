# repo2docker-r

JupyterHub-based repo2docker template for R.  

- Edit `install.r` to install your R packages.
- Edit `environment.yml` to install Python packages.

Provides JupyterHub with RStudio integration.  `install.r` uses `r2u` mechanism to automatically install any necessary system dependencies. `apt-get` is not necessary.


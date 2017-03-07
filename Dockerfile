# Source of original Dockerfile: https://github.com/jupyterhub/dockerspawner/

# Build as jupyterhub/singleuser
# Run with the DockerSpawner in JupyterHub

FROM jupyter/scipy-notebook

MAINTAINER Project Jupyter <jupyter@googlegroups.com>

EXPOSE 8888

USER root
# fetch juptyerhub-singleuser entrypoint
RUN wget -q https://raw.githubusercontent.com/jupyterhub/jupyterhub/0.6.1/scripts/jupyterhub-singleuser -O /usr/local/bin/jupyterhub-singleuser && \
    chmod 755 /usr/local/bin/jupyterhub-singleuser

ADD singleuser.sh /srv/singleuser/singleuser.sh

# Add Files/Scripts/Commands as per your requirements
# Files added to the directory `/home/jovyan/work` show up in User's container,
# and are accessible to them via Jupyter
ADD test_notebook.ipynb /home/jovyan/work/test_notebook.ipynb

USER jovyan
RUN sh /srv/singleuser/singleuser.sh -h
CMD ["sh", "/srv/singleuser/singleuser.sh"]

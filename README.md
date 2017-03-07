# Europa

Notes for setting up JupyterHub on localhost/server with custom authentication, and using Dockerspawner to provide each user with a separate container.

## Things Covered

- [x] Setup JupyterHub
- [x] Add Custom Authentication
- [x] Provide a pre-built test notebook (read-only) to each user
- [x] Provide a separate Docker container to each user
- [ ] Integrate Docker Swarm

## Initial Setup

To run JupyterHub locally, you can use Vagrant. Simply running `vagrant up --provision` shall setup the base box, and provision it. After which you can move to installing Docker.

To setup on a server, run `provision.sh`. After that install docker.


### Install Docker

[Docker Documentation for Installation]


### Prepare Docker Image

After that, you can either:
- Pull the docker image for jupyter via: `docker pull jupyterhub/singleuser:latest`
- Clone the [Dockerspawner] repo & modify their Dockerfile & support scripts

We've taken Dockerspawner's Dockerfile and updated it to include the a sample notebook inside the container. This notebook shall be a read-only notebook, and shall be accessible to every user in their respective container. Similarly, files can be added

## Running Jupyterhub

Navigate to the project directory as `root` user, and start Jupyterhub by running:

`
jupyterhub -f PROJECT_PATH/jupyterhub_config.py
`

## Credits

Sincere thanks to all the contributors of Project Jupyter & JupyterHub, and all the people who documented their use cases & deployment notes for JupyerHub


## Resources

- [JupyterHub Docs]
- [JupyterHub - Github]
- [JupyterHub - Dockerspawner]
- [JupyterHub Tutorial]: I highly recommend going through this, along with the accompanying video
- [JupyterHub: Deploying Jupyter Notebooks for students and researchers] `[VIDEO]`
- [JupyterHub-Swarm]: Running JupyterHub with Docker Swarm


[Docker Documentation for Installation]: <https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository>
[Dockerspawner]: <https://github.com/jupyterhub/dockerspawner>
[JupyterHub Docs]: <http://jupyterhub.readthedocs.io/en/latest/>
[JupyterHub - Dockerspawner]: <https://github.com/jupyterhub/dockerspawner/>
[JupyterHub - Github]: <https://github.com/jupyterhub/jupyterhub/>
[JupyterHub: Deploying Jupyter Notebooks for students and researchers]: <https://www.youtube.com/watch?v=gSVvxOchT8Y&t=3067s>
[JupyterHub Tutorial]: <https://github.com/minrk/jupyterhub-pydata-2016>
[JupyterHub-Swarm]: <https://github.com/minrk/jupyterhub-swarm>

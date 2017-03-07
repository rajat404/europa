# Configuration file for jupyterhub.

from jupyterhub.auth import Authenticator
from tornado import gen, web

import netifaces
from dockerspawner import DockerSpawner


class CustomAuthenticator(Authenticator):

    @gen.coroutine
    def authenticate(self, handler, data):
        username = data.get('username')
        password = data.get('password')
        print('*'*50, username)

        # Add Auth Logic here
        # This is merely an example. DONOT do this in production
        if username == 'user' and password == 'pass':
            raise web.HTTPError(401)
        else:
            return username

# set of users who can administer the Hub itself
c.Authenticator.admin_users = {'user'}
c.JupyterHub.authenticator_class = CustomAuthenticator
c.JupyterHub.spawner_class = DockerSpawner

# Deletes the container, when they are turned off
# Change it as per your requirement
c.DockerSpawner.remove_containers = True

# the Hub's API listens on localhost by default,
# but docker containers can't see that.
# Tell the Hub to listen on its docker network:
docker0 = netifaces.ifaddresses('docker0')
docker0_ipv4 = docker0[netifaces.AF_INET][0]
c.JupyterHub.hub_ip = docker0_ipv4['addr']

# If running on a server, uncomment the following
# in order to access JupyterHub on port 80
# c.JupyterHub.port = 80

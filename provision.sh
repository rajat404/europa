#!/bin/sh
LIST_OF_APPS="aptitude build-essential git libffi-dev libssl-dev libxml2 libxml2-dev libxslt1-dev nginx nginx-extras python python3-dev python3-pip python-software-properties python-virtualenv tmux uwsgi zlib1g-dev uwsgi-plugin-python3 libjpeg-dev libncurses5-dev libmagickwand-dev libffi-dev"
LIST_OF_PROJECT_APPS="npm nodejs-legacy"

sudo apt-get install -y $LIST_OF_APPS
sudo apt-get install -y $LIST_OF_PROJECT_APPS
sudo apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl software-properties-common
sudo apt-get -y update

sudo npm install -g configurable-http-proxy
sudo pip3 install --upgrade pip
sudo pip3 install jupyterhub
sudo pip3 install notebook
sudo pip3 install dockerspawner netifaces

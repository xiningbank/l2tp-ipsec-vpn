#!/bin/bash

# update system
sudo apt-get update

# install docker on ubuntu, see: https://docs.docker.com/engine/install/ubuntu
apt-get install docker.io -y

# restart docker
systemctl restart docker

# pull docker image
docker pull fcojean/l2tp-ipsec-vpn-server

# create docker container
docker run --name l2tp-ipsec-vpn-server --env-file ./.env -p 500:500/udp -p 4500:4500/udp -v /lib/modules:/lib/modules:ro -d --privileged fcojean/l2tp-ipsec-vpn-server

# for client configurations, see: https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients.md
# for client configuration/connection issue, see trouble shootting: https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients.md#troubleshooting
# for example(ubuntu):
# Phase1 Algorithms: aes128-sha1-modp2048
# Phase2 Algorithms: aes128-sha1
# or
# Phase1 Algorithms: aes-sha1-modp1024
# Phase2 Algorithms: aes-sha1

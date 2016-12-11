#!/bin/bash

mkdir -p /etc/chef
openssl genrsa -out /etc/chef/client.pem
chef-zero -H 0.0.0.0
#chef-zero -H 0.0.0.0 &
#berks install && berks upload
#sleep infinity

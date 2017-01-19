#!/bin/bash

mkdir -p /etc/chef
openssl genrsa -out /etc/chef/client.pem
cd ../chef-provisioning-k8s
ln -s ../Chef/.chef .chef
cd -
chef-zero -H 0.0.0.0
#chef-zero -H 0.0.0.0 &
#berks install && berks upload
#sleep infinity

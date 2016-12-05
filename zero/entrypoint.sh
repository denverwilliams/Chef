#!/bin/bash

openssl genrsa -out /etc/chef/client.pem
chef-zero -H 0.0.0.0 &
berks install && berks upload
sleep infinity

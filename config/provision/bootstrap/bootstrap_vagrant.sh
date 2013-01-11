#!/bin/bash

# This file should bootstrap the setup-prereq.sh file.
host="${1:-vagrant@33.33.0.3}"
ssh-keygen -R "${host#*@}" 2> /dev/null

echo "****** SCP'ing to $host ..."
scp -i ~/.vagrant.d/insecure_private_key -r config/provision $host:/home/vagrant/

echo "****** Running setup-prereq.sh..."
ssh -i ~/.vagrant.d/insecure_private_key "$host" '
. $HOME/provision/bootstrap/setup-prereq.sh'

echo "****** Package install complete..."
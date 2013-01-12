#!/bin/bash

# This file should bootstrap the setup-prereq.sh file.
host="${1:-kturner@www.karlturner.co.uk}"
ssh-keygen -R "${host#*@}" 2> /dev/null

echo "****** SCP'ing to $host ..."
scp -r config/provision $host:/home/kturner/

echo "****** Running setup-prereq.sh..."
ssh "$host" '
. $HOME/provision/bootstrap/setup-prereq.sh'

echo "****** Package install complete..."
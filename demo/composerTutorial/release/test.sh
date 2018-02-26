#!/bin/sh

# This assume fabric-install is done.

echo "Doing 1"
echo
./1-cp.sh
echo "Doing 2"
echo
./2-cp.sh
echo "Doing 1 app"
echo
./1-app-install.sh
echo "Doing 2 app"
echo
./2-app-install.sh

# start
./1-app-start.sh

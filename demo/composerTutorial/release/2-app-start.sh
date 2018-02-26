#!/bin/sh

# This assume fabric-install is done.

cd ../fabric-samples/first-network
echo "REST with Bob information"
echo
composer network ping -c bob@tutorial-network
composer-rest-server -c bob@tutorial-network -n never -w true

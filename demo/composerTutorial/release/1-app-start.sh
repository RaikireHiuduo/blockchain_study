#!/bin/sh

# This assume fabric-install is done.

cd ../fabric-samples/first-network
echo "REST with Alice information"
echo
composer network ping -c alice@tutorial-network
composer-rest-server -c alice@tutorial-network -n never -w true

#!/bin/sh

# Install and run byfn.sh lazily

# Remove card
composer card delete -n PeerAdmin@byfn-network-org1-only
composer card delete -n PeerAdmin@byfn-network-org1
composer card delete -n PeerAdmin@byfn-network-org2-only
composer card delete -n PeerAdmin@byfn-network-org2
composer card delete -n alice@tutorial-network
composer card delete -n bob@tutorial-network
composer card delete -n admin@tutorial-network
composer card delete -n PeerAdmin@fabric-network

# Up
cd ../fabric-samples/first-network
./byfn.sh -m down
docker network prune
./byfn.sh -m generate
./byfn.sh -m up -s couchdb -a

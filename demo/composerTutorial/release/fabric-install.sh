#!/bin/sh

# Install and run byfn.sh

# Directory setup
RDIR=`pwd`

# Clone
cd ../
git clone -b issue-6978 https://github.com/sstone1/fabric-samples.git

# Get and update all the Hyperledger Fabric files. Eats a lot of bandwidth and space.
cd ./fabric-samples
curl -sSL https://goo.gl/byy2Qj | bash -s 1.0.5

# Remove everything from the docker process, including stopped ones. 
# docker ps -q | xargs docker stop
# docker ps -qa | xargs docker rm

# Copy the example connection profiles.
cp -r ${RDIR}/files/* ./first-network

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
cd ./first-network
./byfn.sh -m down
docker network prune
./byfn.sh -m generate
./byfn.sh -m up -s couchdb -a

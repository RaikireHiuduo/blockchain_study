#!/bin/sh

# Directory setup
RDIR=`pwd`
cd ../fabric-samples/first-network
BYFNDIR=`pwd`

# Install Composer app to the network
cd ${RDIR}
# composer network start -c PeerAdmin@byfn-network-org2 -a tutorial-network@0.0.1.bna -o endorsementPolicyFile=${BYFNDIR}/endorse/endorsement-policy.json -A alice -C ${BYFNDIR}/1/alice/admin-pub.pem -A bob -C ${BYFNDIR}/2/bob/admin-pub.pem

# Prepare call card
cd ${BYFNDIR}
composer card create -p ./2/connection-org2.json -u bob -n tutorial-network -c ./2/bob/admin-pub.pem -k ./2/bob/admin-priv.pem -f ./2/bob@tutorial-network.card
composer card import -f ./2/bob@tutorial-network.card
composer network ping -c bob@tutorial-network

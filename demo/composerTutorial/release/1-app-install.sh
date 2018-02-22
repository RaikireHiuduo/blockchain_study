#!/bin/sh

# Directory setup
RDIR=`pwd`
cd ../fabric-samples/first-network
BYFNDIR=`pwd`

# Install Composer app to the network
cd ${BYFNDIR}
composer network start -c PeerAdmin@byfn-network-org1 -a ${RDIR}/tutorial-network@0.0.1.bna -o endorsementPolicyFile=${BYFNDIR}/endorse/endorsement-policy.json -A alice -C ${BYFNDIR}/1/alice/admin-pub.pem -A bob -C ${BYFNDIR}/2/bob/admin-pub.pem

# Prepare call card
cd ${BYFNDIR}
composer card create -p ./1/connection-org1.json -u alice -n tutorial-network -c ./1/alice/admin-pub.pem -k ./1/alice/admin-priv.pem -f ./1/alice@tutorial-network.card
composer card import -f ./1/alice@tutorial-network.card
composer network ping -c alice@tutorial-network

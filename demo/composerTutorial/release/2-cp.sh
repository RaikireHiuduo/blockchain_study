#!/bin/sh

# Directory setup
cd ../fabric-samples/first-network
BYFNDIR=`pwd`

# get PB and PR
cd ${BYFNDIR}
PB="./crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem"
cd ./crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore
PR="./crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/"`ls|grep *_sk`

# Create admin connection profile.
cd ${BYFNDIR}
composer card create -p ./2/connection-org2-only.json -u PeerAdmin -c ${PB} -k ${PR} -r PeerAdmin -r ChannelAdmin -f ./2/PeerAdmin@byfn-network-org2-only.card
composer card create -p ./2/connection-org2.json -u PeerAdmin -c ${PB} -k ${PR} -r PeerAdmin -r ChannelAdmin -f ./2/PeerAdmin@byfn-network-org2.card

# Import to wallet
composer card import -f ./2/PeerAdmin@byfn-network-org2-only.card
composer card import -f ./2/PeerAdmin@byfn-network-org2.card

# install Hyperledger Composer runtime to the network
composer runtime install -c PeerAdmin@byfn-network-org2-only -n tutorial-network

# Keep bob information here.
cd ${BYFNDIR}/2
composer identity request -c PeerAdmin@byfn-network-org2-only -u admin -s adminpw -d bob
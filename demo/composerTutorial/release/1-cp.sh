#!/bin/sh

# Directory setup
cd ../fabric-samples/first-network
BYFNDIR=`pwd`

# get PB and PR
cd ${BYFNDIR}
PB="./crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem"
cd ./crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore
PR="./crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/"`ls|grep *_sk`

# Create admin connection profile.
cd ${BYFNDIR}
composer card create -p ./1/connection-org1-only.json -u PeerAdmin -c ${PB} -k ${PR} -r PeerAdmin -r ChannelAdmin -f ./1/PeerAdmin@byfn-network-org1-only.card
composer card create -p ./1/connection-org1.json -u PeerAdmin -c ${PB} -k ${PR} -r PeerAdmin -r ChannelAdmin -f ./1/PeerAdmin@byfn-network-org1.card

# Import to wallet
composer card import -f ./1/PeerAdmin@byfn-network-org1-only.card
composer card import -f ./1/PeerAdmin@byfn-network-org1.card

# install Hyperledger Composer runtime to the network
composer runtime install -c PeerAdmin@byfn-network-org1-only -n tutorial-network

# Keep alice information here.
cd ${BYFNDIR}/1
composer identity request -c PeerAdmin@byfn-network-org1-only -u admin -s adminpw -d alice
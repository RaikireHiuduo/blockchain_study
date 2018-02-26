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
cp -rf ${RDIR}/files/* ./first-network

# remove the folder that treats it as a git repository.
rm -rf .git

# Build the network
cd ${RDIR}
./fabric-build.sh

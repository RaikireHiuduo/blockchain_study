# release

Reference: https://hyperledger.github.io/composer/unstable/tutorials/deploy-to-fabric-multi-org.html

To prevent issues: Internet connection.

```bash
chmod u+x 1-cp.sh
chmod u+x 2-cp.sh
chmod u+x 1-app-install.sh
chmod u+x 2-app-install.sh
chmod u+x 1-app-start.sh
chmod u+x 2-app-start.sh
chmod u+x fabric-build.sh
chmod u+x fabric-install.sh
chmod u+x fabric-start.sh
chmod u+x fabric-stop.sh
chmod u+x test.sh

# first-time
./fabric-install.sh
./test.sh

# Already have fabric-samples but need hard reset
./fabric-build.sh
./test.sh

# Restart the network from last known state.
./fabric-start.sh
./1-app-start.sh

# Stop the network
./fabric-stop.sh
```

## First-time

Alice|Both|Bob
---|---|---
-|Download Hyperledger Fabric `bin` files (`fabric-install.sh`)|-
-|Bring up the Hyperledger Fabric network (part of`fabric-install.sh` or `fabric-build.sh`)|-
-|Check the IP:ports and locations of certificates|-
Build connection profiles for Alice to the network|-|Build connection profiles for Bob to the network
-|Find own private key|-
Create and import own admin business card (`1-cp.sh`)|-|Create and import own admin business card. (`2-cp.sh`)
Install Hyperledger Composer runtime (`1-cp.sh`)|-|Install Hyperledger Composer runtime (`2-cp.sh`)
-|Prepare endorsement policy (only one)|-
Get own identity (`1-cp.sh`)|-|Get own identity (`2-cp.sh`)
Give public key to Bob|-|Give public key to Alice
Start network (`1-app.sh`)|-|- (can also be done here if given endorsement policy and public key, commented code in `2-app.sh`)
Install and run the program in the network as Alice (`1-app.sh`)|-| Install and run the program in the network as Bob (`2-app.sh`)
-|Use own card to query the network (`x-app-start.sh`)|-

## Daily starting operation

Alice|Both|Bob
---|---|---
Start network (`fabric-start.sh`)|-|- (can also be done here if given endorsement policy and public key)
-|Use own card to query the network (`x-app-start.sh`)|-

## Update

TBA

## Known issues.

Only the first POST REST entry will give no response. Regardless, the information will still be logged in the server.

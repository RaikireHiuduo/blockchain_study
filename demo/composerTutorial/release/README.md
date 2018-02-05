# release

https://hyperledger.github.io/composer/unstable/tutorials/deploy-to-fabric-multi-org.html

To prevent issues: Internet connection because this is banana.

```bash
chmod u+x 1-cp.sh
chmod u+x 2-cp.sh
chmod u+x 1-app.sh
chmod u+x 2-app.sh
chmod u+x fabric-install.sh
chmod u+x fabric-install-lazy.sh
chmod u+x test.sh

# first-time
./fabric-install.sh
./test.sh

# Already have fabric-samples
./fabric-install-lazy.sh
./test.sh
```

## First-time

Alice|Both|Bob
---|---|---
-|Download Hyperledger Fabric `bin` files|-
-|Bring up the Hyperledger Fabric network|-
-|Check the IP:ports and locations of certificates|-
Build connection profiles for Alice to the network|-|Build connection profiles for Bob to the network
-|Find own private key|-
Create and import own admin business card|-|Create and import own admin business card.
Install Hyperledger Composer runtime|-|Install Hyperledger Composer runtime
-|Prepare endorsement policy (only one)|-
Get own identity|-|Get own identity
Give public key to Bob|-|Give public key to Alice
Start network|-|- (can also be done here if given endorsement policy and public key)
Install and run the program in the network as Alice|-| Install and run the program in the network as Bob
-|Use own card to query the network|-

## Daily operation

Alice|Both|Bob
---|---|---
Start network|-|- (can also be done here if given endorsement policy and public key)
-|Use own card to query the network|-

## Update

TBA

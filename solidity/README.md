# Solidity URI contracts

This repository will serve as a proof of concept and any contracts in this directory should be considered only deployable in a test or private network.  At this point these have only been tested in a private network and should only be considered as a proof of concept.

## Ownable (ownable.sol) and Mortal (mortal.sol)

Both of these contracts are the standard boiler plate to show the usage of the Solidity "modifier" and how it gets inherited by contracts and functions that reference it.  It also shows how contracts can only be killed by the contract owner, which can also be extended to other functions that reference the "onlyOwner" type.

## URI (uri.sol)

A Demonstration of using structs and mappings to define information to store on the blockchain.  There are also simple getters and setters that allow those that interact with the contract to set or view the values stored on the blockchain.

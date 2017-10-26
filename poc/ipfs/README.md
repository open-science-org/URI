# Interplanetary File System

Writing this to document how to integrate blockchain data onto IPFS.  This is designed to setup a local instance of IPFS that you can interact with.  Will also add interactions with the testnet.

## Install Go

Download Link: https://golang.org/dl/

Follow installation instructions for your environment.

## Install IPFS

IPFS install Link: https://ipfs.io/docs/install/

Download re-direct Link: https://dist.ipfs.io/#go-ipfs

Copy or move the unzipped IPFS binary to the installed Go path.

__Linux__
```
$ sudo mv ipfs /usr/local/bin/ipfs
```

__Windows__
```
 $ cp ~/Downloads/go-ipfs_v0.4.11_windows-amd64/go-ipfs/ipfs.exe C:/Go/bin/ipfs.exe
 ```

Test the IPFS installation:
```
$ ipfs version
ipfs version 0.4.11
```

## Initialize IPFS

This sets up IPFS for use on your local system and does not yet expose you to the public IPFS

```
$ ipfs init
initializing IPFS node at C:\Users\[username]\.ipfs
generating 2048-bit RSA keypair...done
peer identity: [Hash ID]
to get started, enter:

        ipfs cat /ipfs/[Hash ID]/readme
```

## Test IPFS

To test IPFS commands and seeing de-duplication in action the following can be executed.  Notice that the hash for hello and hello3 match so that an extra file does not have to be stored on the IPFS network.

```
$ echo hello ipfs > hello.txt
$ echo hello test > hello2.txt
$ echo hello ipfs > hello3.txt

$ ipfs add hello.txt
added QmSoASxb8aNVGk3pNWpZvXEZTQKxjGeu9bvpYHuo5bP1VJ hello.txt

$ ipfs add hello2.txt
added QmRmPLc1FsPAn8F8F9DQDEYADNX5ER2sgqiokEvqnYknVW hello2.txt

$ ipfs add hello3.txt
added QmSoASxb8aNVGk3pNWpZvXEZTQKxjGeu9bvpYHuo5bP1VJ hello3.txt


$ ipfs cat QmSoASxb8aNVGk3pNWpZvXEZTQKxjGeu9bvpYHuo5bP1VJ
hello ipfs

$ ipfs cat QmRmPLc1FsPAn8F8F9DQDEYADNX5ER2sgqiokEvqnYknVW
hello test
```

## Join IPFS Public Network

To allow others to pull files from your computer you can run the following to make it accessible for all.

```
ipfs daemon
```

## Modify Public Network to a Local Private Network

Remove all references to anything in the IPFS config file related to bootstrap.

```
$ ~/.ipfs/config

"Bootstrap": [],
```

Or Navigate to http://localhost:5001/ipfs and update the Config to remove the bootstrap information.

Restart the IPFS daemon.

## Configure IPFS ACL's

To ensure the web request can communicate with IPFS we need to ensure our local IPFS daemon will accept the servers request.

```
$ ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '["http://localhost"]'
$ ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "GET", "POST"]'
$ ipfs config --json Access-Control-Allow-Credentials '["true"]'
```

Reference - https://github.com/INFURA/tutorials/wiki/IPFS-and-CORS

## Install IPFS JavaScript Package

On Windows ensure you have Python 2 installed (could not get working with Python 3)

In Powershell as Administrator ensure that Windows build tools are installed:

```
npm install --global --production windows-build-tools
```

Once complete install the IPFS JavaScript libraries via npm:

```
npm install ipfs --save
```

To install CLI tool you can run:

```
npm install ipfs --global
```

# Ethereum geth

Start private test net with the proper RPC permissions:

```
$ geth --datadir=[Private Chain Path] --rpc --rpccorsdomain "http://localhost:8080,http://localhost:8081,https://localhost:8545" --rpcport 8545 --rpcaddr localhost
```

# Ethereum testrpc

Start a blockcahin with the necessary RPC settings.

```
testrpc --secure -u 0 --rpc --rpccorsdomain = "*"
```


## About
This project aims to create a smart contract that allows receiving donations from users (funding) and enables the contract owner to withdraw the funds.

## Tools

For the development of this project, Foundry was used to write the script for smart contract deployment and tests to verify its behavior. Additionally, local simulations using Anvil allow testing the project without necessarily deploying it on-chain. It's important to note that the tests are not exhaustive and do not guarantee 100% coverage; they were created for practice and should be considered as such.

## General

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

### Documentation

https://book.getfoundry.sh/

### Usage

#### Build

```shell
$ forge build
```

#### Test

```shell
$ forge test
```

#### Format

```shell
$ forge fmt
```

#### Gas Snapshots

```shell
$ forge snapshot
```

#### Anvil

```shell
$ anvil
```

#### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

#### Cast

```shell
$ cast <subcommand>
```

#### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

# Inheritance Smart Contract

This is a Solidity smart contract for managing inheritance within a blockchain environment. It includes functionality to transfer ownership after a specified period of time, as well as the ability to assign and change heirs.

## Features

- **Ownership Transfer:** After 30 days of the owner's inactivity, ownership will automatically transfer to the heir.
- **Heir Management:** Heir can be assigned and changed during the contract's lifecycle.
- **Withdrawals:** The owner can withdraw funds from the contract, resetting the inactivity timer.
- **Customizable Inactivity Period:** The period after which ownership transfers can be adjusted to suit your use case.

## Requirements

- [Foundry](https://github.com/foundry-rs/foundry) (for testing and deploying)
- Solidity version: `^0.8.18`

### Deploy the Contract:

1. The contract is deployed with an heir address.

```solidity
address heir = 0x2dCe879bcF9117BeB2cED97eDf8c01C5301531f8;
Inheritance inheritance = new Inheritance(heir);


## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

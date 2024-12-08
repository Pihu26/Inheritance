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

## How to Deploy

### 1. Setup your environment
 You can follow the installation guide on the official Foundry GitHub.

### 2. Initialize the Contract

Deploy the contract by specifying the heir address in the constructor. The owner can initially set the heir during contract deployment.

### 3. Contract Deployment

The contract is deployed using the `DeployInheritance` script, which takes the heir address as an input.

### 4. Testing

The `InheritanceTest.t.sol` file contains unit tests to check the functionality of the ownership transfer mechanism, heir management, and withdrawal functionality.

### 5. Withdrawals

Owners can withdraw funds from the contract, which resets the inactivity timer to avoid unintended ownership transfer.

## Contract Details

### `Inheritance.sol`

- **Constructor:**
    - `constructor(address _heir)`: Initializes the contract with the given heir and sets the current owner as the contract deployer.
    
- **Functions:**
    - `timeHasPassed()`: Returns `true` if 30 days have passed since the last action (e.g., withdrawal) by the owner.
    - `ownerShipTransfer()`: Transfers ownership to the heir after 30 days of inactivity.
    - `withdrawl()`: Allows the owner to withdraw funds and resets the inactivity timer.
    - `changedHeir(address newHeir)`: Allows the heir to change the current heir address.

- **Modifiers:**
    - `onlyOwner()`: Ensures that only the owner can execute certain functions.
    - `onlyHeir()`: Ensures that only the heir can change the heir.

### Events:
- `OwnerShipHasTransfered`: Emitted when ownership is transferred from the owner to the heir.
- `ChangedHeir`: Emitted when the heir address is updated.

## Example Usage

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

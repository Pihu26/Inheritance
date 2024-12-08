// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Inheritance {
    error Inheritance__NotOwner();
    error Inheritance__TimeHasNotPassed();
    error Inheritance__InvalidAddress();
    error Inheritance__NotHeir();

    address private owner;
    address private heir;
    uint256 public lastTimeStamp;

    event OwnerShipHasTransfered(address owner, address heir);
    event ChangedHeir(address heir, address newHeir);

    constructor(address _heir) {
        owner = msg.sender;
        heir = _heir;
        lastTimeStamp = block.timestamp;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert Inheritance__NotOwner();
        }
        _;
    }

    modifier onlyHeir() {
        if (heir != msg.sender) {
            revert Inheritance__NotHeir();
        }
        _;
    }

    function timeHasPassed() public view returns (bool) {
        return block.timestamp >= lastTimeStamp + 30 days;
    }

    function changedHeir(address newHeir) public onlyHeir {
        if (newHeir == address(0)) {
            revert Inheritance__InvalidAddress();
        }

        heir = newHeir;
        emit ChangedHeir(heir, newHeir);
    }

    function ownerShipTransfer() public {
        if (!timeHasPassed()) {
            revert Inheritance__TimeHasNotPassed();
        }
        if (heir == address(0)) {
            revert Inheritance__InvalidAddress();
        }
        owner = heir;
        emit OwnerShipHasTransfered(owner, heir);
    }

    function withdrawl(uint256 amount) public payable onlyOwner {
        payable(owner).transfer(amount);
        lastTimeStamp = block.timestamp;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function getHeir() public view returns (address) {
        return heir;
    }
}

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployInheritance} from "../script/DeployInheritance.s.sol";
import {Inheritance} from "../src/Inheritance.sol";

contract InheritanceTest is Test {
    Inheritance inheritance;
    address public heir = address(0x2dCe879bcF9117BeB2cED97eDf8c01C5301531f8);
    address public owner;

    function setUp() external {
        DeployInheritance deployInheritance = new DeployInheritance();
        inheritance = deployInheritance.run();
        owner = inheritance.getOwner();
    }

    function testOwnershipTransfered() public {
        vm.warp(block.timestamp + 30 days);
        bool timePassed = inheritance.timeHasPassed();
        console.log("Has time passed?", timePassed);
        inheritance.ownerShipTransfer();
        assertEq(inheritance.getOwner(), heir);
    }

    function testchangeToNewHeir() public {
        address newHeir = vm.addr(1);
        vm.prank(heir);
        inheritance.changedHeir(newHeir);
        assertEq(inheritance.getHeir(), newHeir);
    }

    function testIfWithdrawDontChange() public {
        vm.prank(owner);
        inheritance.withdrawl(0);
        vm.expectRevert();
        inheritance.ownerShipTransfer();

        assertEq(inheritance.lastTimeStamp(), block.timestamp);
    }
}

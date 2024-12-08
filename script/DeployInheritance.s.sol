// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {Inheritance} from "../src/Inheritance.sol";

contract DeployInheritance is Script {
    function run() external returns (Inheritance) {
        address heir = 0x2dCe879bcF9117BeB2cED97eDf8c01C5301531f8;
        vm.startBroadcast();
        Inheritance inheritance = new Inheritance(heir);
        vm.stopBroadcast();
        return inheritance;
    }
}

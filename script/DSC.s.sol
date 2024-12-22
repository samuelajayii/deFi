// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {DSC} from "../src/DSC.sol";
import {Script} from "forge-std/Script.sol";

contract DeployDSC is Script {
    function run() external returns (Engine, DSC) {
        vm.startBroadcast();
        DSC dsc = new DSC();
        vm.stopBroadcast();
    }
}

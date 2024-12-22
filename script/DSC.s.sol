// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {DSC} from "../src/DSC.sol";
import {Script} from "forge-std/Script.sol";

contract DeployDSC is Script {
    address public constant owner = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    function run() external returns (DSC) {
        vm.startBroadcast(owner);
        DSC dsc = new DSC();
        vm.stopBroadcast();

        return dsc;
    }
}

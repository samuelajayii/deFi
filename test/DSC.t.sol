// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {DSC} from "../src/DSC.sol";

contract EngineTest {
    function setup() external {
        DSC dsc = new DSC();
    }
}

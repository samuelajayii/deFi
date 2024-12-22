// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {DSC} from "../src/DSC.sol";
import {DeployDSC} from "../script/DSC.s.sol";

contract EngineTest is Test {
    DSC dsc;
    address public owner = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    address public bob = makeAddr("bob");

    function setUp() external {
        vm.prank(owner);
        DeployDSC deployDSC = new DeployDSC();
        dsc = deployDSC.run();
    }

    function testNameDeployment() public {
        assertEq(keccak256(abi.encodePacked(dsc.name())), keccak256(abi.encodePacked("MyStableCoin")));
        assertEq(keccak256(abi.encodePacked(dsc.symbol())), keccak256(abi.encodePacked("MSC")));
    }

    function testTotalSupply() public {
        assertEq(dsc.totalSupply(), 0);
    }

    function testOnlyOwnership() public {
        vm.expectRevert();
        vm.prank(bob);
        dsc.mint(bob, 200);
    }
}

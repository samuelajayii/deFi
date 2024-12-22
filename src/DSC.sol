// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 *     @title  A decentralised stable coin contract
 *     @author Ajayi Samuel
 *     @notice This contract is for creating decentralised stable coin
 *     @dev Implements OpezZepplin ERC20Burnable and Ownable
 */
contract DSC is ERC20Burnable, Ownable {
    constructor() ERC20("MyStableCoin", "MSC") Ownable(msg.sender) {}

    error AmountMustBeMoreThanZero();
    error BurnAmountExceedsBalance();
    error NotZeroAddress();

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if (_amount <= 0) {
            revert AmountMustBeMoreThanZero();
        }
        if (balance < _amount) {
            revert BurnAmountExceedsBalance();
        }
        super.burn(_amount);
    }

    function mint(address _to, uint256 _amount) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert NotZeroAddress();
        }
        if (_amount <= 0) {
            revert AmountMustBeMoreThanZero();
        }
        _mint(_to, _amount);
        return true;
    }
}

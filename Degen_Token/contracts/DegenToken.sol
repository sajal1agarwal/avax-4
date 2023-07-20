// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20 {
  address public owner ;
    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender ;
    }
modifier onlyOwner {
    require(msg.sender == owner);
    _;
}
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    function decimals() public pure override returns (uint8) {
        return 0;
    }
    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }function vegetablesAvailable() external view {
    console.log("The following vegetables are available for purchase:");
    console.log("1: carrot - 1000 Token ");
    console.log("2: broccoli - 500 Token ");
    console.log("3: cucumber - 250 Token ");
}

function fruitsAvailable() external view {
    console.log("The following fruits are available for purchase:");
    console.log("1: apple");
    console.log("2: banana");
    console.log("3: orange");
}

function redeemTokensForVegetable(uint vegetable) external payable {
    if (vegetable == 1) {
        require(this.balanceOf(msg.sender) >= 1000, "You do not have enough Tokens");
        approve(msg.sender, 1000);
        transferFrom(msg.sender, owner, 1000);
        console.log("You have redeemed for a Carrot!");
    } else if (vegetable == 2) {
        require(this.balanceOf(msg.sender) >= 500, "You do not have enough Tokens");
        approve(msg.sender, 500);
        transferFrom(msg.sender, owner, 500);
        console.log("You have redeemed for Broccoli!");
    } else if (vegetable == 3) {
        require(this.balanceOf(msg.sender) >= 250, "You do not have enough Tokens");
        approve(msg.sender, 250);
        transferFrom(msg.sender, owner, 250);
        console.log("You have redeemed for a Cucumber!");
    } else {
        console.log("That is not a valid vegetable choice");
    }
}

function redeemTokensForFruit(uint fruit) external payable {
    if (fruit == 1) {
        require(this.balanceOf(msg.sender) >= 1000, "You do not have enough Tokens");
        approve(msg.sender, 1000);
        transferFrom(msg.sender, owner, 1000);
        console.log("You have redeemed for an Apple!");
    } else if (fruit == 2) {
        require(this.balanceOf(msg.sender) >= 500, "You do not have enough Tokens");
        approve(msg.sender, 500);
        transferFrom(msg.sender, owner, 500);
        console.log("You have redeemed for a Banana!");
    } else if (fruit == 3) {
        require(this.balanceOf(msg.sender) >= 250, "You do not have enough Tokens");
        approve(msg.sender, 250);
        transferFrom(msg.sender, owner, 250);
        console.log("You have redeemed for an Orange!");
    } else {
        console.log("That is not a valid fruit choice");
    }
}

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable{
    mapping(uint8 => uint256) public storeItems;
    address public Owner;
    
    constructor(address owner) ERC20("Degen", "DGN") Ownable(owner){
        storeItems[1] = 100;
        storeItems[2] = 50;
        storeItems[3] = 25;
        Owner = msg.sender;
    }

    function mintTokens(address account, uint256 amount) public {
        require(msg.sender == Owner, "Access Denied: Only the Owner can access this.");
        _mint(account, amount);
    }

    function transferTokens(address _from, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _from, _value);
    }

    function getBalance() external view returns (uint256){
        return this.balanceOf(msg.sender);
    }
    function burnTokens(uint256 _value) external  {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens");
        approve(msg.sender, _value);
        _burn(msg.sender, _value);
    }

    function showStoreItems() public pure returns(string memory){
        string memory items = "The ff items are avialable for purchase: 1. Degen NFT = 100 DGN\n2. Official Degen NFT Tshirt = 200 DGN\n3. Official Degen Jackets = 300 DGN";
        return items;
    }

    function redeemDGNToken(uint8 option) external {
        require(storeItems[option] > 0, "Invalid item option.");
        require(option <= 3, "Invalid item option");
        require(balanceOf(msg.sender) >= storeItems[option], "Insufficient funds to redeem the item.");
        transfer(owner(), storeItems[option]);
    }
     function decimals() override public pure returns (uint8) {
        return 0;
    }

}



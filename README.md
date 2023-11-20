# Degen Token ERC20

This project aims to develop and deploy a customized ERC20 token on the Avalanche network to facilitate the gaming economy of Degen Gaming. The token will serve as a versatile medium of exchange within the game, enabling players to earn rewards, purchase in-game items, and engage in seamless transactions.

## Description

Token Functionality
  Minting: The token issuance process will be controlled by authorized administrators, ensuring a well-regulated supply of tokens. This mechanism will promote stability and prevent inflation.
  Transfers: Players will have the freedom to transfer tokens between their accounts, fostering a dynamic and interconnected gaming community.
  Redemption: Players can exchange their accumulated tokens for valuable in-game items, enhancing their gaming experience and rewarding their participation.
  Balance Checks: Players can conveniently check their token balances at any time, providing them with transparency and control over their in-game assets.
  Burning: To maintain the token's value and ensure a balanced economy, players will have the option to voluntarily burn tokens, removing them from circulation.


## Getting Started

### Executing program
In order to run this program, it is recommended to copy the whole code and run it in Remix or HardHat. The code can be copied below:

```
// SPDX-License-Identifier: MIT
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
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.20" (or another compatible version), and then click on the "Compile types-of-functions.sol" button.

After compilation, the contract can be deployed by clicking the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "types-of-functions" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, click on the "types-of-functions" contract first on the left-hand sidebar, you can interact with it by clicking the different variables to see different information about the created token. You can also mint, burn, and transfer tokens, simply select the appropriate accounts when executing these functions to avoid errors.


## Authors

Contributors names and contact info

Art Bautista  
ex. (202010553@fit.edu.ph)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

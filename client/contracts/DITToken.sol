// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0


pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DITToken is ERC20 {
     address public owner; 
     uint public initialSupply;
      
      
         modifier onlyOwner() {
            require(owner == msg.sender, "Ypu are not owner");
            _;
        }

       constructor(uint256 _initialSupply) ERC20("Degree Issuance TOken", "DIT") {
        initialSupply = _initialSupply;
        owner = msg.sender;
       _mint(owner, initialSupply);
        }

   

}
// DITTokenModule#DITToken - 0x77088C16D1028541812fF9f7Ea5e1c3B6551370D sepolia network
// DegreeIssuanceModule#DegreeIssuance - 0xe7036f0F6dCCeB0d2bD086723261947BD70547C6
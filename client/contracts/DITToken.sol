// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0


pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DITToken is ERC20,Ownable {
      
       uint public initialSupply;
 
       mapping(address=>uint) public DITTokenOwner;
     

       constructor(uint _initialSupply) ERC20("Degree Issuance TOken", "DIT") Ownable(msg.sender) {
         initialSupply = _initialSupply;
        // _mint(owner, 100000*10**18);
        }

         function mint(address _to,uint _tokenAmount )public {
         _mint(_to, _tokenAmount);
          initialSupply += _tokenAmount;
          DITTokenOwner[msg.sender] += _tokenAmount;
         }
   
        
        
}




// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0


pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DITToken is ERC20 {
       address public owner; 
       uint public initialSupply;
 
    //    mapping(address=>uint) public DITTokenOwner;
        modifier onlyOwner() {
            require(owner == msg.sender, "You are not owner");
            _;
        }

       constructor(uint _initialSupply) ERC20("Degree Issuance TOken", "DIT") {
         initialSupply = _initialSupply;
        owner = msg.sender;
        // _mint(owner, 100000*10**18);
       
        }
         function mint(address _to,uint _tokenAmount )public {
         _mint(_to, _tokenAmount);
          initialSupply += _tokenAmount;
       
         }
   
        
        
}
// DITTokenModule#DITToken - 0x0cC59f28cF28d52087E6beABa3cBb0Bd46d79580 sepolia network
// DegreeIssuanceModule#DegreeIssuance - 0x534F1834f199B91762e1B821408Fb1D501604138
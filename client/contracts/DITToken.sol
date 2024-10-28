// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0


pragma solidity ^0.8.21;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DITToken is ERC20 {
     address public owner; 
     uint public initialSupply;
      mapping (address=> mapping (address=>uint)) public allowances;
      
         modifier onlyOwner() {
            require(owner == msg.sender, "Ypu are not owner");
            _;
        }

     constructor(uint256 _initialSupply) ERC20("Degree Issuance TOken", "DIT") {
        initialSupply = _initialSupply;
        owner = msg.sender;
     _mint(owner, initialSupply);
     }

    function decimals() public pure override returns (uint8) {
    return 18;
    }

    function allowance(address _owner, address _spender) public view override onlyOwner returns (uint256) {
    return allowances[_owner][_spender];
    }

     function approve(address spender, uint256 value) public override onlyOwner returns (bool) {
    require(spender != address(0), "Invalid address");

    allowances[msg.sender][spender] = value;

    emit Approval(msg.sender, spender, value);
    return true;
}

}
//DIT contract Address 0x677C5a4ba14F5Ec512106E905D008B73b2d5dcb5 // sepolia
//Degree Issuance smart contract 0x0aaB8eF978313961EEC11e0cC177B76138C39b4d
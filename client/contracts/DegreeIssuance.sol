// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract DegreeIssuance is ERC721, ERC721URIStorage  {
        address public owner;
        IERC20 public DITToken;
        
        uint256 public nftCount=0;
          uint public degreeclaimfee = 100*10**18;

        modifier onlyOwner() {
            require(owner == msg.sender, "Ypu are not owner");
            _;
        } 
        mapping (uint => address) public degreetoOwner;

        event TokenBought(address buyer, uint tokenQuantity);
        event NftMinted(address to, uint tokenId);


       constructor(address _DITToken) ERC721("ComputerScience Degree", "CSD") {
            DITToken = IERC20( _DITToken);
            owner = msg.sender;
       }


     function claimYourDegree( string memory _tokenUri) external  {  
        require(msg.sender != address(0)," Invalid Address");
        require(DITToken.balanceOf(msg.sender)>= degreeclaimfee,"Insufficient token to Claim Degree");
        DITToken.transferFrom(msg.sender,address(this),degreeclaimfee);
         uint256 newNFTid = nftCount++;
         
        _safeMint(msg.sender, newNFTid);
        _setTokenURI(newNFTid, _tokenUri);
        degreetoOwner[newNFTid] = msg.sender;
         emit NftMinted(msg.sender, newNFTid);
       }
       
       function checkContractBalance() public view returns (uint256) {
        return DITToken.balanceOf(address(this));
       }
       

        function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
    

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }   
}
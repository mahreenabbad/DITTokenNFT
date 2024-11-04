// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

// use soulBound 
// check uri format from sepolia etherscan
// correct uri format
contract SoulBoundNFT is  ERC721, ERC721URIStorage, Ownable{
    IERC20 public DITToken;
    uint public nftMintfee = 100*10**18;
    uint public nftCount=0;
    
    constructor(address _DITToken) ERC721("Student Certificate", "SCT")  Ownable(msg.sender) { 
         DITToken = IERC20(_DITToken);
     }

        //MAPPING
        
       mapping(uint=> bool) public approveSoulBoundNFT;
       mapping (uint => address) public mintedDegreetoOwner;
     
        //EVENTS
        event BoundTokenMinted(address indexed to, uint256 indexed tokenId);

       function approveSoulboundNFT( uint _id) external  onlyOwner {  
        approveSoulBoundNFT[_id] = true;
      }
      
   
     function mintSoulBoundToken(address _to, string memory uri) public  {
        require(_to != address(0), "Invalid Address");
        require(DITToken.balanceOf(msg.sender)>= nftMintfee,"Insufficient token to Claim Degree");  
        require(approveSoulBoundNFT[nftCount] ==true, "NFT not approved");
         DITToken.transferFrom(msg.sender,address(this),nftMintfee);
       
        _safeMint(_to, nftCount);
        _setTokenURI(nftCount, uri);
          approveSoulBoundNFT[nftCount] = false; // approval ended after minting
         mintedDegreetoOwner[nftCount] =msg.sender; // owner of minted NFT
         
         emit BoundTokenMinted(_to, nftCount);
         nftCount ++;
       }


        function _update(address to, uint256 tokenId, address auth) internal virtual override (ERC721) returns (address) {
             address from = _ownerOf(tokenId);
            // Prevent any transfers by checking if `from` and `to` are both non-zero
           if (from != address(0) && to != address(0)) {
             revert("Soulbound NFT cannot be transferred.");
            }

             // For minting or burning cases, proceed with the update
             return super._update(to, tokenId, auth);
     }



       function checkContractBalance() public view returns (uint256) {
        return DITToken.balanceOf(address(this));
       }
     // The following functions are overrides required by Solidity.
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

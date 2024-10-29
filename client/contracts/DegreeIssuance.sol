// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract DegreeIssuance is ERC721, ERC721URIStorage  {
       using SafeERC20 for IERC20;
       

        address public owner;
        IERC20 public DITToken;
        uint256 public DITPrice = 1e18 wei;//1 ether
        uint256 public nftCount;
      
        modifier onlyOwner() {
            require(owner == msg.sender, "Ypu are not owner");
            _;
        }

        mapping (address=> uint) public tokenHolder;
        mapping (uint => address) public nftMinted;

        event TokenBought(address buyer, uint tokenQuantity);
        event NftMinted(address to, uint tokenId);


       constructor(address _DITToken) ERC721("Student CertificateNFT", "SCT") {
            DITToken = IERC20( _DITToken);
            owner = msg.sender;
       }

        function buyToken( uint _tokenQuantity) public payable {
        require(msg.value >= _tokenQuantity * DITPrice," Insufficient amount");//10 token price = 10 *2e16 =
        require(_tokenQuantity >0, "Insufficient quatity of token");
        uint256 contractTokenBalance = DITToken.balanceOf(address(this));
        require(contractTokenBalance >= _tokenQuantity, "Not enough tokens in contract");
         DITToken.safeTransfer(msg.sender, _tokenQuantity);
         tokenHolder[msg.sender] += _tokenQuantity;

         emit TokenBought(msg.sender, _tokenQuantity);
       }

       function certificateMint(address _to, string memory _tokenUri) external  {
        require(_to != address(0), "Invalid Address");
        require(tokenHolder[msg.sender] >= 100 * DITPrice,"Insufficient token to claim certificate");
         uint256 newNFTCount = nftCount++;
         tokenHolder[msg.sender] -= 100 * DITPrice;
        _safeMint(_to, newNFTCount);
        _setTokenURI(newNFTCount, _tokenUri);
        nftMinted[newNFTCount] = msg.sender;

        emit NftMinted(_to, newNFTCount);

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
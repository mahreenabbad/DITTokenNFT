require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config()
const {ethers} = require('ethers');
// var fs = require('fs');

// var ethers = require('ethers')
// const fsPromises = fs.promises;
// Contract addresses
const ABI_FILE1 = '../../artifacts/contracts/DITToken.sol/DITToken.json';
const ABI_FILE2= '../../artifacts/contracts/DegreeIssuance.sol/DegreeIssuance.json';
 const CONTRACT_ADDRESS_DIT = "0x8DFac0548ff9605a6069ba7Aa0A348b0c74C5675";
 const CONTRACT_ADDRESS_DegreeIssuance = "0x0ACd8dfb234D62D8326dBf7507e3104826e0b5df";
 const ALCHEMY_KEY = process.env.ALCHEMY_API_KEY
 const PRIVATE_KEY =process.env.SEPOLIA_PRIVATE_KEY;
 const provider = new ethers.JsonRpcProvider(`https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_KEY}`);
 const signer = new ethers.Wallet(PRIVATE_KEY, provider);
 console.log(signer)
//  const contract = new ethers.Contract(CONTRACT_ADDRESS_DIT,ABI_FILE1.abi,signer)
//  console.log(contract)

async function main(){
    try {
        console.log("Provider:", provider);

        // Fetch and display network details
        const network = await provider.getNetwork();
        console.log("Network:", network);

        // Fetch and display the latest block number
            // const blockNumber = await provider.getBlockNumber();
            // console.log("Latest block number:", blockNumber);

            // // Optional: Initialize contract to test connection
            // const abi1 = require(ABI_FILE1).abi;
            // const contract = new ethers.Contract(CONTRACT_ADDRESS_DIT, abi1, signer);
            // console.log("Contract initialized:", contract.address);
    }catch(error){
        console.log(error)
    }
    
    
    
}
main()
.then(() => process.exit(0))
.catch((error) => {
    console.error(error);
    process.exit(1);
    });





 
    
   
    
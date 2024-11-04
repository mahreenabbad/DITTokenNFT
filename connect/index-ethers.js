
require("dotenv").config()
const {ethers} = require('ethers');

// var fs = require('fs');

// var ethers = require('ethers')
// const fsPromises = fs.promises;
// Contract addresses
const ABI_FILE1 = "./DITToken.json";
const ABI_FILE2= "./DegreeIssuance.json";
 const CONTRACT_ADDRESS_DIT = "0x0cC59f28cF28d52087E6beABa3cBb0Bd46d79580";
 const CONTRACT_ADDRESS_DegreeIssuance = "0x534F1834f199B91762e1B821408Fb1D501604138";
 const ALCHEMY_KEY = process.env.ALCHEMY_API_KEY
 const PRIVATE_KEY =process.env.SEPOLIA_PRIVATE_KEY;
 const provider = new ethers.JsonRpcProvider(`https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_KEY}`);


 const signer = new ethers.Wallet(PRIVATE_KEY, provider);

 const contract1 = new ethers.Contract(CONTRACT_ADDRESS_DIT,ABI_FILE1,signer)
 

async function readContract(){
    try {
      
       const initialSupply = await contract1.initialSupply()
        console.log("initialSupply: " , initialSupply);
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
(async () => {
    // First, read the contract to get the initial state
    await readContract()
    // Next, write to the contract and wait for the transaction to complete
    // await writeContract()
   
})().catch(console.error)




 
    
   
    
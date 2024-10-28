
require("dotenv").config();
// var fs = require('fs');

var ethers = require('ethers')
// const fsPromises = fs.promises;
// Contract addresses
const ABI_FILE1 = '../../artifacts/contracts/DITToken.sol/DITToken.json';
const ABI_FILE2= '../../artifacts/contracts/DegreeIssuance.sol/DegreeIssuance.json';
 const CONTRACT_ADDRESS_DIT = "0x677C5a4ba14F5Ec512106E905D008B73b2d5dcb5";
 const CONTRACT_ADDRESS_DegreeIssuance = "0x28A8B59A41DeDBa6C9C9c44e721dB139E50bb4b8";

// async function getAbi(){
//   const data = await fsPromises.readFile(ABI_FILE_PATH)
//   const abi = JSON.parse(data)['abi']
//   return abi;
// }
async function main(){
  const ALCHEMY_API_KEY = process.env.ALCHEMY_API_KEY
  let provider = new ethers.getDefaultProvider(`https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY}`);
  
  //  const abi = await getAbi();
 

  const SEPOLIA_PRIVATE_KEY =process.env.SEPOLIA_PRIVATE_KEY;

  let signer = new ethers.Wallet(SEPOLIA_PRIVATE_KEY, provider);
  console.log(signer)

  const contract = new ethers.Contract(CONTRACT_ADDRESS_DIT,ABI_FILE1.abi,signer)
  console.log(contract)
  
}
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });





 
    
   
    
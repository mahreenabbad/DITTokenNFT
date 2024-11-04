 const {ethers} = require('hardhat');
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
 
 const INITIAL_SUPPLY = ethers.parseUnits("100000",18);


module.exports = buildModule("DITTokenModule", (m) => {

  const ditToken = m.contract("DITToken",[INITIAL_SUPPLY]);

  return { ditToken };
});

// contractAddress 0x677C5a4ba14F5Ec512106E905D008B73b2d5dcb5
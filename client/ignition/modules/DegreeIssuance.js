
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
 

const DITContract = "0x8DFac0548ff9605a6069ba7Aa0A348b0c74C5675"


module.exports = buildModule("DegreeIssuanceModule", (m) => {

  const ditToken = m.contract("DegreeIssuance", [DITContract]);

  return { ditToken };
});

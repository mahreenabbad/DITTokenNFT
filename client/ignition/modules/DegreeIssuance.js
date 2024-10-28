
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
 

const DITContract = "0x677C5a4ba14F5Ec512106E905D008B73b2d5dcb5"


module.exports = buildModule("DegreeIssuanceModule", (m) => {

  const ditToken = m.contract("DegreeIssuance", [DITContract]);

  return { ditToken };
});
//DegreeIssuance 0x28A8B59A41DeDBa6C9C9c44e721dB139E50bb4b8
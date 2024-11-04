import {
    loadFixture,
  } from "@nomicfoundation/hardhat-toolbox/network-helpers.js";
  import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs.js";
  import { ethers } from "hardhat";
  

  
  

describe("DITToken", function(){
    async function runEveryTIme(){
        const [owner, otherAddress] = await ethers.getSigner();
        const DITToken = await ethers.getContractFactory("DITToken");
         const INITIAL_SUPPLY = 100000*10**18
        const ditToken = await DITToken.deploy( INITIAL_SUPPLY, 18);
        return {ditToken, owner, otherAddress}
    }
    describe("Initial supply", function(){
       it("should check initial supply", async function(){
        const {ditToken}= await loadFixture(runEveryTIme)
        console.log(ditToken)
       })
    })
})
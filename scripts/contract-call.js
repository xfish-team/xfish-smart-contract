const hre = require("hardhat");

async function main() {
  const MyContract = await hre.ethers.getContractFactory("XfishToken");
  const contract = MyContract.attach(
    "0xF03Aa859184dD623b2bd4e0caeE86A38907715c8"
  );
  //   const amount = hre.ethers.parseUnits(2000, 18);

  // Now you can call functions of the contract
  await contract.addToWhiteList("0x1210e1c757a654a00c2c8557d1851f2d9d0dc92b");
  await contract.setUniswapV2Pool("0x1210e1c757a654a00c2c8557d1851f2d9d0dc92b");
  await contract.setLocked(false);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

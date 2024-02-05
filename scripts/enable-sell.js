const hre = require("hardhat");

async function main() {
  const MyContract = await hre.ethers.getContractFactory("XfishToken");
  const contract = MyContract.attach(
    "0xF03Aa859184dD623b2bd4e0caeE86A38907715c8"
  );

  await contract.removeFromBlackList(
    "0x9E9D6beC87f6505f3F06b79e693E18A2954e0Be3"
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

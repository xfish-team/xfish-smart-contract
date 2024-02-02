const hre = require("hardhat");

async function main() {
  const xfishToken = await hre.ethers.deployContract("XfishToken");
  await xfishToken.waitForDeployment();
  console.log(`Xfish deployed to ${xfishToken.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

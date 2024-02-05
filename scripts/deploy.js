const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  const accountBalance = await deployer.provider.getBalance(deployer.address);
  console.log(
    "Deploying the contracts with the account:",
    await deployer.getAddress()
  );

  console.log("Account balance:", accountBalance.toString());

  const xfishToken = await hre.ethers.deployContract("XfishToken");
  await xfishToken.waitForDeployment();

  console.log("XfishToken address:", xfishToken.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

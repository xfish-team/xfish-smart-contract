require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
  sourcify: {
    enabled: true,
  },
  etherscan: {
    apiKey: {
      arbitrumOne: "BDP1JMZ8GN18S6GP761RV5UD3W78S1F24H",
    },
  },
  networks: {
    hardhat: {
      chainId: 1337,
    },
    arbitrumSepolia: {
      url: "https://sepolia-rollup.arbitrum.io/rpc",
      chainId: 421614,
      accounts: [],
    },

    arbitrumOne: {
      url: "https://arb1.arbitrum.io/rpc",
      accounts: {},
    },
  },
};

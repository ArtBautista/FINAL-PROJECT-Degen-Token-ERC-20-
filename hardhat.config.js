require("@nomicfoundation/hardhat-toolbox");
const FORK_FUJI = false
const FORK_MAINNET = false
let forkingData = undefined;

if (FORK_MAINNET) {
  forkingData = {
    url: 'https://api.avax.network/ext/bc/C/rpcc',
  }
}
if (FORK_FUJI) {
  forkingData = {
    url: 'https://api.avax-test.network/ext/bc/C/rpc',
  }
}


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    hardhat: {
      gasPrice: 225000000000,
      chainId: !forkingData ? 43112 : undefined, //Only specify a chainId if we are not forking
      forking: forkingData
    },
    fuji: {
      url: 'https://api.avax-test.network/ext/bc/C/rpc',
      gasPrice: 225000000000,
      chainId: 43113,
      accounts: [
         "705c39e759670f8ccace906622cfcd82c296e0b51d6a192909a9836d68b8e4e2"
      ]
    },
    mainnet: {
      url: 'https://api.avax.network/ext/bc/C/rpc',
      gasPrice: 225000000000,
      chainId: 43114,
      accounts: [
         "705c39e759670f8ccace906622cfcd82c296e0b51d6a192909a9836d68b8e4e2"
      ]
    }
  },
    // ...rest of the config...
    etherscan: {
      apiKey: "C6MAGBNYDCQ551RN276MFRJ73A39KF1AD3",
    },
  
  
}

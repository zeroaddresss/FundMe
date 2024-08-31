# FundMe 🚀💰

![Solidity Version](https://img.shields.io/badge/Solidity-^0.8.18-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen)

FundMe is a decentralized crowdfunding smart contract built on Ethereum. It allows users to fund projects with ETH, automatically converts the amount to USD using Chainlink price feeds, and enables the contract owner to withdraw funds securely.

## 🌟 Key Features

- 💸 Accept ETH contributions
- 🔗 Real-time ETH/USD conversion using Chainlink price feeds
- 🔒 Secure fund withdrawal
- 🧪 Comprehensive test suite for robust functionality
- 🛠 Configurable for multiple networks (Sepolia, Anvil)

## 🚀 Quick Start

### Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation.html)
- [Git](https://git-scm.com/downloads)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/zeroaddresss/FundMe.git
   cd FundMe
   ```

2. Install dependencies:
   ```bash
   forge install
   ```

3. Compile the contracts:
   ```bash
   forge build
   ```

4. Run tests:
   ```bash
   forge test
   ```

### Basic Usage

To deploy the contract:

```bash
forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
```

## 📚 Detailed Documentation

### Contract Overview

The FundMe contract allows users to:

1. Fund the contract with ETH (minimum 5 USD equivalent)
2. Withdraw funds (only contract owner)
3. Get the current price feed version
4. View funding information

### Key Functions

- `fund()`: Allows users to fund the contract
- `withdraw()`: Allows the owner to withdraw all funds
- `getVersion()`: Returns the current price feed version
- `getConversionRate()`: Converts ETH to USD

### Configuration

The contract uses `HelperConfig.s.sol` for network-specific configurations:

- Sepolia testnet: Uses the actual Chainlink price feed
- Local Anvil chain: Deploys a mock price feed for testing

## 💡 Examples and Use Cases

### Funding the Contract

```solidity
// Assume 1 ETH = $2000 USD
uint256 amountToSend = 1 ether;
fundMe.fund{value: amountToSend}();
```

### Withdrawing Funds (Owner Only)

```solidity
fundMe.withdraw();
```

## 📁 Project Structure

```
fundme-contract/
├── src/
│   ├── FundMe.sol
│   └── PriceConverter.sol
├── script/
│   ├── DeployFundMe.s.sol
│   └── HelperConfig.s.sol
├── test/
│   ├── FundMeTest.t.sol
│   └── mocks/
│       └── MockV3Aggregator.sol
└── README.md
```

## 🛠 Dependencies

- Solidity ^0.8.18
- Foundry
- Chainlink Contracts

## 🧪 Testing

Run the test suite with:

```bash
forge test
```

For more verbose output:

```bash
forge test -vvvvv
```

## 🚢 Deployment

1. Set up your environment variables:
   ```
   export RPC_URL=your_rpc_url
   export PRIVATE_KEY=your_private_key
   ```

2. Deploy to your chosen network:
   ```bash
   forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
   ```

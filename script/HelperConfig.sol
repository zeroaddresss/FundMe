// SPDX-License-Identifier: MIT

// Our objective is to interact with the on-chain price feed.
// For this purpose, I use a local Anvil chain for conducting off-chain simulations to conserve RPC calls.
// Hence, we employ a mock that simulates the price feed.

pragma solidity ^0.8.18;

import { Script } from "forge-std/Script.sol";
import { MockV3Aggregator } from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {

  NetworkConfig public activeNetworkConfig;
  uint8 public constant DECIMALS = 8;
  int256 public constant INITIAL_PRICE = 2000e8;

  struct NetworkConfig {
    address priceFeed; // ETH/USD price feed
    // any other details
    // e.g., VRF address
  }

  constructor() {
    if (block.chainid == 11155111) {
      activeNetworkConfig = getSepoliaEthConfig();
    } else {
      activeNetworkConfig = getOrCreateAnvilEthConfig();
    }
  }

  function getSepoliaEthConfig() public pure returns(NetworkConfig memory) {
    NetworkConfig memory sepoliaConfig = NetworkConfig({
      priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
    });
    return sepoliaConfig;
  }

  function getOrCreateAnvilEthConfig() public returns(NetworkConfig memory) {
    if (activeNetworkConfig.priceFeed != address(0)) {
      return activeNetworkConfig;
    }

    vm.startBroadcast();
    MockV3Aggregator mockPriceFeed = new MockV3Aggregator(DECIMALS, INITIAL_PRICE);
    vm.stopBroadcast();

    NetworkConfig memory anvilConfig = NetworkConfig({
      priceFeed: address(mockPriceFeed)
    });
    return anvilConfig;
  }

}

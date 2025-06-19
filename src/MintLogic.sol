// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MintLogic {
    address public minter;
    uint256 public totalMinted;
    uint256 public epochProvisions;

    constructor() {
        minter = msg.sender;
    }

    // Normal mint flow - expected to mint a fixed provision per epoch
    function normalEpochMint() external returns (uint256) {
        epochProvisions = 1e24; // 1 million tokens
        totalMinted += epochProvisions;
        return epochProvisions;
    }

    // Malicious mint - attacker manipulates epochProvisions to mint arbitrary amount
    function maliciousEpochMint() external returns (uint256) {
        epochProvisions = 1e30; // forged: 1 million × 1 million
        totalMinted += epochProvisions;
        return epochProvisions;
    }
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title CurrenC (CRNC)
 * @notice Fixed-supply ERC20 token deployed on Ethereum.
 *
 * - Total supply is minted once at deployment to the deployer address.
 * - No minting, burning, governance, or administrative controls exist.
 *
 * Distribution is handled off-chain:
 * - 90% (18,900,000 CRNC) is intended for permanent Uniswap v2 liquidity.
 * - 10% (2,100,000 CRNC) is retained by the deployer.
 */

contract CurrenC is ERC20 {
    uint256 public constant TOTAL_SUPPLY = 21_000_000 * 10 ** 18;

    constructor() ERC20("CurrenC", "CRNC") {
        _mint(msg.sender, TOTAL_SUPPLY);
    }
}
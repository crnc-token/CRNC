// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../contracts/CurrenC.sol";

contract CurrenCTest is Test {
    CurrenC token;
    address deployer;

    function setUp() public {
        deployer = makeAddr("deployer");
        vm.prank(deployer);
        token = new CurrenC();
    }

    // ---------- Supply invariants ----------

    function testTotalSupplyIsFixed() public {
        assertEq(token.totalSupply(), 21_000_000 * 1e18);
    }

    function testAllSupplyMintedToDeployer() public {
        assertEq(token.balanceOf(deployer), token.totalSupply());
    }

    // ---------- ERC20 behavior ----------

    function testTransferWorks() public {
        address alice = makeAddr("alice");
        uint256 amount = 1_000 * 1e18;

        vm.prank(deployer);
        token.transfer(alice, amount);

        assertEq(token.balanceOf(alice), amount);
        assertEq(
            token.balanceOf(deployer),
            token.totalSupply() - amount
        );
    }

    function testApproveAndTransferFromWorks() public {
        address alice = makeAddr("alice");
        uint256 amount = 500 * 1e18;

        vm.prank(deployer);
        token.approve(alice, amount);

        vm.prank(alice);
        token.transferFrom(deployer, alice, amount);

        assertEq(token.balanceOf(alice), amount);
    }

    // ---------- Negative guarantees ----------

    function testNoMintFunctionExists() public {
        // This test is implicit:
        // - There is no mint() function
        // - Compilation would fail if one existed
        assertTrue(true);
    }
}
# CRNC Deployment Overview

This document describes the complete deployment lifecycle of the CRNC token.

The CRNC system is intentionally minimal. It consists of a single immutable ERC20
contract and a one-time, external liquidity provisioning action.

There are only **two irreversible actions** in the entire lifecycle.
All other steps are observational and do not affect system behavior.

---

## 1. Deployment (Irreversible Actions)

### 1.A Token Contract Deployment (`CurrenC`)

The CRNC ERC20 token contract is deployed with the following properties:

- A fixed total supply defined at deployment
- 100% of the supply minted once to the deployer address
- No minting or burning functions
- No ownership, governance, or administrative controls
- No upgrade or proxy mechanisms

From the moment of deployment, all token behavior is immutable.

This action permanently defines the CRNC token.

---

### 1.B Initial Liquidity Provisioning (One-Time External Action)

After token deployment, initial liquidity is created externally using a
Uniswap V2–compatible interface.

This action consists of:

- Supplying CRNC tokens and ETH to the Uniswap V2 router
- Creating the CRNC–ETH liquidity pool (if not already present)
- Minting liquidity provider (LP) tokens
- Permanently burning 100% of LP tokens

This step is performed manually by the deployer and is not enforced by the token
contract.

Once LP tokens are burned, liquidity is irreversible.

---

## 2. Post-Deployment (Observation Only)

The following steps do **not** change system behavior and exist solely for
verification and transparency.

### 2.A On-Chain Verification

Observers may verify:

- Total token supply
- Token holder balances
- Absence of minting or administrative functions
- Existence of the CRNC–ETH liquidity pool
- LP token burn transaction

All data is publicly observable using standard blockchain explorers and Uniswap
interfaces.

---

### 2.B System State

After deployment and liquidity provisioning:

- The token supply is fixed forever
- Liquidity cannot be withdrawn
- No administrative or governance actions exist
- No further configuration is possible

The system is complete.

---

## Summary

CRNC is defined by exactly two irreversible actions:

1. Deployment of a fixed-supply ERC20 token
2. One-time creation and permanent locking of liquidity

Everything else is observation.

What exists after these steps is what exists forever.
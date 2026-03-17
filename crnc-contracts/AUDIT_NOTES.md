# CRNC Audit Notes
CurrenC (CRNC) — Fixed-Supply ERC-20 on Ethereum

---

## Design Philosophy

CRNC is designed around constraint rather than control.

By minimizing functionality and eliminating administrative pathways, the contract reduces attack surface and ensures that all behavior is fixed at deployment.

---
Contract Address:
0x47d13fb0803409c7fe169a210d4e906165f1a432

---

## 1. Contract Overview

CRNC is a minimal, fixed-supply ERC-20 token deployed on Ethereum mainnet.

Design principles:
- Simplicity
- Immutability
- No administrative control
- No ongoing token issuance

The contract inherits from OpenZeppelin ERC20 and mints the entire supply once during deployment.

---

## 2. Supply Properties

- Total supply: 21,000,000 CRNC
- Minted once at deployment via constructor
- Mint recipient: deployer address
- No additional tokens can ever be created

### Guarantees

- No internal minting logic exists beyond constructor
- No external mint function exists
- No function callable by any address can increase supply
- No upgradeability or proxy pattern exists that could introduce minting later

---

## 3. Burn Properties

CRNC does NOT support burning.

### Guarantees

- No internal burn logic is implemented
- No external burn function exists
- No function callable by users or contracts can reduce total supply
- No allowance-based burn (e.g. burnFrom) exists
- No hidden or indirect mechanism exists to destroy tokens at contract level

Note:
Users may send tokens to irrecoverable addresses (e.g. 0x000...dead), but this is not a contract-level burn mechanism and does not alter totalSupply.

---

## 4. Administrative & Control Surface

CRNC has no administrative layer.

### Guarantees

- No owner role exists
- No Ownable or AccessControl inheritance
- No privileged addresses
- No pausable functionality
- No blacklist or whitelist
- No fee modification capability
- No parameter tuning functions

---

## 5. Upgradeability

CRNC is not upgradeable.

### Guarantees

- No proxy pattern is used
- No delegatecall logic exists
- No upgrade hooks exist
- Contract code is immutable post-deployment

---

## 6. External Dependencies

- OpenZeppelin ERC20 (standard implementation)

### Notes

- No custom modifications to ERC20 logic
- No external contract calls in CRNC logic
- No reliance on oracles or third-party state

---

## 7. Transfer Mechanics

CRNC follows standard ERC-20 behavior.

### Guarantees

- No transfer fees
- No tax logic
- No rebasing
- No reflection mechanics
- No transfer restrictions
- No anti-bot or anti-whale logic

All transfers are direct balance updates per ERC20 standard.

---

## 8. Bytecode Reproducibility

The deployed contract bytecode has been verified against the local build.

### Result

- Runtime bytecode matches exactly (excluding metadata trailer)
- Differences observed are limited to Solidity metadata encoding
- No differences in executable logic

### Conclusion

The deployed contract corresponds to the source code in this repository.

---

## 9. Attack Surface Summary

Given the design, the attack surface is minimal.

### Key Observations

- No privileged functions to exploit
- No external calls that introduce reentrancy risk
- No arithmetic complexity beyond ERC20 standard
- No state mutation beyond balances and allowances

---

## 10. Risk Considerations

This contract intentionally omits advanced features.

### Tradeoffs

- No ability to recover tokens sent incorrectly
- No ability to modify or upgrade behavior
- No emergency controls

These are deliberate design choices aligned with immutability.

---

## 11. Summary

CRNC is a minimal, fixed-supply ERC-20 token with:

- No minting beyond deployment
- No burning functionality
- No admin control
- No upgradeability
- No fees or transfer logic modifications

The contract is intentionally constrained to reduce complexity and attack surface.

---

## 12. Scope for External Review

Any independent review or audit of CRNC should focus on verifying or confirming the following:

- Fixed total supply of 21,000,000 CRNC
- Minting occurs only once in the constructor at deployment
- No minting functions exist post-deployment
- No burn mechanisms exist at the contract level
- Absence of privileged roles or administrative controls
- Non-upgradeability (no proxy or delegatecall patterns)
- Standard ERC20 behavior (transfers and allowances)
- Bytecode equivalence between deployed contract and repository source

Due to the minimal and immutable design, the review scope is expected to be straightforward and narrowly defined.
# CRNC Audit Notes
CurrenC (CRNC) — Fixed-Supply ERC-20 on Ethereum

---

## Scope

This document covers the security properties, design guarantees, and review process of the CRNC ERC-20 smart contract.

In scope:
- The deployed CRNC token contract
- Supply mechanics and transfer behavior
- Contract-level security properties
- Internal validation and third-party audit outcomes

Out of scope:
- Token distribution and holder analysis
- Market behavior or liquidity conditions
- External integrations (DEXs, bridges, etc.)
- Off-chain infrastructure

---

## Design Philosophy

CRNC is designed around constraint rather than control.

By minimizing functionality and eliminating administrative pathways, the contract reduces attack surface and ensures that all behavior is fixed at deployment.

Security is achieved through the absence of discretionary mechanisms, rather than reliance on governance or intervention.

---

## Contract Summary

- Standard ERC-20 implementation based on OpenZeppelin
- Fixed total supply: 21,000,000 tokens
- All tokens minted at deployment
- No mint or burn functions exposed
- No ownership or privileged roles
- No upgradeability or proxy pattern

---

**Contract Address:**
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

- No minting logic exists beyond the constructor execution
- No external mint function exists
- No callable function can increase total supply
- No upgradeability or proxy pattern exists that could introduce minting

---

## 3. Burn Properties

CRNC does NOT support burning.

### Guarantees

- No burn logic is implemented
- No external burn function exists
- No callable function can reduce total supply
- No allowance-based burn (e.g. burnFrom) exists
- No indirect mechanism exists to destroy tokens at the contract level

Note:
Users may send tokens to irrecoverable addresses (e.g. 0x000...dead), but this does not alter totalSupply.

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

- Runtime bytecode matches (excluding metadata trailer)
- Differences are limited to Solidity metadata encoding
- No differences in executable logic

### Reproducibility

The deployed bytecode can be reproduced using:
- forge build
- forge inspect CurrenC bytecode

### Conclusion

The deployed contract corresponds exactly to the source code in this repository.

---

## 9. Test Coverage Summary

The contract has been tested using Foundry.

Test cases include:
- Total supply minted at deployment
- Absence of mint function
- Total supply remains constant
- Standard transfer functionality
- Approval and transferFrom behavior

All tests pass successfully with no failures.

---

## 10. Internal Review and Validation

Prior to third-party audit, the contract underwent internal validation and static analysis.

### Methods

- Foundry-based unit testing
- Slither static analysis
- Bytecode and storage verification

### Objective

To confirm:
- Correctness of ERC20 behavior
- Enforcement of supply constraints
- Absence of privileged or hidden logic
- Minimal and predictable execution surface

This phase served as a preliminary validation step before external review.

---

## 11. Third-Party Audit (HackenProof)

Following internal validation, CRNC was submitted for independent audit via HackenProof.

### Outcome

- No vulnerabilities identified
- Findings limited to informational and low-severity observations
- No changes required to the deployed contract

The audit confirmed that the contract behaves as designed and that its minimal structure effectively limits attack surface.

### Report

The full audit report is available in:

`crnc-contracts/audit/crnc-hackenproof-audit-2026-04-24.pdf`

---

## 12. Threat Model

The CRNC contract minimizes attack surface through constraint-based design.

### Risks Considered

- Unauthorized token minting (inflation)
- Privileged access or control functions
- Supply manipulation via burn or re-mint
- Hidden upgrade or proxy-based behavior

### Mitigation Approach

- No exposed mint or burn functions
- No ownership or role-based permissions
- Immutable deployment with no upgrade path
- Minimal contract logic using standard ERC-20 patterns

---

## 13. Attack Surface Summary

Given the design, the attack surface is minimal.

### Key Observations

- No privileged functions
- No external calls introducing reentrancy risk
- No arithmetic complexity beyond ERC20 standard
- State changes limited to balances and allowances

---

## 14. Risk Considerations

This contract intentionally omits advanced features.

### Tradeoffs

- No ability to recover tokens sent incorrectly
- No ability to modify or upgrade behavior
- No emergency controls

These are deliberate design choices aligned with immutability and reduced trust assumptions.

---

## 15. Summary

CRNC is a minimal, fixed-supply ERC-20 token with:

- No minting beyond deployment
- No burning functionality
- No admin control
- No upgradeability
- No fees or transfer logic modifications

The contract is intentionally constrained to reduce complexity and attack surface.

The completed third-party audit confirms that these design choices do not introduce exploitable vulnerabilities.

---

## 16. Scope for External Review

Any independent review or audit of CRNC should focus on verifying:

- Fixed total supply of 21,000,000 CRNC
- Minting occurs only once in the constructor
- No minting functions exist post-deployment
- No burn mechanisms exist at the contract level
- Absence of privileged roles or administrative controls
- Non-upgradeability (no proxy or delegatecall patterns)
- Standard ERC20 behavior (transfers and allowances)
- Bytecode equivalence between deployed contract and repository source

The review scope is intentionally narrow due to the contract's minimal and immutable design.
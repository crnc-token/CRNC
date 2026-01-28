# CRNC — Fixed-Supply ERC20 with Permanent Liquidity

CRNC is a fixed-supply ERC20 token designed to demonstrate a clean, transparent,
and irreversible token launch using modern best practices.

This repository contains the complete, immutable smart contract code for the
CRNC token.

CRNC is intentionally minimal, non-upgradable, and designed with explicit
constraints enforced entirely on-chain.

> **Disclaimer**
>
> CRNC is a decentralized digital asset implemented as immutable smart contracts.
> This repository and its documentation are provided for informational and
> technical purposes only and do not constitute financial, investment, legal,
> or tax advice.
>
> CRNC does not represent equity, ownership, a claim on assets, or a promise of
> future development or value.

---

## Contract

### CurrenC (ERC20)

- Fixed total supply defined at deployment
- 100% of supply minted once at deployment
- No minting or burning after deployment
- No ownership, governance, or administrative controls
- Standard ERC20 behavior only

---

## Liquidity Model

Initial liquidity is created externally on Uniswap V2 by supplying CRNC tokens
and ETH.

Liquidity provider (LP) tokens are permanently burned after creation, making
liquidity non-withdrawable and non-custodial.

Liquidity provisioning is not enforced by the token contract and occurs exactly
once by convention.

---

## Design Principles

- Explicit constraints over flexibility
- Minimal attack surface
- No upgrade paths
- No governance assumptions
- No reliance on off-chain enforcement

What is deployed is what exists forever.

---

## What This System Is Not

- Not a governance token
- Not upgradeable
- Not yield-generating
- Not price-stable
- Not administratively managed

---

## Testing

Security-critical properties are validated using Foundry tests, including:

- Total supply correctness
- Absence of mint and burn functions
- Absence of administrative controls
- Standard ERC20 transfer behavior

---

## Documentation

- `SECURITY.md` — threat model, security assumptions, and enforced properties
- `DEPLOYMENT.md` — public description of the deployment and initialization sequence

---

## License

MIT
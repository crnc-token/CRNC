# Security Policy & Design Considerations

This document describes the security model, assumptions, enforced properties,
and explicit limitations of the CRNC smart contract system.

CRNC is intentionally designed to minimize trust, eliminate administrative
discretion, and reduce the system’s attack surface to the smallest practical
footprint.

---

## System Overview

The CRNC system consists of a single immutable smart contract:

- **CurrenC** — fixed-supply ERC20 token

There are no auxiliary contracts, no upgrade mechanisms, and no privileged roles.

Initial liquidity provisioning is performed externally and is not enforced by
the token contract.

---

## Threat Model

The CRNC contract is designed to protect against:

- Unauthorized token minting
- Supply inflation or deflation
- Administrative abuse or discretionary control
- Proxy or upgrade-based attacks
- Hidden execution paths or deferred logic

The system assumes a hostile external environment and makes no trust assumptions
about future actors, including the original deployer.

---

## Explicit Non-Goals

The system intentionally does **not** attempt to protect against:

- Market volatility or price risk
- Liquidity depth changes
- External protocol failures (DEXs, chain, infrastructure)
- User key compromise
- Off-chain operational mistakes
- Miner / validator ordering (MEV)

CRNC is not designed to guarantee price stability, returns, or adoption.

---

## Administrative & Governance Model

### No Ongoing Administration

After deployment:

- There is no administrator
- There are no privileged roles
- There are no adjustable parameters
- There are no emergency controls
- There are no governance mechanisms

The system does not rely on human discretion after launch.

### Deployment Trust Assumption (One-Time)

A single, unavoidable trust assumption exists during deployment:

- The deployer must correctly:
  - Deploy the token contract
  - Perform the intended initial liquidity provisioning
  - Permanently burn LP tokens

This trust assumption expires once liquidity is provisioned and LP tokens are
burned.

---

## Liquidity & Asset Safety

### Liquidity Provisioning

Liquidity is created externally by supplying CRNC tokens and ETH to a Uniswap V2
router.

Liquidity provider (LP) tokens are burned immediately after creation.

### Post-Provisioning Properties

After LP token burn:

- Liquidity cannot be withdrawn
- LP tokens cannot be recovered
- The liquidity pool is non-custodial
- No contract-level mechanisms exist to modify liquidity

Liquidity permanence is enforced by Uniswap mechanics, not custom code.

---

## Immutability Properties

Once deployed:

- Contract bytecode cannot be modified
- No proxy or upgrade patterns exist
- Total supply is fixed forever
- No mint or burn functions exist
- No ownership or role transfers exist
- No migration paths exist

Day 1 behavior is identical to all future behavior.

---

## Testing & Verification

Security-critical properties are validated via Foundry tests, including:

- Correct total supply issuance
- Absence of mint and burn functionality
- Absence of administrative controls
- Standard ERC20 transfer behavior

Uniswap integration behavior is validated through on-chain observability rather
than enforced contract logic.

---

## Residual Risk Summary

After deployment and liquidity provisioning, residual risk is limited to:

- External protocol risk
- Market behavior
- User custody practices

There is no ongoing smart-contract-level administrative risk.

---

## Responsible Disclosure

This repository is provided as-is.

No formal bug bounty program is currently offered.

Responsible disclosure of critical issues is encouraged via GitHub issues or
direct communication with the repository maintainer.

---

> CRNC does not attempt to be flexible.  
> It attempts to be finished.
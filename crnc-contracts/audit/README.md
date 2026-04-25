# CRNC Contract — Audit Artifacts

This folder contains audit-related materials for the CRNC ERC-20 contract, including independently generated analysis artifacts and a completed third-party audit.

---

## Third-Party Audit

CRNC has undergone an independent security review via HackenProof.

- No vulnerabilities identified
- Findings limited to informational and low-severity observations
- No changes required to the deployed contract

Full audit report:
- `crnc-hackenproof-audit-2026-04-24.pdf`

---

## Tools Used

- Slither — static analysis
- Foundry — testing, coverage, ABI inspection, storage layout, and bytecode inspection

---

## Files

### Static Analysis
- `slither-report.txt`

### Test & Coverage
- `foundry-test-report.txt`
- `foundry-coverage-report.txt`

### Contract Interface & Structure
- `foundry-abi.txt`
- `foundry-storage-layout.txt`

### Bytecode & Reproducibility
- `foundry-bytecode.txt`
- `foundry-deployed-bytecode.txt`

---

## Notes

- These artifacts were generated using open-source tools.
- They are provided for transparency and independent verification.
- They complement the third-party audit report but do not replace it.
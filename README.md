# XION Epoch Mint Logic Exploit – Proof of Concept

This repository contains only the **attack logic** (`src/MintLogic.sol`) used in the bug report.

To verify the bug:

1. Clone this repo
2. Create a Foundry project (`forge init`)
3. Add this contract to `src/`
4. Create a simple test in `test/MintLogic.t.sol` calling both minting functions
5. Run: `forge test -vv`

Expected result:
- `normalEpochMint()` mints `1e24` tokens
- `maliciousEpochMint()` mints `1e30` tokens due to a forged `epochProvisions` value

This confirms the bug where unvalidated mint logic leads to **unbounded inflation**.


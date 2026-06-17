# 0003 — Closing the learning loops (conversion-wins + project-scoped taste)

**Status:** Accepted · **Date:** 2026-06-17

## Context
The collection claims to learn over time, but two loops were open:
- `conversion-wins.md` was *read* at session start to bias decisions but never *written* — so it
  stayed empty and the claim was hollow.
- `taste-ledger.md` was a single global ledger. Consecutive projects often want opposite aesthetics
  (luxury store vs. distrust-the-fluff fintech), so a global taste bias actively harms the next one.

## Decision
1. **Conversion-wins capture (CAPTURE phase).** After handoff, append one row per shipped
   accountable-WOW bet (decision, metric, experiment + threshold, status `pending`). When the user
   reports a result, update the row to `won`/`lost` with the observed lift. This is the only step
   that populates the ledger the director reads at session start.
2. **Project-scoped taste.** A per-project override file `<working-dir>/taste.md` takes precedence
   over the global ledger for that project's direction scoring; global entries apply only where the
   project file is silent. Global entries may carry an optional `scope:` (default `global`, or a
   project slug). The winning layer is surfaced in `direction.md`.

## Consequences
The ledgers actually accumulate signal; taste no longer bleeds across unrelated projects; bias is
explicit and challengeable.

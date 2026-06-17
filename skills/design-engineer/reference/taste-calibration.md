# Taste-Calibration Onboarding

Run on **first run only** — detected by an uncalibrated `memory/taste-ledger.md`: the
`## Calibration` section exists but has zero entry rows beneath it. The shipped ledger already
contains the `## Calibration` header with no entries, so key the trigger off the absence of
ENTRIES, not the absence of the header. This aligns with `de-direction`'s "absent OR has no
entries → proceed without bias".

## First-run flow

1. Fetch 4–6 reference sets from the web (use firecrawl or `shot` boards) covering distinct
   aesthetics: e.g. editorial-minimal, dense-grid, expressive-motion, industrial-brutalist,
   clean-SaaS, ornate-luxury. Present each as a named link or thumbnail.

   **Firecrawl / shot unavailable fallback:** If firecrawl is unavailable or out of credits and
   `shot` boards cannot be produced, do NOT silently skip calibration and do NOT invent aesthetics.
   Instead, present a plain list of named reference URLs — one per aesthetic category — each with a
   one-line prose description of its visual character (e.g. "linear.app — dense dark chrome, tight
   grid, monospaced UI, zero decoration"). At minimum cover: editorial-minimal, cinematic-dark,
   clean-trust, expressive-motion, and one wildcard. The user must have something concrete to react
   to before any calibration verdict is recorded.

2. Ask the user: "Which of these do you love, which do you hate, and crucially — WHY?"
3. Record each verdict in `memory/taste-ledger.md` under `## Calibration` using the schema defined
   there (fields: `pattern`, `verdict`, `why`, `date`).
4. Calibration is incremental — new verdicts append over time; do not overwrite existing entries.

## Later runs

When `## Calibration` already has one or more entry rows, skip onboarding entirely and read the
ledger to bias `de-direction` concept scoring: favour concepts that match `love` patterns, penalise
concepts that echo `hate` patterns. A per-project `<working-dir>/taste.md` override takes precedence
(see the director's "Project-scoped taste"). Surface the applied bias in `direction.md` so it can be
challenged.

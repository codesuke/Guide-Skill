# de-smoke-test.md — End-to-End Smoke Test of the design-engineer Collection

**Date:** 2026-06-17
**Run mode:** default (prompt pack — no `--build`, no production code)
**Source:** written brief (controller decision — cheap & deterministic), not a live scrape.
**Subject:** RailRecruit — 9-year-old WordPress/Elementor railway-signalling training institute.
**Artifacts produced:** `skills/design-engineer/examples/railrecruit/{recon,growth,direction,motion,prompt-pack}.md`

This is the failing-test → run → verify record per Task 10. Each artifact is checked against the contract
in its own SKILL.md. Pass = every required element present and correct; Fail = a required element missing.

---

## Step 1 — Expected artifacts (the "failing test")

| # | Artifact | Contract (must contain) |
|---|---|---|
| 1 | recon.md | 7 sections: Purpose, Audience, Tech stack, Content inventory, Funnel, Design audit, What to keep |
| 2 | growth.md | 7 sections incl. **the ONE primary CTA** + accountable-WOW hypotheses (≥2, ≤5) |
| 3 | direction.md | 3 **scored** concepts → 1 winner (visible scoring), reference board (≥3), token/component spine |
| 4 | motion.md | per-section motion (≥5), **exactly ONE** signature moment from a scored shortlist, motion-vs-tech matrix, a11y/perf floors |
| 5 | prompt-pack.md | one self-contained prompt per section, each carrying spine tokens + motion spec + accountable-WOW block |

---

## Step 2 — Run summary (per phase)

- **RECON (de-recon):** source identified as a written brief → §0 path. Scrape-dependent sections marked
  `[inferred from brief — not scraped]`. `impeccable` not separately invokable → design audit done manually
  against the same checklist (skill explicitly permits this fallback). recon.md written.
- **GROWTH (de-growth):** read recon Purpose/Audience/Funnel/What-to-keep. Evidence skills applied as
  embedded analysis (not separately dispatched in a smoke test); thin points flagged as assumptions and
  turned into hypotheses. ONE CTA locked: "Enroll Now". growth.md written.
- **DIRECTION (de-direction):** taste-ledger `## Calibration` present but **empty** → "no calibration
  entries — proceeding without bias" stated; Taste Bias Applied subsection records the no-bias state. One
  live `firecrawl-search` reference pass run (honors references-before-vibes); remaining concepts cite the
  fetched set + named references (documented fallback). 3 concepts scored → "Clearing House" wins (4.55).
  direction.md written.
- **MOTION (de-motion):** read direction + growth. Reused the fetched references + named motion references.
  4-candidate scored shortlist → "Outcome Ladder" wins (10.40); competing candidates cut. Motion-vs-tech
  matrix + perf/a11y floors locked. motion.md written.
- **HANDOFF (de-handoff, default):** extracted 6-section map from motion.md, spine tokens from direction.md,
  WOW blocks from growth.md. 6 self-contained prompts written, no code. prompt-pack.md written.

---

## Step 3 — Per-artifact PASS/FAIL

### 1. recon.md — **PASS**
- 7 required H2 sections present and in order (Purpose, Audience, Tech stack, Content inventory, Funnel, Design audit, What to keep). ✔
- Hard rule honored: written-brief source, scrape-dependent claims marked `[inferred from brief — not scraped]`; nothing invented beyond the brief. ✔
- "What to keep" lists content/equity only (CPD cert, testimonials, catalog, 9-yr authority, brand name) and explicitly separates brand equity from theme styling. ✔
- Top-3 findings summary present. ✔

### 2. growth.md — **PASS**
- 7 required H2 sections present and in exact order (Primary conversion goal, Funnel, The ONE CTA, Retention hooks, Social-proof placement, SEO structure, Hypotheses). ✔
- The ONE primary CTA established and frozen ("Enroll Now" → /enroll/[course], accent-only, sticky on mobile). ✔
- Friction audit non-empty; every recon friction point has a `Fix:`. ✔
- Hypotheses = 4 (within the 2–5 bound), each a full Accountable-WOW block with all 7 fields filled (Decision, Conversion bet, Metric, Experiment, Instrumentation, Perf gate, A11y gate). ✔

### 3. direction.md — **PASS**
- 3 required H2 sections (Winning Direction, Reference Board, Token + Component Spine). ✔
- Exactly 3 concepts, each scored across the 5 weighted criteria with **visible arithmetic**; one winner ("Clearing House", 4.55); two killed with named reasons; runner-up grafts stated. ✔
- Taste Bias Applied subsection present, recording the no-calibration / no-bias state (challengeable). ✔
- Reference board: 3 references, each with URL + what-to-steal + what-to-adapt + session-fetched flag (meets the ≥3 minimum; not flagged incomplete). ✔
- Token + component spine: color tokens with hex + role + contrast, type scale with non-flat ratio (display ≈ 4× body), spacing rhythm, and 8 core components (covers the required minimum: Button, Heading, Section, Card, CTA Block, Navigation + Pricing/Trust). ✔
- Each concept nominates exactly one signature moment; CTA from growth not overridden. ✔

### 4. motion.md — **PASS**
- All required headers present (Per-Section Motion Architecture; Signature Moment with Shortlist+Scores / Winner / Reduced-Motion Fallback; Motion-vs-Tech Matrix; a11y+Perf Budget with Performance Floors / Accessibility Floors / Signature Moment Under Floor Conflict). ✔
- 6 sections mapped (≥5), each with motion type, intent, trigger, reduced-motion fallback, CLS risk, LCP impact. ✔
- Signature-moment lab: 4 scored candidates (impact×feasibility + conv-bet + perf/a11y) with visible arithmetic → **exactly ONE winner** ("Outcome Ladder", 10.40); competitors explicitly cut, including one cut on the perf floor. ✔
- Motion-vs-tech matrix routes every effect to a tool with reason + sub-skills + reduced-motion override + perf note. ✔
- Perf floors (LCP/CLS/INP/JS budget/GPU layers) + a11y floors (reduced-motion, flash, contrast, focus) stated as hard floors; property audit confirms transform/opacity-only. ✔

### 5. prompt-pack.md — **PASS**
- Header present (generated-by, upstream artifacts, date, total sections=6, signature moment named). ✔
- 6 self-contained section prompts (Hero, Outcome Ladder [signature], Proof, Pricing, Pre-CTA, Footer+Sticky). ✔
- Each prompt carries: spine tokens (shared block + per-section token line), full motion spec (type/intent/trigger/reduced-motion/CLS/LCP/technology), and a complete Accountable-WOW block (6/6 prompts), plus real copy and acceptance criteria. ✔
- Default mode discipline: prompts only, no code, no subagent dispatch; `--build` reminder included. ✔
- Signature moment carried verbatim into exactly one section; ONE CTA passed through unchanged. ✔

**Overall: 5/5 artifacts PASS.** The pipeline produces every required artifact and each meets its contract.

---

## Step 4 — Ambiguities / under-specification found (→ fixes & learnings)

These are NOT artifact failures — every contract passed. They are points where a skill's text left a
reasonable executor guessing, and should be tightened in the skill files (or accepted as intentional).

1. **de-recon / de-growth — evidence-skill invocation in a non-live, single-session run.**
   Both skills are written as if each evidence skill (cro, copywriting, customer-research, seo-audit, etc.)
   is a separately dispatched run. In a cheap written-brief smoke test there is no live data to feed them, so
   they were applied as *embedded analysis*. The skills permit "waived/flagged-as-assumption" but do not
   describe an explicit "embedded vs dispatched" mode. **Fix idea:** add a one-line note that evidence
   passes may be performed inline when no live source/data exists, provided findings are flagged.

2. **de-recon §6 — `impeccable` fallback is covered, but the trigger condition is vague.**
   The skill says "if impeccable is unavailable, perform manually." In this harness impeccable is a Skill,
   technically invokable, but invoking it on a written brief adds little. The skill doesn't address "available
   but low-value to invoke." Handled by manual audit; **learning:** clarify that a manual audit is acceptable
   when there is no rendered/scraped surface for impeccable to inspect.

3. **de-direction §1 — "Aim for 5–8 references" vs the controller's "minimal firecrawl" constraint.**
   The skill pushes for 5–8 fetched references; the smoke-test brief mandates minimal firecrawl. These pull in
   opposite directions. Resolved via the documented degradation (1 fetched pass + named references with
   prose), and the reference board still meets its own ≥3 minimum. **Fix idea:** the skill could acknowledge a
   "budget-constrained" mode where 1 fetched reference + named references is acceptable, distinct from a true
   OFFLINE failure (the current degradation text conflates "out of credits" with "offline").

4. **de-direction §0b — empty `## Calibration` section.**
   The skill distinguishes "absent or has no entries" → proceed without bias. The ledger here *has* the header
   but zero entries; the text covers this ("absent OR has no entries"), so it was unambiguous in practice.
   **No fix needed** — noted as a passing edge case.

5. **de-handoff §4 Copy — testimonial verbatim copy from a brief-only run.**
   The template says paste real copy or write a TBD placeholder. With a written brief there is no real
   testimonial text, so placeholders (`[Real placement quote ...]`) were used per the skill's own instruction.
   Worked as specified. **Learning:** in brief-only runs most "Copy" fields are necessarily invented/placeholder
   — acceptable, but the pack should (and does) flag them so a builder confirms against live data.

6. **Naming nicety (minor):** de-handoff's section-prompt heading template is `## [Section] — Build Prompt`.
   The signature-moment section adds a `*(SIGNATURE MOMENT)*` suffix for emphasis, which breaks a naive
   "ends-with-Build-Prompt" grep. Section count is unambiguous via the 6 Accountable-WOW blocks. **Fix idea:**
   if downstream tooling greps for the heading, keep the suffix on a separate line or standardize it.

---

## Step 5 — Result

All five artifacts exist and pass their contracts in default mode. No phase failed; no re-run was required.
The ambiguities above are tightening opportunities, not blockers. The collection is end-to-end coherent:
recon → growth → direction → motion → handoff each consumed the prior artifact's locked decisions (ONE CTA,
single winning direction, single signature moment, spine tokens) without contradiction.

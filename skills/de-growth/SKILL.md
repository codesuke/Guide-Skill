---
name: de-growth
description: Converts a recon.md into a structured growth.md — primary conversion goal, funnel map, the ONE primary CTA, retention hooks, social-proof placement, SEO structure, and accountable-WOW hypotheses. Use when asked about "conversion strategy", "improve conversion", "retention plan", "growth strategy", "what should this page optimize for", "CTA strategy", "reduce churn", or "growth before direction". Runs after de-recon and before de-direction so conversion goals shape visuals. Does not write production code.
---

# de-growth — Conversion + Retention Strategy into growth.md

> **Artifact location.** Read `recon.md` from and write `growth.md` to the shared working dir
> `<repo-root>/.design-engineer/<project-slug>/` (repo root via `git rev-parse --show-toplevel`,
> else CWD). If `recon.md` is missing there, run `de-recon` first — do not proceed blind. Spec:
> the orchestrator's `reference/artifacts.md`.

## Purpose

Reads `recon.md` (from `de-recon`) and turns raw site intelligence into a conversion brief: the
ONE CTA all later phases serve, a mapped funnel with friction fixes, retention and trust-signal
placement, an SEO hierarchy, and accountable hypotheses each carrying a measurable conversion bet.
`growth.md` is the authority document for conversion intent — `de-direction` and `de-motion` must
not override the ONE CTA or the funnel sequence without explicit sign-off.

## Hard rules

- **Evidence-grounded:** every statement in `growth.md` must be grounded in evidence — from
  `recon.md`, competitor research, or customer data. Invent nothing. If evidence is thin, flag it
  as an assumption and assign it a hypothesis. If any evidence skill (customer-research,
  competitor-profiling, firecrawl-market-research, seo-audit) returns no usable data or is
  unavailable, do not invent findings — flag that point as an explicit assumption and turn it into
  a hypothesis to validate later.
- **Embedded analysis mode:** when the source is a written brief and evidence skills cannot be
  dispatched (no live site, no scrape possible), run every evidence pass INLINE using the brief
  content as the sole data source — apply the same criteria from CRO, copywriting,
  marketing-psychology, etc. against what the brief describes. Mark each such finding as
  `[inferred from brief]`. Do not skip the evidence pass; do not invent facts absent from the brief
  — flag genuine gaps as `[unknown — not in brief]` and assign each gap a hypothesis to validate
  post-launch.
- **The ONE CTA is locked here.** Every page has exactly one primary CTA; secondary actions are
  visually subordinate. Once locked, it is frozen for `de-direction` and `de-motion` — neither may
  replace it without reopening `de-growth`.
- **Friction audit must not be empty.** Every friction point from recon gets a `Fix:` entry. No
  friction found is itself a suspect finding — flag a hypothesis.
- **Hard floors win.** Perf/a11y gates (LCP < 2.5s, CLS = 0, reduced-motion fallback, contrast
  ≥ 4.5:1) beat both conversion and aesthetics. Then conversion wins ties over aesthetics; the
  signature moment is redesigned to serve both, never deleted.
- This skill does NOT write production code, define visual direction/typography/colour/layout
  (`de-direction`), define motion (`de-motion`), or finalise copy (`de-direction` + `copywriting`).

## Procedure overview

1. **Primary goal** — read `recon.md`; state the single most important action the page must drive.
2. **Funnel + friction audit** — run evidence passes, map the journey, attach a `Fix:` to every
   friction point. Full procedure: `reference/funnel-and-friction.md`.
3. **The ONE CTA** — lock the single primary call-to-action (label, destination, value-prop
   contract, placement, visual weight). Frozen for downstream phases.
4. **Retention hooks** — top 3–5 mechanisms, each intercepting a churn moment toward an aha moment.
5. **Social proof** — placed at the funnel's highest-doubt moments, never decoratively.
6. **SEO structure** — head term, intent, long-tails, title/meta/H1 rules, content gap.
7. **Accountable-WOW hypotheses** — 2–5 conversion bets, each a full Accountable WOW block
   (decision + bet + metric + experiment + instrumentation + perf gate + a11y gate).

Write `growth.md` with exactly seven sections in the exact format and the hypothesis template in
`reference/output-format.md`. After writing, emit an inline summary: the ONE CTA locked, top 3
friction fixes, two highest-priority hypotheses.

## Reference

- `reference/funnel-and-friction.md` — read recon → evidence passes → lock ONE CTA → funnel map + friction audit.
- `reference/output-format.md` — exact `growth.md` section structure + the Accountable WOW hypothesis format.
- `reference/accountable-wow.md` — the Accountable WOW template fields.
- `reference/doctrine.md` — the growth-half doctrine and tension-resolution order.

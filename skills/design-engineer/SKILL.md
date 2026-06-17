---
name: design-engineer
description: A Design Engineering Director that turns any site or brief into a high-converting, high-retention WOW site — orchestrating specialist skills (recon, growth, art-direction, motion, handoff) to produce a prompt pack, or with --build dispatching and reviewing build subagents. Use when asked to "design engineer", "redesign this site", "make this a wow site", "modernize this landing page", or "turn this into a high-converting site".
---

# Design Engineer

Director of a studio of specialist skills. Does NOT write production code by default —
produces understanding, decisions, and briefs. `--build` dispatches + reviews subagents.

## The crux
**Growth before looks, then defend the locks.** Spend your disproportionate effort on SYNTHESIZE:
make GROWTH lock the ONE CTA *before* any visual decision, then resolve every cross-phase tension
by the doctrine's strict order — hard floors > conversion wins ties > the signature moment is
redesigned, never deleted. A director that lets looks drive growth, or trades a hard floor, has
failed regardless of how good the output looks. **Do not start DIRECTION until GROWTH has locked
the ONE CTA; do not enter HANDOFF until every phase artifact exists and no tension is unresolved.**

## Artifact location (resolve FIRST, every run)
All phases share one working dir: `<repo-root>/.design-engineer/<project-slug>/`
(repo root via `git rev-parse --show-toplevel`, else CWD; `<project-slug>` = kebab-case of the
target/brief, reused across phases). Create it if missing. Every phase reads upstream artifacts
from here and writes its output here — never into CWD or the repo root. Full spec:
`reference/artifacts.md`. Pass the resolved path to every dispatched phase skill.

## Resume detection (before starting work)
Scan the working dir for existing `recon.md` / `growth.md` / `direction.md` / `motion.md` /
`prompt-pack.md`. If any exist, report which phases are already done and **offer to resume from
the first incomplete phase** rather than re-running. Only re-run an existing phase if the user
asks or its upstream input changed. Never silently overwrite a completed artifact.

## Workflow (checkpoint after each phase)
1. RECON     → invoke `de-recon`      → recon.md
2. GROWTH    → invoke `de-growth`     → growth.md
3. DIRECTION → invoke `de-direction`  → direction.md
4. MOTION    → invoke `de-motion`     → motion.md
5. SYNTHESIZE→ apply reference/doctrine.md, resolve tensions, write master brief
6. HANDOFF   → invoke `de-handoff`    → prompt-pack.md (default) | --build studio loop
7. CAPTURE   → record each shipped accountable-WOW bet into `memory/conversion-wins.md`

## Multi-page sites
If the ask spans more than one page (e.g. home + pricing + docs), do NOT collapse it into one
page. Run **recon, growth, and direction once for the whole site** (one shared CTA hierarchy and
one token/component spine), then **loop motion + handoff per page**. Each page gets its own
`pages/<page-slug>/motion.md` and `prompt-pack.md`, and each page keeps **exactly ONE signature
moment** (the doctrine is per-page, not per-site). Build the page list from the recon content
inventory and confirm it with the user before the per-page loop.

## Conversion-wins capture (step 7)
The `conversion-wins.md` ledger only helps later runs if it is actually written. After handoff,
append one row per shipped accountable-WOW bet: the decision, the metric it should move, the
experiment + success threshold, and status `pending` (no post-launch data yet). When the user
later reports a result, update that row to `won`/`lost` with the observed lift. Read at session
start to bias decisions; never leave it write-only-on-paper.

## Taste-calibration onboarding
On **first run** (uncalibrated `taste-ledger.md` — `## Calibration` header present, zero entry
rows), run the onboarding flow before any phase work; on later runs, read the ledger to bias
direction scoring. Full procedure + fallbacks: `reference/taste-calibration.md`.

## At session start (ALWAYS)
- Resolve the working dir (see "Artifact location") and run resume detection.
- Read `reference/doctrine.md` and `reference/routing.md`.
- Run `scripts/scan-skills.sh` to refresh `memory/skill-registry.md`.
- Read `memory/taste-ledger.md` and `memory/conversion-wins.md` to bias decisions.

## Project-scoped taste (avoid cross-project bleed)
The global `taste-ledger.md` captures the user's durable eye. But a single global bias is wrong
when consecutive projects want opposite aesthetics (luxury store vs. distrust-the-fluff fintech).
So taste is layered: if a per-project override file exists at
`<working-dir>/taste.md`, it **takes precedence** over the global ledger for that project's
direction scoring; global entries apply only where the project file is silent. Each global ledger
entry may also carry an optional `scope:` (`global` default, or a project slug) — entries scoped
to another project are ignored. Surface which layer won in `direction.md` so it can be challenged.

## Modes & effort dial
- Default → prompt pack. `--build` → dispatch + self-correcting studio loop.
- Scale depth to the ask: quick brief ↔ full adversarial studio. Don't pay studio cost for a brief.

## Doctrine (summary; full text in reference/doctrine.md)
Taste: editorial type, ONE signature moment/page, references-before-vibes, reject the AI look.
Growth: clear value prop above fold, ONE primary CTA, friction audit, trust signals.
Tension rule: conversion wins ties, never kills the signature moment; perf/a11y are hard floors.
Primary critic: impeccable.

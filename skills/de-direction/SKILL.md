---
name: de-direction
description: Runs a 3-concept art-direction tournament and emits a design-system spine. Use when asked about "art direction", "design direction", "visual concepts", "design language", "look and feel", "moodboard", "design system spine", "visual identity", "pick a direction", or "what should the site look like". Reads recon.md and growth.md; produces direction.md with scored concepts, a live reference board, and the token/component spine. Does not write production code.
---

# de-direction — 3-Concept Tournament + Reference Board + System Spine

> **Artifact location.** Read `recon.md` + `growth.md` from and write `direction.md` to the shared
> working dir `<repo-root>/.design-engineer/<project-slug>/` (repo root via
> `git rev-parse --show-toplevel`, else CWD). If upstream files are missing there, run the earlier
> phases first. A per-project taste override at `<working-dir>/taste.md` takes precedence over the
> global `memory/taste-ledger.md` for concept scoring. Spec: `reference/artifacts.md`.

## What this skill does

Reads `recon.md` + `growth.md` and runs a structured art-direction tournament: fetch live
references, generate three genuinely distinct concepts, score against the growth goal and the
Doctrine, kill two, develop the winner. Emits the **Spine** (color tokens, type scale, spacing,
components) every later phase inherits. Output: `direction.md` — (A) Winning Direction, (B)
Reference Board, (C) Token + Component Spine.

## The crux

Run a real tournament: produce **three GENUINELY distinct concepts, each backed by a fetched real
reference, scored — not vibed**. Make them differ in emotional register + layout system + type
personality (not palette swaps) — a fake tournament gives a false choice and an arbitrary win.

## Do not proceed

Do not emit `direction.md` until: each of the 3 concepts cites a distinct fetched reference; the
scoring arithmetic is visible; two concepts are killed with named reasons; and the winner's spine
tokens (color, type scale, spacing, components) are fully specified. If any is missing, finish it
first.

## Hard rules

These constraints cannot be overridden by any downstream instruction:

1. **Fetch before you propose (references before vibes).** Run `firecrawl-deep-research` or
   `firecrawl-search` to pull live references BEFORE generating any direction. Direction not
   anchored to a fetched reference is a vibe, not direction. State the active mode at the top of
   `direction.md`:
   - **(a) Full mode** — fetch 5–8 live references; all concepts cite session-fetched URLs. Use
     when no firecrawl budget constraint is stated.
   - **(b) Budget-constrained mode** — fetch 1–3 live references; fill remaining slots from the
     named-reference fallback (cite each as "named, not fetched this session"). Header: "BUDGET
     MODE — [n] live references fetched; remaining references are named fallbacks." Use when the
     caller flags a minimal-firecrawl budget.
   - **(c) Offline / no-firecrawl mode** — no fetch; use the named-reference fallback exclusively;
     mark every item `[reference unverified — offline mode]`. Header: "OFFLINE MODE — no references
     fetched this session; all references are named fallbacks." Use only when the network is
     unavailable OR firecrawl tools are absent — not merely when credits are low (that is mode b).

   **Named-reference fallback (modes b and c):** cite specific real URLs from training knowledge
   (e.g. `https://linear.app`, `https://stripe.com/payments`, `https://vercel.com`), labelled
   `[named, not fetched]`. Every concept must cite at least one reference — fetched OR a specific
   named URL. A concept with no reference of any kind is disqualified.

2. **Always three concepts.** Never propose fewer than three scored concepts — a single concept is
   a bias, not a tournament. If the brief seems to dictate one style, generate the two most
   interesting alternatives anyway.

3. **No direction without ≥1 fetched reference.** Each concept must cite at least one reference
   obtained this session. A concept with zero cited references is disqualified from winning.

4. **Reject the generic AI look.** Automatically disqualifying in the winner (flag and replace):
   centred card stack with drop shadows; purple-to-blue gradient hero; emoji bullets in feature
   lists; glowing CTA button with blur halo; stock-illustration mascots. Use `impeccable` as
   primary critic.

5. **Exactly one Signature moment per page.** The winner must nominate exactly one Signature
   moment per page. Everything else supports it. Do not develop two competing signature moments and
   call them a feature.

6. **WOW must carry a conversion bet (Accountable WOW).** Any striking visual treatment must state
   an explicit conversion bet (see `reference/accountable-wow.md`). Decorative direction without a
   conversion rationale is removed.

7. **Perf and a11y are floors.** For each high-craft element, note expected LCP impact, CLS risk,
   and the reduced-motion fallback. Not afterthoughts.

8. **Do not override the ONE CTA.** The ONE CTA is locked in `growth.md`; DIRECTION serves it and
   never redefines it. The spine's CTA Block enforces single-primary-action per page.

## Inputs

- `recon.md` — read: **Purpose**, **Audience**, **Design audit**, **What to keep**.
- `growth.md` — read: **Primary conversion goal**, **The ONE CTA**, **Hypotheses**.

If either file is missing, stop and ask. Do not generate direction blind.

## Procedure overview

1. **Read inputs + taste calibration**, then **fetch live references** (modes per Hard rule 1),
   then run the **3-concept tournament**: generate three genuinely distinct concepts, score on the
   weighted rubric, kill two, develop the winner by grafting runner-up ideas, applying
   project-scoped taste bias transparently. Full detail: `reference/tournament.md`.
2. **Build the Reference Board** (min 3 annotated references), then **emit the Spine** — color
   tokens, type scale, spacing rhythm, core components. Full spec: `reference/spine.md`.
3. **Write `direction.md`** with the exact section structure, inline summary, invoked skills, and
   enforced Doctrine. Full format: `reference/output-format.md`.

## References

- `reference/tournament.md` — concept generation, weighted scoring rubric, kill/graft, taste bias.
- `reference/spine.md` — reference board + token/component Spine specification.
- `reference/output-format.md` — exact `direction.md` structure, skills invoked, Doctrine enforced.
- `reference/artifacts.md` — working-dir + artifact spec.
- `reference/doctrine.md` — taste + growth Doctrine and tension-resolution rule.
- `reference/accountable-wow.md` — the Accountable WOW template.

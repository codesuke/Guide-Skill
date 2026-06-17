# Mode B — `--build`: Self-Correcting Studio Loop (full procedure)

This is the full `--build` Mode procedure for `de-handoff`. It is the only Mode that dispatches
subagents and writes code. It fans out one build subagent per section, captures a `shot`
screenshot of each, runs an adversarial review, gate-checks against the Hard floors and doctrine,
and iterates until each section passes or hits the iteration limit.

## Overview

```
[Read prompt-pack.md OR generate inline]
    → [Fan-out: dispatch build subagents per section]
    → [shot: capture screenshot of each section]
    → [Adversarial review: skeptic tries to refute; impeccable + emil-design-eng defend/refine]
    → [Gate check: doctrine bar + perf/a11y floors]
    → [Pass? Accept. Fail? Iterate.]
```

If `prompt-pack.md` does not exist, run Mode A first to generate it, then proceed.

---

## Phase 0 — Cost guard + workspace isolation (before any dispatch)

**Cost/scope guard.** The studio loop is the most expensive thing this collection does. Before
fan-out, compute and show an **agent-count estimate**: `sections × (1 build + 3 review roles) ×
up-to-3 iterations` (e.g. 7 sections ≈ 28–84 agent calls). State the estimate and
**confirm scope with the user before dispatching** — unless they already passed `--build` with an
explicit "don't ask" / budget directive. Offer to narrow scope (fewer sections, single-iteration) if large.

**Workspace isolation.** Build subagents write real code into the repo, in parallel. Before
dispatch, create an isolated workspace — invoke `superpowers:using-git-worktrees` (preferred) or
cut a new git branch — so parallel writes never corrupt the user's working tree and the whole
studio run can be reviewed or discarded as a unit. State the branch/worktree before Phase 1.

---

## Phase 1 — Fan-out build subagents

Use `superpowers:dispatching-parallel-agents` to dispatch one build subagent per section simultaneously. This is a deliberate fan-out: sections that have no dependencies on each other build in parallel.

For each section, dispatch either:
- `frontend-design` — for layout-heavy, visual-first sections (hero, features, social proof).
- `senior-frontend` — for interaction-heavy or technically complex sections (scroll animations, data-driven sections, signature moment).

Pass the section's build prompt from `prompt-pack.md` as the full instruction. Do not summarise it.

Dependency handling: if section B depends on tokens or state from section A, build A first (sequential), then B. State the dependency explicitly before dispatching.

---

## Phase 2 — Visual capture with `shot`

After each section build completes:

0. **Get a rendered surface for `shot` first.** `shot` needs an HTML file or a live URL — it
   cannot screenshot a raw `.tsx`/`.jsx`/`.vue` source file. Bridge from built component to
   pixels by the first applicable route:
   - **Project has a dev server** (Next.js/Vite/etc.): start it (e.g. `npm run dev`), wait until
     it is listening, and point `shot` at the route that renders the section
     (`shot http://localhost:3000/<route> ...`). Prefer `--sel` to isolate the section.
   - **No route yet / isolated component:** render it into a **standalone HTML harness** — a
     throwaway page that imports/mounts just this component with the spine tokens — then
     `shot harness.html ...`. For a static build, point `shot` at the built HTML output.
   - **Plain static HTML section:** `shot` the file directly.
   If none of these can produce a rendered surface, the section cannot pass visual verification —
   say so and fix the render path before continuing; do not accept on code inspection alone.

1. Render the section with the `shot` tool:
   ```
   shot <rendered URL or harness.html> [section-name.png] [flags]
   ```
   Relevant flags:
   - `--w=1440` for desktop viewport
   - `--mobile` for mobile check
   - `--sel=".section-class"` to capture only the target section (avoids sticky nav overlap)
   - `--reveal` if the section has scroll-reveal elements that need to be forced visible
   - `--scale=2` for retina-quality capture

2. Read the PNG back into context:
   ```
   Read <section-name.png>
   ```
   This is mandatory. Do not pass judgment or run the review until you have visually inspected the screenshot.

3. Flag any immediate hard failures before sending to review:
   - Generic AI look patterns (centred card stack with drop shadows, purple-to-blue gradient hero, emoji bullets, glowing CTA with blur halo, stock mascots) — these fail immediately; no review needed.
   - Missing or obviously broken layout — send back to the build subagent with a specific correction prompt.

---

## Phase 3 — Adversarial review

Run the review panel for each section. The panel has three roles:

### Skeptic subagent (adversarial)
Dispatch a fresh subagent with one job: **try to refute** two claims:
1. "This section is well-designed." (Taste half: doctrine, generic AI patterns, signature-moment integrity, typographic hierarchy, references.)
2. "This section converts." (Growth half: CTA visibility, F/Z scan path, trust signal placement, friction, value prop clarity above the fold.)

**REQUIRED — pass the following to the skeptic at dispatch time:**
- The `shot` screenshot PNG path for this section (e.g. `hero.png`). A skeptic dispatched without the screenshot cannot perform a valid visual review and must be re-dispatched with it.
- The section's motion spec (from `motion.md`).
- The section's accountable-WOW gate block.

The skeptic must argue from evidence — cite what it sees in the screenshot. "Looks fine" from the skeptic is a failure of the review. The skeptic must find at least one concrete issue per claim or explicitly state "no issue found after specific inspection of [X, Y, Z]."

### `impeccable` (primary critic)
Invoke the `impeccable` skill as the primary taste critic. Pass it the same screenshot PNG path, motion spec, and accountable-WOW gate block — it must enforce the doctrine against the actual visual, not against the code alone.

Its job:
- Enforce the doctrine against the screenshot.
- Catch any generic AI patterns the flag check missed.
- Evaluate the signature moment: is it the ONE moment on the page, is it developed with full craft, does everything else serve it?
- Assess typographic hierarchy: is it editorial, scaled, intentional — or timid?
- Respond to the skeptic's refutations: either agree and require a fix, or defend with specific reasoning.

### `emil-design-eng` (micro-polish critic)
Invoke `emil-design-eng` for micro-polish review. Pass it the same screenshot PNG path — it must assess the actual rendered output. Its job:
- Pixel-level spacing consistency.
- Animation easing and timing — does it feel crafted or default?
- Hover states, focus rings, transition smoothness.
- Respond to the skeptic's refutations on taste grounds.

---

## Phase 4 — Gate check

After the review panel completes, run the gate check:

```
Doctrine gates:
  [ ] No generic AI look patterns
  [ ] Exactly ONE signature moment on the page (not two, not zero)
  [ ] Typographic hierarchy is intentional and scaled (not timid 16px-everything)
  [ ] WOW item (if present) has its conversion bet visible in the implementation
  [ ] Value prop legible above the fold (hero section)
  [ ] ONE primary CTA — visually dominant, scan-path aligned

Perf/a11y gates:
  [ ] prefers-reduced-motion: motion fallback implemented and verified
  [ ] No CLS-causing animation (transforms + opacity only)
  [ ] LCP section (hero) not blocked by motion
  [ ] Semantic HTML + ARIA where required
  [ ] Text contrast ≥ 4.5:1 at all animation states
```

**All gates must pass.** A section with one failed gate is not accepted. The perf/a11y Hard floors cannot be traded for aesthetics or conversion wins.

---

## Phase 5 — Iterate or accept

**If all gates pass:** Section is accepted. Note accepted status. Move to the next section.

**If any gate fails:**
1. Identify the specific failure(s).
2. Write a correction prompt targeting only the failure(s) — do not rewrite the entire section.
3. Dispatch the same build subagent (or the more appropriate one) with the correction prompt.
4. Return to Phase 2 (shot capture) and re-run the loop.

**Iteration limit:** Maximum 3 iterations per section. If a section fails to clear all gates after 3 iterations:
- Accept what passes.
- Flag remaining failures explicitly in the studio output.
- Do not iterate indefinitely — deliver with known issues rather than spinning.

Never remove the signature moment to clear a gate — redesign it to clear the gate; never delete it. Every page keeps exactly one.

---

## Phase 6 — Studio output

`studio-output.md` is the `--build` counterpart to default mode's `prompt-pack.md`. Where `prompt-pack.md` captures what to build, `studio-output.md` records what was built, how it fared, and what the reviewers said. Always write it — even if only one section was built.

After all sections complete, write `studio-output.md` with:

```markdown
# Studio Output — [Page/Product name]
Date: [today]
Mode: --build
Total sections: [n]
Sections accepted: [n]
Sections accepted with flags: [n]
Sections flagged / unresolved: [n]
Signature moment: [section name] — [motion technique]
Signature moment status: ACCEPTED / ACCEPTED (with flags) / FLAGGED

---

## Section-by-section results

### [Section name]

**Build status:** ACCEPTED / ACCEPTED (with flags) / FLAGGED
**Iterations:** [n of max 3]
**Screenshot:** `[section-name.png]` (captured with `shot`)

**Adversarial review verdict:**
- Skeptic claim 1: [exact claim the skeptic made — quote or close paraphrase]
- Skeptic claim 2: [exact claim the skeptic made, or "no issue found after inspection of [X, Y]"]
- `impeccable` response: [accepted the claim and required a fix / defended with: (specific reasoning)]
- `emil-design-eng` response: [accepted / defended / added micro-polish note]

**Doctrine gates:**
- [ ] No generic AI look patterns — PASS / FAIL: [detail if fail]
- [ ] Exactly ONE signature moment on the page — PASS / FAIL: [detail if fail]
- [ ] Typographic hierarchy intentional and scaled — PASS / FAIL: [detail if fail]
- [ ] WOW conversion bet visible in implementation — PASS / N/A (no WOW item) / FAIL: [detail if fail]
- [ ] Value prop legible above the fold (hero only) — PASS / N/A / FAIL: [detail if fail]
- [ ] ONE primary CTA, visually dominant — PASS / FAIL: [detail if fail]

**Perf/a11y gates:**
- [ ] prefers-reduced-motion fallback verified — PASS / FAIL: [detail if fail]
- [ ] No CLS-causing animation — PASS / FAIL: [detail if fail]
- [ ] LCP not blocked by motion (hero) — PASS / N/A / FAIL: [detail if fail]
- [ ] Semantic HTML + ARIA — PASS / FAIL: [detail if fail]
- [ ] Text contrast ≥ 4.5:1 at all animation states — PASS / FAIL: [detail if fail]

---
```

After all per-section blocks, append an overall summary:

```markdown
## Overall summary

Total sections built: [n]
All gates cleared: [YES / NO]
Signature moment outcome: [ACCEPTED / ACCEPTED with flags / FLAGGED — one sentence on what required redesign, if anything]
Gates that fell back to accept-with-flags: [list, or "none"]
Unresolved failures (hit iteration limit): [list with section name + gate, or "none"]

> This file was produced by `de-handoff --build`. The corresponding prompt source is `prompt-pack.md`.
```

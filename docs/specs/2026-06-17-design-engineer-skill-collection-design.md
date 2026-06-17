# Design Engineer — Skill Collection Design

**Date:** 2026-06-17
**Status:** Design approved, pending spec review
**Author:** brainstormed with Claude

## 1. Purpose

A collection of skills that act as a **Design Engineering Director**: a guide that
turns any site or brief into a **high-converting, high-retention, WOW** site by
*prompting and orchestrating* the 76 specialist skills installed in this workspace
— **without writing production code itself** (default), or by dispatching and
reviewing build subagents on demand.

It is not a pipeline that makes a pretty page. It runs a **studio of specialists**,
holds an opinionated taste + conversion doctrine, **diverges before it converges**,
ships every aesthetic bet as an **accountable experiment**, **self-corrects** against
visual evidence, and **learns the user's taste over time**.

Non-goals: it does not replace the specialist skills; it does not write backend
logic; it is not WordPress-specific (WordPress is one input case among many).

## 2. The collection — 7 skills

```
design-engineer/   orchestrator · taste+CRO doctrine · learning ledger · skill auto-discovery · effort dial
  de-recon/        reverse-engineer ANY source (site / Figma / brief; WP = one case): purpose, audience, stack, content, funnel, current design audit
  de-growth/       conversion + retention + marketing strategy → growth.md (goals, funnel, the ONE CTA, hypotheses)
  de-direction/    divergent art-direction (3 concepts → 1) + live references + design-system spine → direction.md
  de-motion/       motion architecture: parallax / snap / GSAP / Framer / 3D, with a11y + perf budget → motion.md
  de-handoff/      compile prompt pack (default) OR --build studio loop (dispatch → shot → adversarial review → iterate)
```

Each `de-*` sub-skill is single-purpose, independently runnable, and reusable.
`design-engineer` is the thin brain that sequences them, carries doctrine,
adjudicates conflicts, and owns the learning ledger.

## 3. Workflow

```
INPUT: a URL (any stack) or a written brief
  1. RECON      → de-recon      → recon.md     (purpose, audience, stack, content inventory, funnel, design audit, "what to keep")
  2. GROWTH     → de-growth     → growth.md    (primary conversion goal, funnel, the ONE CTA, retention hooks, social proof, SEO structure, hypotheses)
  3. DIRECTION  → de-direction  → direction.md (3 concepts scored→1, live reference board, token/component spine)
  4. MOTION     → de-motion     → motion.md    (per-section motion architecture, signature moment, a11y + perf budget)
  5. SYNTHESIZE → design-engineer applies DOCTRINE, resolves tensions, writes the master brief
  6. HANDOFF    → de-handoff    → prompt-pack.md  (default)  ·  --build → studio loop
```

Checkpoint after each phase (artifact shown, user approves, continue). Any
sub-skill can also be invoked standalone. Growth precedes direction on purpose:
**conversion goals shape the visuals and motion, never the reverse.**

## 4. The four upgrades (what makes it goated)

### 4.1 Diverge → converge (tournament; never one option)
- `de-direction` generates **3 genuinely distinct concepts** (e.g. editorial-bold /
  cinematic-dark / clean-trust), scores each against the conversion goal + taste
  doctrine, **kills two**, develops the winner while **grafting the best ideas from
  the runners-up**.
- **Signature-moment concept lab**: generates candidate hero interactions and scores
  them on `impact × feasibility`; exactly **one** signature moment per page survives.

### 4.2 Accountable WOW (every aesthetic bet is an experiment)
Each major decision ships with:
- the **conversion bet** it makes,
- the **metric** it should move,
- the **`ab-testing` experiment + `analytics` instrumentation** to validate it,
- a **perf + a11y gate** it must pass.

Powered by real skills: `cro`, `marketing-psychology`, `ab-testing`, `analytics`,
`copywriting`, `offers`, `churn-prevention`. "WOW serves conversion" is enforced,
not asserted.

### 4.3 Self-correcting studio loop (`--build` mode)
`build → shot screenshot → adversarial review → iterate until bar met`:
- A **skeptic agent** tries to *refute* "this is good" and "this converts".
- `impeccable` (primary critic) + `emil-design-eng` (micro-polish) defend / refine.
- `shot` provides **visual grounding** — the loop sees the real rendered output, not
  a description of it.
- Default (non-`--build`) mode skips the loop and emits a polished prompt pack.

### 4.4 Taste calibration + system-first
- **Taste calibration onboarding**: on first run, the orchestrator shows reference
  sets and learns the *user's* taste into the ledger — biasing every future run
  toward the user's eye, not generic taste.
- **Design-system-first**: `de-direction` emits a **token + component spine**
  (via `theme-factory` / `shadcn` / `tailwindcss`, and the token-bridge pattern in
  project memory) before any page. Pages inherit it → site-wide coherence and
  *faster* builds over time.

## 5. Doctrine (baked into the orchestrator)

**Taste half:** editorial type with real scale; **one signature moment per page**;
references before vibes (every direction call backed by a fetched real example);
reduced-motion + perf are part of "done"; reject the generic AI look (centered card
stack, purple gradient, emoji bullets). Primary critic = `impeccable`.

**Growth half:** clear value prop above the fold; **one primary CTA**; friction
audit; trust signals / social proof placement; F/Z reading patterns; WOW must serve
the conversion goal or it is cut.

**Tension-resolution rule:** when conversion, aesthetics, and performance conflict —
the **conversion goal wins ties**, but never by removing the single signature moment;
performance/a11y gates are hard floors that override both.

## 6. Learning system

```
design-engineer/memory/
  taste-ledger.md      ← what looked good / cheap, with the why (user-calibrated)
  skill-registry.md    ← known skills + routing notes (auto-refreshed each run)
  conversion-wins.md   ← patterns that moved the metric
```

Lives **inside the skill folder** so taste accumulates **globally across every
project**. On each run the orchestrator: (1) reads the ledger, (2) **re-scans
installed skills** and slots any new ones into the routing table, (3) during/after
the run appends verdicts and routing learnings. This is the "learn as it goes and
adapt to new skills" requirement.

## 7. Routing table (orchestrator; auto-refreshed)

| Phase | Primary skills it drives | Research / evidence |
|---|---|---|
| recon | `firecrawl-website-design-clone`, `firecrawl-scrape`/`map`, `impeccable` (audit) | — |
| growth | `cro`, `copywriting`, `marketing-psychology`, `offers`, `churn-prevention`, `onboarding`, `ab-testing`, `analytics` | `customer-research`, `competitor-profiling`, `firecrawl-market-research`, `seo-audit` |
| direction | `high-end-visual-design`, `gpt-taste`, `brandkit`, `landing-page`, `theme-factory`/`shadcn`/`tailwindcss` | `firecrawl-deep-research`/`search` |
| motion | `cinematic-gsap-lenis-motion-system`, `gsap-scrolltrigger`/`timeline`/`plugins`, `threejs`/`webgl-*`/`globe-*`, `masked-reveal`, `staggered-word-reveal`, `progressive-blur` | live Awwwards refs via firecrawl |
| handoff | `frontend-design`, `senior-frontend`; critic = `impeccable` (+ `emil-design-eng`) | `shot` for visual verification |

## 8. Modes & effort dial

- **Default** → produces `prompt-pack.md`: copy-paste-ready briefs per section/component.
- **`--build`** → dispatches subagents and runs the self-correcting studio loop.
- **Effort dial**: orchestrator scales depth from a fast prompt pack to a full
  adversarial build studio based on the ask and budget — the user does not pay studio
  cost for a quick brief.

## 9. Artifacts produced

`recon.md`, `growth.md`, `direction.md` (+ token/component spine + reference board),
`motion.md`, the master brief, and either `prompt-pack.md` or reviewed built code.
Plus ledger updates.

## 9a. Install target — GLOBAL

The 7-skill collection installs **globally** (`~/.agents/skills/`, symlinked into
`~/.claude/skills/`) so it is usable in **every project**, not just this workspace.
This matches the dependency skills, which are already global (the coreyhaines
marketing suite + MengTo motion/3D set were installed with `skills add -g`; the
global store currently holds ~181 skills). Build with `skills init` per skill, or
author under `~/.agents/skills/<name>/SKILL.md` directly.

## 9b. Usage guide deliverable (built last)

After the skills work, ship `design-engineer/GUIDE.md` — a usage guide with
**quality prompt examples**, covering:
- when to reach for `design-engineer` vs a single sub-skill,
- copy-paste invocation examples for each phase and for `--build` vs prompt-pack,
- worked end-to-end example (tired site → WOW site) showing each artifact,
- effort-dial guidance (quick brief vs full studio) with example prompts,
- how the learning ledger improves results over repeated use.

## 10. Internet-always behavior

Reference-fetching is a rule: `de-direction` must pull live references before
proposing a direction; `de-recon` always scrapes the real target; `de-motion` may
fetch live GSAP/Awwwards examples. If the network is unavailable it says so and
degrades — it never silently invents references.

## 11. Dependencies (must exist in workspace)

Firecrawl suite, `impeccable`, taste set (`gpt-taste`, `emil-design-eng`,
`high-end-visual-design`, `design-taste-frontend`), GSAP suite + MengTo motion/3D
set, coreyhaines growth suite (`cro`, `copywriting`, `ab-testing`, `analytics`,
`marketing-psychology`, `churn-prevention`, `onboarding`, `offers`, etc.),
`frontend-design`, `senior-frontend`, `theme-factory`/`shadcn`/`tailwindcss`,
`brandkit`, `superpowers:dispatching-parallel-agents`, and the `shot` tool.

## 12. Success criteria

- Given a tired site or a brief, produces a complete, coherent design package that a
  build agent can execute without further design decisions.
- Every aesthetic decision is traceable to a conversion hypothesis with a defined
  experiment + perf/a11y gate.
- Direction is always chosen from ≥3 scored concepts, never a single guess.
- In `--build`, output is visually verified (`shot`) and survives adversarial review.
- The ledger demonstrably biases later runs toward the user's taste and auto-absorbs
  newly installed skills.

## 13. Risks / open questions

- **Token cost**: full all-in `--build` studio loop is expensive; the effort dial and
  default-to-prompt-pack mitigate this.
- **Skill-routing drift**: as skills are added/renamed, the auto-refresh must handle
  missing skills gracefully (degrade, log, never hard-fail).
- **`--build` substrate**: studio loop may run as parallel subagents (or a workflow)
  — execution substrate to be decided in the implementation plan.
- **Taste calibration UX**: how the onboarding presents reference sets (terminal vs
  `shot` board) to be specified in the plan.
```


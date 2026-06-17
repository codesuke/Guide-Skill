# Design Engineer — Usage Guide

A five-phase design pipeline that turns any site brief into a high-converting, visually crafted plan.
Default output: a copy-paste prompt pack. Pass `--build` for a self-correcting build studio.

---

## What is this / when to use it

`design-engineer` is a **director skill** that orchestrates five specialist sub-skills in sequence.
It does NOT write production code by default — it produces understanding, decisions, and briefs.

**Use `design-engineer` (full pipeline) when:**
- You are starting a new site or redesigning an existing one from scratch
- You need the full chain: research → conversion strategy → visual direction → motion → implementation prompts
- You want a coherent end-to-end plan where every later phase respects what the earlier phases locked

**Use a single sub-skill directly when:**
- You only need one piece of the pipeline (e.g. just an art-direction tournament, or just a motion plan)
- You already have recon.md and growth.md and want to run direction only
- You are auditing or patching one phase of an existing plan

### The 6 skills in the collection

| Skill | What it does | Output |
|---|---|---|
| `design-engineer` | Director — orchestrates the full pipeline, manages taste calibration, resolves tensions | Runs all phases |
| `de-recon` | Scrapes / reads any source (URL, Figma, brief) and reverse-engineers purpose, audience, stack, funnel, design audit | `recon.md` |
| `de-growth` | Converts recon into a conversion strategy: ONE primary CTA, funnel map, friction fixes, retention hooks, hypotheses | `growth.md` |
| `de-direction` | 3-concept art-direction tournament + live reference board + design-system token spine | `direction.md` |
| `de-motion` | Full motion architecture: per-section scroll plan, signature-moment scoring lab, motion-vs-tech matrix, a11y/perf floors | `motion.md` |
| `de-handoff` | Synthesizes all artifacts into implementation-ready output | `prompt-pack.md` (default) or `studio-output.md` (`--build`) |

> `impeccable` and `emil-design-eng` are **external critic skills** the director routes to (primary
> and micro-polish critics) — they are not part of this collection. If absent, the pipeline degrades
> gracefully and audits against the same doctrine checklist manually.

---

## Quick start

The simplest invocation — just describe the site:

```
/design-engineer Redesign this site: https://example.com — make it a high-converting WOW site.
```

With a written brief instead of a URL:

```
/design-engineer RailRecruit — 9-year-old WordPress/Elementor railway-signalling training institute.
Goal: a modern Next.js rebuild that lifts course-enrollment conversion.
```

Pass `--build` to go from prompts to an actual running build:

```
/design-engineer --build https://example.com
```

---

## Invoking each phase directly

Skip the full pipeline and run one phase when you already have the upstream artifacts.

### de-recon — audit / reverse-engineer a site

```
/de-recon https://railrecruit.com
```

```
/de-recon Audit this brief and produce recon.md:
RailRecruit — a 9-year-old WordPress/Elementor site for an Indian railway-signalling training institute.
Sells CPD-certified courses. Current problems: cluttered, slow, weak CTAs, testimonials buried, no clear pricing.
```

```
/de-recon Reverse-engineer this Figma link: https://figma.com/file/... — extract purpose, audience, and content inventory.
```

### de-growth — conversion strategy

```
/de-growth Read recon.md and write a conversion strategy. Lock the ONE primary CTA and map every friction fix.
```

```
/de-growth What should the course-detail page optimize for? Build the funnel, hypotheses, and accountable-WOW blocks.
```

### de-direction — art-direction tournament

```
/de-direction Run a 3-concept tournament. The audience is anxious career-motivated graduates — clear and trustworthy wins.
```

```
/de-direction Generate three genuinely distinct visual directions for a CPD-certified training site. Score them and emit the winning token spine.
```

### de-motion — motion architecture

```
/de-motion Design the full motion layer for the RailRecruit homepage. Signature moment must serve enrollment conversion.
```

```
/de-motion Write the per-section scroll plan and run the Signature-Moment Concept Lab. Perf floor: LCP < 2.5s, CLS = 0.
```

### de-handoff — build prompts or build studio

**Default (prompt pack):**
```
/de-handoff Read recon.md, growth.md, direction.md, motion.md and write prompt-pack.md — one self-contained build prompt per section.
```

**Build studio:**
```
/de-handoff --build Dispatch build agents per section, screenshot each one, run adversarial review, iterate until gates pass.
```

---

## Effort dial — quick brief vs full studio

The pipeline scales to the ask. Don't pay studio cost for an exploratory brief.

| Situation | What to run | Typical output |
|---|---|---|
| Quick exploration / spike | Default mode only, skip motion | `prompt-pack.md` |
| Full page, production-bound | Full pipeline, then `--build` | `studio-output.md` + built sections |
| Explicit `--build` flag | Always runs the full studio loop | Screenshots + gate reports |
| Ambiguous scope | Pipeline asks: "Is this production-ready or exploratory?" | Defaults to prompts if unclear |

**Quick brief — no `--build`:**
```
/design-engineer Quick brief: modernize the RailRecruit homepage. Skip motion phase, produce a prompt pack only.
```

**Full studio — with `--build`:**
```
/design-engineer --build Full studio run on https://railrecruit.com.
Run every phase. Build each section in parallel. Screenshot and adversarially review each one. Iterate until the doctrine bar passes.
```

**Single phase, production-grade:**
```
/de-direction Full studio effort: run a 5–8 reference research pass, generate 3 scored concepts, graft the best runner-up elements into the winner. Emit the full token spine.
```

---

## Worked example — RailRecruit (WordPress → WOW Next.js)

This is the real smoke-test run from `examples/railrecruit/`. Each file exists and passes its contract.
The brief: a 9-year-old WordPress/Elementor railway-signalling training institute with cluttered layout,
slow load, weak CTAs, buried testimonials, and no clear pricing.

### Phase 1 — RECON (`recon.md`)

`de-recon` read the written brief (no live URL) and produced `recon.md` with all 7 required sections.
Key findings:

- **Top finding 1:** No clear pricing + no single primary CTA are the two highest-leverage conversion blockers — both are decision-stage and both are fixable in the rebuild.
- **Top finding 2:** Trust assets exist but are mis-placed — CPD certification and testimonials are present yet buried; the rebuild's job is largely *re-sequencing* proof to doubt points.
- **Top finding 3:** "Slow" is a first-order design problem, not a back-end afterthought — LCP must be a hard floor carried into `de-motion`.

What to keep: CPD certification credential, learner/placement testimonials (content only — relocate), 9-year track record as longevity signal.

→ File: `examples/railrecruit/recon.md`

---

### Phase 2 — GROWTH (`growth.md`)

`de-growth` read recon and locked the conversion strategy:

```
Primary CTA:  "Enroll Now" → /enroll/[course]
Value prop contract: Start a CPD-certified railway-signalling course that makes you
                     job-ready, with transparent pricing and a money-back guarantee.
Placement: above fold + repeated at pricing block + mobile sticky bar
```

Friction audit produced 6 fixes, highest priority:

1. **No clear pricing** → add explicit itemized pricing block with risk-reversal
2. **Scattered CTAs** → collapse to a single "Enroll Now" at fixed decision points
3. **Buried testimonials** → relocate proof to the two highest-doubt moments (post-value-prop and pre-CTA)

Four accountable-WOW hypotheses written — each carries a conversion bet, metric, experiment design, instrumentation plan, perf gate, and a11y gate.

→ File: `examples/railrecruit/growth.md`

---

### Phase 3 — DIRECTION (`direction.md`)

`de-direction` ran a 3-concept tournament. The three concepts (genuinely distinct emotional register):

| Concept | Archetype | Weighted score |
|---|---|---|
| "Clearing House" | Clean-trust — calm, anxiety-reducing, single action per screen | **4.55** (winner) |
| "Signal Type" | Editorial-bold — magazine-grade, dominant headline, serif display | 4.35 |
| "Control Room" | Cinematic-dark — signalling control room aesthetic, 3D parallax | 3.40 (killed) |

"Control Room" was eliminated on the no-AI-look criterion (glowing accent + dark gradient hero matched a disqualifying doctrine pattern) AND on perf risk (3D assets while we are fixing a "slow site").

**Winning direction — "Clearing House":**
- Color: `#FFFFFF` bg / `#0E1B2C` navy ink / `#127C71` signal teal accent
- Type: Geist Sans, display ≈ 4× body (genuine editorial contrast — not flat 16px-everything)
- Signature moment nominated: **"Outcome Ladder"** — a pinned scroll-scrub step sequence making the job outcome feel inevitable
- Runner-up graft: "Signal Type"'s editorial type weight was grafted into the display headline scale

→ File: `examples/railrecruit/direction.md`

---

### Phase 4 — MOTION (`motion.md`)

`de-motion` ran the Signature-Moment Concept Lab: 4 candidates scored on impact × feasibility × conversion bet × perf/a11y risk.

Winner: **"Outcome Ladder" (score 10.40)** — pinned scrub step sequence, GSAP ScrollTrigger.
Reduced-motion fallback: static stacked steps, all four visible at once, no pin, no scrub.

6 sections mapped, none flagged `[REDESIGN REQUIRED]`:

| Section | Motion type | Technology |
|---|---|---|
| Hero | stagger-in (headline → subhead → trust strip → CTA) | CSS |
| Outcome Ladder *(SIGNATURE)* | pin-scrub | GSAP ScrollTrigger |
| Proof / Testimonials | stagger-in | CSS + IntersectionObserver |
| Pricing / Decision | static + CTA hover micro | CSS |
| Pre-CTA Reassurance | stagger-in | CSS |
| Footer + mobile sticky | snap (sticky bar slides in) | CSS |

→ File: `examples/railrecruit/motion.md`

---

### Phase 5 — HANDOFF (`prompt-pack.md`)

`de-handoff` synthesized all artifacts into 6 self-contained build prompts. Each prompt carries:
- Locked spine tokens (colors, type scale, spacing — copy-paste ready)
- Motion spec with reduced-motion fallback
- Accountable-WOW block (conversion bet, metric, experiment, instrumentation, perf/a11y gates)
- Real copy and acceptance criteria

```
# Prompt Pack — RailRecruit
Total sections: 6
Signature moment: Outcome Ladder (GSAP ScrollTrigger pinned scrub)
```

A builder can hand any single prompt to `frontend-design` or `senior-frontend` without needing
to read any other artifact. Pass `--build` to the pipeline to dispatch these automatically.

→ File: `examples/railrecruit/prompt-pack.md`

---

### Arc summary

```
Brief: "cluttered, slow, weak CTAs, buried testimonials, no clear pricing"
         ↓
recon   → identified 5 friction points; preserved CPD cert + testimonials as equity
growth  → ONE CTA locked ("Enroll Now"); 4 hypotheses with conversion bets; 6 friction fixes
direction → "Clearing House" wins (4.55); "Control Room" killed (AI look + perf risk)
motion  → "Outcome Ladder" wins signature-moment lab (10.40); 6 sections mapped
handoff → 6 copy-paste prompts, each self-contained; --build will dispatch + screenshot + iterate
```

---

## How the learning ledger improves results over repeated use

The learning system lives in `memory/` alongside the skills. Three mechanisms compound over time.

### Taste calibration (`memory/taste-ledger.md`)

On **first run** — detected when `## Calibration` has zero entry rows, not when the header is
absent (the shipped ledger ships the header empty) — the pipeline shows you 4–6 reference sets
covering distinct aesthetics (editorial-minimal, cinematic-dark, clean-SaaS, industrial-brutalist,
etc.) and asks: "Which do you love, which do you hate — and crucially WHY?"

Every verdict is recorded under `## Calibration`:
```yaml
- pattern: "dark-chrome + monospaced UI"
  verdict: love
  why: "feels like power tools, not toys — right for developer audiences"
  date: 2026-06-17
```

On **later runs** (the `## Calibration` section has one or more entry rows), `de-direction` reads the ledger before concept generation and applies scoring bias:
- `love` entries → +0.5 to the most relevant criterion on matching concepts
- `hate` entries → −0.5 on matching concepts

The bias is surfaced explicitly in `direction.md` under `### Taste Bias Applied` so it can be challenged.
Over time the tournament requires fewer iterations to converge on a direction you will actually ship.

### Skill auto-discovery (`memory/skill-registry.md`)

At session start, `design-engineer` runs `scripts/scan-skills.sh` to refresh the skill registry.
As you install new skills (new motion patterns, new grid systems, new GSAP techniques), they become
automatically discoverable by `de-motion` and `de-direction` without any manual wiring.
The registry maps skill names to capabilities so the director routes the right specialist to each effect.

### Conversion-wins ledger (`memory/conversion-wins.md`)

Successful conversion bets from past runs — hypotheses that actually moved a metric —
are recorded in `conversion-wins.md`. `de-growth` reads this at session start to:
- Prioritize proven friction fixes over unvalidated assumptions
- Surface winning patterns from similar audiences or product categories
- Calibrate hypothesis confidence levels (a proven bet gets a higher prior than a first-guess)

The pipeline explicitly cites these wins in `growth.md` so the conversion rationale
accumulates institutional knowledge rather than restarting from first principles every run.

---

## Key doctrine rules (quick reference)

These are enforced at every phase. Knowing them helps you write better prompts.

| Rule | Where enforced |
|---|---|
| **Exactly ONE signature moment per page** | `de-motion` signature-moment lab, `de-handoff` gate check |
| **References before vibes** — no direction without a fetched URL | `de-direction` (`reference/tournament.md`) |
| **Reject the generic AI look** — centred card stack, purple-to-blue gradient hero, emoji bullets, glowing CTA, stock mascots | `de-direction` + the `impeccable` critic |
| **ONE primary CTA** — multiple equal-weight CTAs are a conversion killer | `de-growth` (locked, frozen for all downstream phases) |
| **Perf/a11y are hard floors** — LCP < 2.5s, CLS = 0, reduced-motion fallback required | All phases |
| **Conversion goal wins ties** — aesthetics yield to the growth goal; the signature moment is redesigned, not deleted | Tension-resolution rule in doctrine |

Full doctrine: `reference/doctrine.md`

---

## Advanced capabilities

These are baked into the director and the phase skills; you rarely invoke them explicitly.

| Capability | What it does | Where |
|---|---|---|
| **Shared working dir** | All artifacts live in `<repo-root>/.design-engineer/<project-slug>/` — phases read upstream files from and write outputs there, never CWD or repo root | `reference/artifacts.md` |
| **Resume detection** | On start, scans the working dir for existing artifacts and offers to resume from the first incomplete phase instead of re-running | director SKILL.md |
| **Multi-page** | recon/growth/direction run once for the site; motion + handoff loop per page under `pages/<page-slug>/`; each page keeps exactly ONE signature moment | director SKILL.md |
| **Project-scoped taste** | A per-project `<working-dir>/taste.md` overrides the global taste ledger, so taste doesn't bleed across unrelated projects | director + `de-direction` |
| **Conversion-wins capture** | After handoff, each shipped accountable-WOW bet is appended to `memory/conversion-wins.md` (status `pending`), so the ledger actually accumulates | `de-handoff` |
| **`--build` cost guard** | Before fan-out, shows an agent-count estimate and confirms scope | `de-handoff/reference/build-loop.md` |
| **`--build` workspace isolation** | Creates a git worktree/branch before parallel build agents write code | `de-handoff/reference/build-loop.md` |
| **`--build` render-for-shot** | Bridges built components → pixels (dev server / standalone HTML harness) so `shot` can verify React/Vue sections | `de-handoff/reference/build-loop.md` |

Design decisions behind these are recorded in [`../../docs/adr/`](../../docs/adr/).

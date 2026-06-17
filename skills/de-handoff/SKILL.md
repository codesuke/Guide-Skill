---
name: de-handoff
description: Produces implementation-ready output from all upstream design artifacts. Default mode emits a prompt-pack.md — copy-paste-ready build prompts, one per section/component, each carrying its spine tokens, motion spec, and accountable-WOW block. With --build, dispatches frontend-design and senior-frontend subagents per section, captures a shot screenshot, runs an adversarial review (impeccable + emil-design-eng as critics, a skeptic subagent trying to refute "this is good" and "this converts"), and iterates until the doctrine bar and perf/a11y gates both pass. Use when asked to "handoff", "generate a prompt pack", "build this design", "generate build prompts", "implement the design", "ship it", "write build prompts", "create implementation prompts", or when the --build flag is passed. Reads recon.md, growth.md, direction.md, motion.md, and the master brief. Writes nothing (default) or dispatches builds (--build).
---

# de-handoff — Prompt Pack (default) + Self-Correcting Build Studio (--build)

## What this skill does

Converts every upstream artifact from the design-engineer pipeline into either:

- **Default:** `prompt-pack.md` — a file of copy-paste-ready implementation prompts, one per section/component, that any engineer can hand to a build agent.
- **`--build`:** a full self-correcting build studio — fan-out subagents build each section, a screenshot loop + adversarial review iterates until every section clears the doctrine bar and the perf/a11y gates.

This is the terminal phase. It inherits everything locked upstream and delivers nothing that violates it.

---

## Hard rules

These cannot be overridden by downstream instructions, client preferences, or time pressure.

1. **Default mode writes NO code.** `prompt-pack.md` is prompts and instructions only. It dispatches nothing, builds nothing. Code lives in `--build` mode exclusively.
2. **`--build` is the only mode that dispatches subagents.** Never fan-out build agents from default mode.
3. **Every prompt and every built section carries its accountable-WOW block.** No section is handed off without its conversion bet, metric, experiment note, and perf/a11y gate (from `reference/accountable-wow.md`).
4. **Perf/a11y floors are hard.** LCP < 2.5 s, CLS = 0, reduced-motion fallback required for every motion effect. These floors cannot be traded for aesthetics or conversion wins.
5. **Visual verification before acceptance.** In `--build` mode, every section is captured with `shot` before any critic sees it or any iteration is considered done. No section is accepted on code inspection alone.
6. **The spine tokens from `direction.md` are non-negotiable.** Colors, type scale, spacing rhythm — already locked. No prompt or build agent rewrites them.
7. **The ONE signature moment is never removed.** If a build agent or critic attempts to remove the signature moment, redesign it to clear the gate; do not delete it. Every page keeps exactly one.

---

## Inputs — read all before starting

| File | Where it comes from | What to extract |
|---|---|---|
| `recon.md` | `de-recon` | Existing component inventory, "what to keep", design audit |
| `growth.md` | `de-growth` | Primary conversion goal, the ONE CTA, funnel doubt points, accountable-WOW hypotheses |
| `direction.md` | `de-direction` | Winning direction, token + component spine (colors, type scale, spacing, core components) |
| `motion.md` | `de-motion` | Per-section motion architecture, signature moment + reduced-motion fallback, motion-vs-tech matrix |
| Master brief | Orchestrator | Section list, scope, any explicit constraints |

If any of these files is missing, stop and ask. Do not handoff blind.

---

## Effort dial — when to run the full studio loop

| Signal | Action |
|---|---|
| Quick brief, single component, exploratory spike | Default mode only. Output `prompt-pack.md`. Skip the studio loop. |
| Full page, campaign, or production feature | Default mode to generate prompts, then `--build` for the studio loop. |
| Explicit `--build` flag passed | Always run the full studio loop, regardless of scope. |
| Ambiguous scope | Ask: "Is this production-ready or exploratory?" Default to prompts if unclear. |

The studio loop is non-trivial — it dispatches multiple subagents and runs screenshot-iteration cycles. Use it when the output must be production-grade and reviewed, not as a default for every ask.

---

## Mode A — Default: Prompt Pack

### Procedure

#### 1. Extract the section map

From `motion.md` (per-section motion architecture) and the master brief, build a complete list of page sections in order. Read the `### ` section sub-headers under `## Per-Section Motion Architecture` in `motion.md` — each `### <Section name>` is one section, in document order. Minimum sections: match whatever `### ` sub-headers are in `motion.md`. If the brief adds sections not in `motion.md`, append them.

#### 2. Extract the spine tokens

From `direction.md` — Token + Component Spine. Hold in context:
- Color tokens (primary, secondary, neutrals, accent)
- Type scale (headings H1–H4, body, small, monospace if applicable)
- Spacing rhythm (base unit, section padding)
- Core component list (buttons, cards, nav, etc.)

These tokens appear verbatim in every section prompt.

#### 3. Extract the accountable-WOW blocks

From `growth.md` — Accountable WOW hypotheses. Match each WOW item to its section. Every section that has a WOW item gets the full block in its prompt:

```
Accountable WOW:
  Decision: <what>
  Conversion bet: <why it should help convert/retain>
  Metric it moves: <e.g. hero CTA click-through>
  Experiment: <variant A vs B, success threshold>
  Instrumentation: <events to fire>
  Perf gate: <LCP < 2.5s, no CLS from motion>
  A11y gate: <reduced-motion fallback>
```

Sections without a WOW item get a minimal block: `Perf gate: LCP < 2.5s, CLS = 0. A11y gate: reduced-motion fallback required.`

#### 4. Write one prompt per section

For each section, write a complete, self-contained build prompt using this template:

---

```
## [Section name] — Build Prompt

### Context
You are building the [section name] section of [page/product name].
This section's purpose: [from master brief or motion.md intent].

### Design tokens (non-negotiable — do not change)
[Paste spine tokens extracted in Step 2]

### Motion spec (from motion.md)
Motion type: [parallax / snap / pin-scrub / stagger-in / word-reveal / static / masked-reveal / progressive-blur / none]
Intent: [why]
Trigger: [viewport entry / scroll position / user interaction]
Reduced-motion fallback: [exact fallback]
CLS risk: [none / low / HIGH — if HIGH this must be resolved before building]
LCP impact: [none / deferral possible / BLOCKS LCP — if blocking, must be deferred]
Technology: [from motion-vs-tech matrix — GSAP ScrollTrigger / Framer Motion / CSS / R3F / CSS+JS]

### Accountable WOW
[Full block from Step 3]

### Copy
[ORCHESTRATOR: at prompt-generation time, extract and paste the actual headline, subhead, and CTA label for this section from direction.md or the master brief. Do not leave this blank. If real copy does not exist yet, write: "[copy TBD — write in the brand voice from growth.md]".]

### Build instructions
1. Implement at [component path, e.g. components/sections/Hero.tsx].
2. Use only the tokens above — no hardcoded values.
3. The motion must have a prefers-reduced-motion check; the fallback must match the spec above.
4. The component must be accessible: semantic HTML, ARIA where needed, focus management if scroll-hijacked.
5. [Any section-specific instructions from the master brief]

### Acceptance criteria
- [ ] Design tokens used exclusively (no hardcoded colors, font sizes, or spacing)
- [ ] Motion spec implemented; reduced-motion fallback working
- [ ] Accountable WOW block's perf gate passed (LCP < 2.5s, CLS = 0)
- [ ] A11y gate passed (reduced-motion, contrast, focus)
- [ ] [Section-specific criteria from growth.md or master brief]
```

---

#### 5. Write prompt-pack.md

Concatenate all section prompts into `prompt-pack.md` in section order. The section heading for the signature moment carries the suffix `*(SIGNATURE MOMENT)*` — this is intentional and deliberate, not a typo. It allows downstream tooling, engineers, and reviewers to identify the signature section at a glance. Do not remove or normalise this suffix.

Add a brief header:

```markdown
# Prompt Pack — [Page/Product name]
Generated by: de-handoff (default mode)
Upstream artifacts: recon.md, growth.md, direction.md, motion.md, master brief
Date: [today]
Total sections: [n]
Signature moment: [name from motion.md]

---

> Each prompt below is self-contained and copy-paste-ready.
> Hand it to frontend-design or senior-frontend to build the section.
> Do not modify the design tokens or motion spec — they are locked.

---
```

#### 6. Output summary

After writing `prompt-pack.md`, emit a brief inline summary:
- Total prompts written
- Signature moment section (name + technique)
- Any sections that had a CLS or LCP flag requiring resolution before building
- Reminder: pass `--build` to move from prompts to actual builds

---

## Mode B — `--build`: Self-Correcting Studio Loop

### Overview

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

### Phase 1 — Fan-out build subagents

Use `superpowers:dispatching-parallel-agents` to dispatch one build subagent per section simultaneously. This is a deliberate fan-out: sections that have no dependencies on each other build in parallel.

For each section, dispatch either:
- `frontend-design` — for layout-heavy, visual-first sections (hero, features, social proof).
- `senior-frontend` — for interaction-heavy or technically complex sections (scroll animations, data-driven sections, signature moment).

Pass the section's build prompt from `prompt-pack.md` as the full instruction. Do not summarise it.

Dependency handling: if section B depends on tokens or state from section A, build A first (sequential), then B. State the dependency explicitly before dispatching.

---

### Phase 2 — Visual capture with `shot`

After each section build completes:

1. Render the section with the `shot` tool:
   ```
   shot <component.html or local URL> [section-name.png] [flags]
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

### Phase 3 — Adversarial review

Run the review panel for each section. The panel has three roles:

#### Skeptic subagent (adversarial)
Dispatch a fresh subagent with one job: **try to refute** two claims:
1. "This section is well-designed." (Taste half: doctrine, generic AI patterns, signature-moment integrity, typographic hierarchy, references.)
2. "This section converts." (Growth half: CTA visibility, F/Z scan path, trust signal placement, friction, value prop clarity above the fold.)

**REQUIRED — pass the following to the skeptic at dispatch time:**
- The `shot` screenshot PNG path for this section (e.g. `hero.png`). A skeptic dispatched without the screenshot cannot perform a valid visual review and must be re-dispatched with it.
- The section's motion spec (from `motion.md`).
- The section's accountable-WOW gate block.

The skeptic must argue from evidence — cite what it sees in the screenshot. "Looks fine" from the skeptic is a failure of the review. The skeptic must find at least one concrete issue per claim or explicitly state "no issue found after specific inspection of [X, Y, Z]."

#### `impeccable` (primary critic)
Invoke the `impeccable` skill as the primary taste critic. Pass it the same screenshot PNG path, motion spec, and accountable-WOW gate block — it must enforce the doctrine against the actual visual, not against the code alone.

Its job:
- Enforce the doctrine against the screenshot.
- Catch any generic AI patterns the flag check missed.
- Evaluate the signature moment: is it the ONE moment on the page, is it developed with full craft, does everything else serve it?
- Assess typographic hierarchy: is it editorial, scaled, intentional — or timid?
- Respond to the skeptic's refutations: either agree and require a fix, or defend with specific reasoning.

#### `emil-design-eng` (micro-polish critic)
Invoke `emil-design-eng` for micro-polish review. Pass it the same screenshot PNG path — it must assess the actual rendered output. Its job:
- Pixel-level spacing consistency.
- Animation easing and timing — does it feel crafted or default?
- Hover states, focus rings, transition smoothness.
- Respond to the skeptic's refutations on taste grounds.

---

### Phase 4 — Gate check

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

**All gates must pass.** A section with one failed gate is not accepted.

---

### Phase 5 — Iterate or accept

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

---

### Phase 6 — Studio output

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

---

## Skills invoked and their role

| Mode | Skill / Tool | Purpose |
|---|---|---|
| `--build` | `impeccable` | Primary taste critic; enforces doctrine; catches generic AI patterns |
| `--build` | `emil-design-eng` | Micro-polish critic; spacing, easing, transitions |
| `--build` | `frontend-design` | Builds layout-heavy, visual-first sections |
| `--build` | `senior-frontend` | Builds interaction-heavy or technically complex sections |
| `--build` | `superpowers:dispatching-parallel-agents` | Fan-out: dispatch build subagents per section simultaneously |
| `--build` | `shot` | Headless-Chrome screenshot capture; renders HTML/URL and returns PNG |
| Both | `firecrawl-scrape` | Pull a live reference if a section direction needs evidence |
| Both | `ab-testing` | Wire up the experiment from the accountable-WOW block |
| Both | `analytics` | Wire up the instrumentation from the accountable-WOW block |

---

## Outputs

| Mode | File | Contents |
|---|---|---|
| Default | `prompt-pack.md` | Self-contained build prompts, one per section, with tokens + motion spec + accountable-WOW |
| `--build` | `studio-output.md` | Section-by-section build results, gate status, critic notes, screenshot references |
| `--build` | `[section].png` | Screenshot of each built section (from `shot`) |

---

## What this skill does NOT do

- Redesign the direction or change tokens — those are locked in `direction.md`.
- Override the ONE CTA or growth strategy — those are locked in `growth.md`.
- Redesign the motion architecture — that is locked in `motion.md`.
- Write production code in default mode — `prompt-pack.md` contains prompts only.
- Accept a section without visual verification via `shot` in `--build` mode.
- Remove the signature moment — it is redesigned to clear gates, never deleted.

---

## Doctrine enforced

From `reference/doctrine.md`:

**Taste half:**
- **Editorial type with a real scale** — every section prompt specifies the type scale from the spine; no timid defaults.
- **Exactly ONE signature moment** — the signature moment from `motion.md` is carried verbatim into the relevant section prompt; no second signature moment is introduced.
- **References before vibes** — the upstream phases locked references; handoff does not invent new directions.
- **Reduced-motion and perf budget are part of "done"** — every prompt's acceptance criteria includes the perf/a11y gate; in `--build`, the gate check is explicit and blocking.
- **Reject the generic AI look** — the `--build` flag check and `impeccable` critic actively screen for the five disqualifying patterns.

**Growth half:**
- **Clear value prop above the fold** — the hero section prompt explicitly requires legible value prop above the fold.
- **ONE primary CTA** — the CTA from `growth.md` is passed verbatim; no new CTAs are introduced.
- **WOW must serve the conversion goal** — every accountable-WOW block is passed through; sections without a WOW item get the minimal perf/a11y gate only.

**Tension-resolution:**
Perf/a11y floors are hard → conversion goal wins ties → signature moment is redesigned, never deleted. The `--build` gate check enforces this order explicitly.

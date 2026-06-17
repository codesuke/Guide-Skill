---
name: de-motion
description: Architects the full motion layer for a page — per-section scroll behaviour, a scored signature-moment shortlist (exactly ONE winner), a motion-vs-tech matrix routing each effect to GSAP ScrollTrigger / Framer Motion / CSS / R3F, and a11y + perf budget as hard floors. Use when asked about "motion design", "scroll animation plan", "parallax plan", "gsap plan", "animation architecture", "how should this move", "scroll experience", "scroll choreography", "entrance animations", "page motion", "interaction design plan", or "motion strategy". Reads direction.md and growth.md; produces motion.md. Does not write production code.
---

# de-motion — Motion Architecture, Signature-Moment Lab, and a11y + Perf Gates

## What this skill does

Reads `direction.md` (from `de-direction`) and `growth.md` (from `de-growth`) and produces the full motion architecture for the page. It maps per-section scroll behaviours, runs a scored Signature-Moment Concept Lab to select exactly ONE hero-level interaction, builds a Motion-vs-Tech Matrix routing each effect to the right implementation tool, and locks a11y + perf floors that every motion decision must clear before it reaches handoff.

Output: `motion.md` in the working directory.

---

## Hard rules

These constraints are non-negotiable. They cannot be waived by downstream instructions, client preferences, or aesthetic arguments.

1. **Exactly ONE signature moment.** The shortlist must score candidates on impact × feasibility and pick one winner. Never assert a signature moment without showing the shortlist and scores. Competing signature moments are cut, not compromised.

2. **Motion without intent is cut.** Every effect must have a stated conversion bet or UX purpose tied to content or the conversion goal from `growth.md`. Decoration with no rationale is removed at synthesis, regardless of how good it looks.

3. **Reduced-motion fallbacks are mandatory floors.** Every effect in `motion.md` must list its `prefers-reduced-motion` fallback. A signature moment that cannot survive that fallback is redesigned to a lighter technique — it is never deleted. Every page keeps exactly one signature moment.

4. **Perf budget is a hard floor.** LCP < 2.5 s and CLS = 0 from motion are non-negotiable. Any effect that risks CLS (position-shifting during scroll) or delays LCP must be redesigned or deferred. These floors cannot be traded for aesthetic or conversion goals.

5. **References before vibe.** Fetch at least one live Awwwards or comparable reference before finalising the signature-moment shortlist. If the network is unavailable, state "OFFLINE — reference fetch failed" explicitly, degrade to named references from memory, and mark items as `[reference unverified]`.

6. **The signature moment is redesigned, not deleted, under conflict.** If the chosen signature moment violates a perf or a11y floor, it is redesigned (lighter technique, reduced-motion version) to fit. The floor still wins — but the moment survives in adapted form.

7. **Tension-resolution order.** Perf/a11y floors → conversion goal → signature moment. The moment is never removed to win a conversion argument; it is adapted.

---

## Inputs

- `direction.md` — read sections: **Winning Direction**, **Token + Component Spine** (scroll-linked elements, signature moment candidate, layout rhythm).
- `growth.md` — read sections: **Primary conversion goal**, **The ONE CTA**, **Hypotheses**, **Funnel map** (doubt points, friction zones).

If either file is missing, stop and ask. Do not design motion blind.

---

## Procedure

### 0. Read inputs

Open `direction.md` and `growth.md` from the working directory. Extract and hold in context:

From `direction.md`:
- The ONE signature moment nominated in the winning direction (starting candidate for the lab).
- Scroll-linked elements mentioned in the system spine.
- Any perf/a11y notes flagged in the direction.

From `growth.md`:
- The primary CTA (label, placement, funnel stage).
- The primary conversion goal.
- Funnel doubt points — these are where trust-building motion earns its place.
- Accountable WOW hypotheses — these anchor conversion bets for any motion proposed here.

---

### 1. Fetch live motion references (MANDATORY before finalising shortlist)

Invoke `firecrawl-search` or `firecrawl-deep-research` to pull Awwwards or comparable references. Do not skip. If unavailable, follow the degradation rule above.

Query forms that work well:
- `"scroll animation awwwards site:awwwards.com"`
- `"parallax scroll storytelling gsap award-winning landing page"`
- `"[product category] interactive scroll experience design"`

For each fetched reference, record:
```
URL: [live URL]
Motion technique: [what specifically moves — parallax layer, pinned scrub, word-by-word reveal, etc.]
What to steal: [the specific timing, easing, or choreography pattern]
Conversion purpose: [what behaviour this motion is designed to elicit]
```

Aim for 3–5 references. Each must annotate a specific technique — not just "looks nice."

---

### 2. Per-section motion architecture

Map the page section by section. Emit each section under its own `### <Section name>`
markdown sub-header (e.g. `### Hero`, `### Social Proof`) — one sub-header per section,
NOT a single fenced block. The `### ` sub-headers are the parseable section map that
`de-handoff` reads to build its section list. Under each section's sub-header, define
the per-section fields:

```
### [Section name — e.g. Hero, Features, Social Proof, CTA, Footer]
Motion type: [one of: parallax / snap / pin-scrub / stagger-in / word-reveal / static / masked-reveal / progressive-blur / none]
Intent: [why — what UX or conversion goal does this motion serve]
Trigger: [viewport entry / scroll position / user interaction]
Reduced-motion fallback: [exact fallback — e.g. "fade-in at 0.3s" or "instant reveal"]
CLS risk: [none / low (state why) / HIGH (redesign required)]
LCP impact: [none / deferral possible / BLOCKS LCP (flag for redesign)]
```

Sections with `CLS risk: HIGH` or `LCP impact: BLOCKS LCP` must be redesigned before the motion architecture is finalised. Flag them explicitly with `[REDESIGN REQUIRED]`.

Minimum 5 sections mapped. If `direction.md` specifies fewer sections, infer from standard landing page structure and note the inference.

---

### 3. Signature-Moment Concept Lab

This is the core of `de-motion`. Run a structured scoring process to select exactly ONE signature moment.

#### 3a. Generate the shortlist

Generate 4–6 candidate signature moments. Each must be distinct — different technique, different section, different emotional register. Do not default to "hero parallax" without considering alternatives.

For each candidate:

```
Candidate: [name — e.g. "Pinned hero scrub with depth layers", "Staggered word reveal on the value prop", "Masked-reveal feature cards on scroll"]
Technique: [specific — what moves, how, easing direction]
Section: [where it lives on the page]
Reference: [cite a fetched reference or named reference from memory]
Conversion bet: [explicit bet — how this motion serves the primary CTA or conversion goal from growth.md]
Reduced-motion version: [what the fallback looks like — must be defined before scoring]
Feasibility notes: [any perf risk, CLS risk, or implementation complexity flag]
```

#### 3b. Score the shortlist

Score each candidate on impact × feasibility. Show every score and its rationale.

| Candidate | Impact (1–5) | Feasibility (1–5) | Impact × Feasibility | Conversion bet strength (1–5) | Perf/a11y risk (5=none, 1=high) | Weighted total |
|---|---|---|---|---|---|---|

Weighted total formula: `(Impact × Feasibility) × 0.4 + Conversion_bet × 0.35 + Perf_a11y × 0.25`

Show the arithmetic for each row.

**Impact** — how much emotional or narrative punch does this moment deliver? Does it make the page memorable?
**Feasibility** — implementation complexity, perf risk, timeline fit.
**Conversion bet strength** — how directly does this serve the ONE CTA and primary conversion goal?
**Perf/a11y risk** — does this moment survive reduced-motion? Does it avoid LCP delay and CLS?

#### 3c. Select the winner

The highest-scoring candidate wins. State:
- Why it won (top 2 criteria).
- What the runner-up offered that the winner does not (and whether any element can be grafted without competing with the moment).
- The exact reduced-motion fallback — this is mandatory, not optional.

If the winning candidate has a perf or a11y flag, redesign it here to resolve the flag before declaring it the winner. State what changed and why the redesigned version still earns its score.

---

### 4. Motion-vs-Tech Matrix

For every distinct motion effect identified in the per-section architecture (Step 2) and the signature moment (Step 3), assign a technology and state the reason.

```
Effect: [specific description — e.g. "Pinned hero section with depth parallax on scroll"]
Technology: [GSAP ScrollTrigger / Framer Motion / CSS / R3F (Three.js) / CSS + JS minimal / None]
Reason: [why this tool wins for this effect — be specific: "ScrollTrigger because scrub requires frame-accurate progress binding that Framer's viewport trigger can't provide"]
Sub-skills to invoke: [list the skills that implement this effect]
Reduced-motion override: [how this effect is disabled/replaced under prefers-reduced-motion]
Perf note: [any bundle-size, paint, or compositing consideration]
```

Technology selection guide (enforce these defaults unless a specific case overrides):

| Effect type | Default tool | Override condition |
|---|---|---|
| Scroll-driven scrub / pin | GSAP ScrollTrigger | — |
| Timeline sequences with stagger | GSAP timeline + gsap-plugins | — |
| Component-level enter/exit transitions | Framer Motion | Only when already in the React tree for UI state; avoid for scroll-driven work |
| Pure CSS transitions (hover, focus, simple fade) | CSS | Always prefer CSS for stateless, non-scroll effects |
| 3D scenes, WebGL, particles | R3F / Three.js | CSS/SVG if the 3D is decorative and a flat fallback is acceptable |
| Cinematic full-page scroll system | cinematic-gsap-lenis-motion-system | When the whole page uses Lenis smooth scroll |
| Word-by-word text reveal | staggered-word-reveal | — |
| Image/section masked entrance | masked-reveal | — |
| Background blur progression | progressive-blur | — |

---

### 5. a11y + Perf budget (Hard Floors)

State the budget as a formal constraints table. These are floors, not targets — everything above them is acceptable, anything below them requires a redesign of the offending effect.

#### 5a. Performance floors

```
LCP target:         < 2.5 s on 4G mid-range mobile
CLS budget:         0.00 (motion must not shift layout; use transform/opacity only)
INP budget:         < 200 ms for any interaction-triggered animation
Total animation JS: ≤ 60 KB gzipped for GSAP + Lenis combined (tree-shake aggressively)
GPU layer budget:   ≤ 8 simultaneous composited layers during peak scroll
```

For each effect in the Motion-vs-Tech Matrix, confirm it uses only `transform` and `opacity` for animation properties (GPU-compositable, CLS-safe). Flag any effect that animates `height`, `width`, `top`, `left`, `margin`, or `padding` — these cause layout thrash and must be redesigned.

#### 5b. Accessibility floors

```
prefers-reduced-motion: all effects must have an explicit fallback defined
WCAG 2.1 AA motion:    no animation > 5 flashes per second
WCAG 2.1 AA contrast:  motion does not reduce text contrast below 4.5:1 at any point
Focus management:       scroll-hijack / pinned sections must not trap keyboard focus
```

For every effect, the reduced-motion fallback must be one of:
- **Instant reveal** — element appears at its final state, no animation.
- **Simple fade** — 200–300 ms opacity transition only.
- **Static state** — no motion at all; content fully readable without animation.

Fallbacks that are themselves animations (e.g. "slower parallax") are not acceptable — they do not satisfy `prefers-reduced-motion`.

#### 5c. Signature moment under floor conflict

If the chosen signature moment conflicts with any floor above:

1. State the conflict explicitly.
2. Propose a redesigned technique that clears the floor.
3. Confirm the redesigned technique still earns its signature-moment status.
4. Update the reduced-motion fallback if needed.

**The moment is never deleted. It is adapted.**

---

### 6. Write motion.md

Produce `motion.md` in the working directory with exactly these section headers:

```markdown
# motion.md

## Per-Section Motion Architecture

## Signature Moment

### Shortlist + Scores
### Winner
### Reduced-Motion Fallback

## Motion-vs-Tech Matrix

## a11y + Perf Budget

### Performance Floors
### Accessibility Floors
### Signature Moment Under Floor Conflict
```

Each section must be populated. An empty section is a failure.

---

## Skills invoked and their role

| Phase | Skill | Purpose |
|---|---|---|
| References | `firecrawl-search` | Pull live Awwwards / motion references before shortlist |
| References | `firecrawl-deep-research` | Supplement with deeper scroll-experience research |
| Full-page scroll system | `cinematic-gsap-lenis-motion-system` | When the page uses Lenis smooth scroll as the base |
| Scroll-driven effects | `gsap-scrolltrigger` | Pin, scrub, parallax, viewport-triggered sequences |
| Timeline sequences | `gsap-timeline` | Staggered timelines, orchestrated multi-element sequences |
| Advanced GSAP effects | `gsap-plugins` | SplitText, DrawSVG, MorphSVG, or other plugin-dependent effects |
| 3D scenes | `threejs` | Full Three.js scene integration for 3D signature moments |
| 3D objects | `webgl-3d-object` | Single 3D object in a canvas layer |
| Globe / particle 3D | `globe-gl` | Interactive globe-style 3D effects |
| Globe particles | `globe-particles` | Particle-based globe or sphere effects |
| Text reveal | `staggered-word-reveal` | Word-by-word or character-by-character text entrance |
| Image entrance | `masked-reveal` | Clip-path or mask-based image/section reveal |
| Background blur | `progressive-blur` | Scroll-driven blur progression on backgrounds |

---

## Outputs

- `motion.md` in the current working directory, with all sections populated.
- A brief inline summary after writing: signature moment name + technique, runner-up technique that was cut and why, top perf constraint that shaped the decision.

---

## What this skill does NOT do

- Write production code (that is `de-handoff`, which drives `frontend-design` and `senior-frontend`).
- Override the ONE CTA or funnel sequence from `growth.md`.
- Change the design system tokens from `direction.md`.
- Define copy or layout (those are `de-direction` outputs).

---

## Doctrine enforced

From `reference/doctrine.md`:

**Taste half:**
- **Exactly ONE signature moment per page** — the lab scores candidates and picks one; this skill develops it with full craft.
- **References before vibes** — live motion references are fetched in Step 1 before the shortlist is generated.
- **Perf and a11y are part of "done"** — reduced-motion fallbacks and the perf budget are locked in Steps 5 and integrated into every effect in Step 4, not added at handoff.

**Growth half:**
- **WOW must serve the conversion goal** — every effect in the Motion-vs-Tech Matrix must have a stated conversion bet; decoration with no rationale is cut.

**Tension-resolution:**
Perf/a11y floors are hard → conversion goal wins ties → the signature moment is redesigned to serve both goals, never deleted. If the signature moment conflicts with a floor, it is adapted (lighter technique, proper fallback) so every page retains exactly one crafted moment.

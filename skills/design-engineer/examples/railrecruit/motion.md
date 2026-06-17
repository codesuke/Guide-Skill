# motion.md

> Reads `direction.md` (Winning Direction = "Clearing House"; nominated signature moment = "Outcome
> Ladder"; spine tokens) and `growth.md` (primary goal = enrollment; ONE CTA = "Enroll Now"; funnel doubt
> points; hypotheses).
>
> **References (de-motion §1):** the live reference pass from the direction phase (Unbounce / Landingi /
> Dribbble course-landing sets, session-fetched) is reused here for motion technique; additional Awwwards
> motion references are cited as **named** with prose (documented fallback) to keep firecrawl usage minimal.
> At least one fetched reference anchors the shortlist, satisfying references-before-vibe.

## Per-Section Motion Architecture

```
Section: Hero (value prop + CPD trust strip + Enroll CTA)
Motion type: stagger-in (headline → subhead → trust strip → CTA), CSS-driven
Intent: deliver value prop in < 5s; sequence guides the eye down the Z-path to the CTA (serves H-CTA)
Trigger: viewport entry (on load, above the fold)
Reduced-motion fallback: instant reveal — all elements at final state, no stagger
CLS risk: none (text reserved space; transform/opacity only)
LCP impact: none — hero headline is the LCP element and renders immediately; motion is opacity-only on
            already-painted text, so LCP is NOT blocked
```
```
Section: Outcome Ladder (eligibility → course → CPD certificate → railway role)  [SIGNATURE MOMENT]
Motion type: pin-scrub (pinned section, steps advance with scroll progress)
Intent: make the job outcome feel inevitable; the core trust/desire builder before the decision
Trigger: scroll position (pinned scrub)
Reduced-motion fallback: static stacked steps (all four visible at once, no pin, no scrub) — fully readable
CLS risk: low — pin reserves the section height up front (no late layout shift); verify pin spacer
LCP impact: none — below the fold, deferred
```
```
Section: Proof / Testimonials (placement outcomes at doubt point)
Motion type: stagger-in (cards fade+rise on entry)
Intent: deliver trust exactly at doubt moment 1 (serves H-Proof)
Trigger: viewport entry
Reduced-motion fallback: simple fade (200ms) or instant; static stack
CLS risk: none — media has reserved aspect-ratio boxes (prevents the buried-image CLS recon implies)
LCP impact: none — below fold, images lazy-loaded
```
```
Section: Pricing / Decision Block (price + inclusions + CPD + risk-reversal)
Motion type: static (no scroll motion) — only CTA hover micro-interaction
Intent: the decision moment must be calm and instantly legible; motion here would add friction
Trigger: user interaction (CTA hover/focus only)
Reduced-motion fallback: hover color change only (no transform) — already minimal
CLS risk: none — fully static block
LCP impact: none — below fold
```
```
Section: Social Proof 2 / Pre-CTA reassurance (track record + final testimonial)
Motion type: stagger-in
Intent: trust at doubt moment 2 immediately before the repeated Enroll CTA
Trigger: viewport entry
Reduced-motion fallback: instant reveal
CLS risk: none
LCP impact: none
```
```
Section: Footer + mobile sticky CTA bar
Motion type: snap (sticky bar slides in on scroll-past-hero); footer static
Intent: keep the ONE CTA always reachable on mobile (serves H-CTA)
Trigger: scroll position (past hero)
Reduced-motion fallback: sticky bar present statically (no slide), or fixed without animation
CLS risk: none — fixed-position overlay, does not affect document flow
LCP impact: none
```
> 6 sections mapped (minimum 5 satisfied). No section carries `[REDESIGN REQUIRED]`: the only scrub/pin
> (Outcome Ladder) reserves height up front so CLS stays low, and no motion blocks LCP.

## Signature Moment

### Shortlist + Scores

Four distinct candidates generated (different technique / section / register). Reduced-motion version
defined for each *before* scoring (mandatory).

```
Candidate A: Outcome Ladder — pinned scrub step sequence
Technique: section pins; scroll progress advances eligibility→course→CPD→railway-role; each step eases in (power2.out)
Section: Outcome Ladder (mid-page, pre-decision)
Reference: Landingi education "guide to one clear action" principle (session-fetched) + named Awwwards pinned-scrub storytelling pattern [reference unverified]
Conversion bet: visualizes the job outcome as inevitable → directly raises desire before the pricing/CTA (serves enrollment goal + H-Proof)
Reduced-motion version: static stacked four steps, all visible, no pin/scrub
Feasibility notes: GSAP ScrollTrigger pin; must reserve pin height to keep CLS low; moderate complexity
```
```
Candidate B: Kinetic value-prop headline (word reveal on "job-ready")
Technique: SplitText word-by-word reveal on hero headline
Section: Hero
Reference: editorial kinetic-headline pattern (Concept 2 graft) [reference: named]
Conversion bet: emphasises the outcome word at first impression
Reduced-motion version: instant full headline
Feasibility notes: risk — animating the LCP element can delay LCP; must render text first then animate opacity only
```
```
Candidate C: 3D signalling-track flythrough
Technique: R3F scene, track lights up on scroll
Section: Hero/background
Reference: Dribbble dark course concepts (session-fetched listing) [named]
Conversion bet: spectacle / premium feel
Reduced-motion version: static image of the track
Feasibility notes: HIGH perf risk — heavy bundle vs the "slow site" we are fixing; contradicts LCP floor
```
```
Candidate D: Animated count-up trust metrics (learners trained, placement rate)
Technique: number count-up on viewport entry
Section: Trust strip
Reference: standard SaaS metric count-up [named]
Conversion bet: dramatizes track-record proof
Reduced-motion version: static final numbers
Feasibility notes: low impact, common/generic; minimal risk
```

| Candidate | Impact | Feasibility | I×F | Conv-bet (1–5) | Perf/a11y (5=none) | Weighted total |
|---|---|---|---|---|---|---|
| A — Outcome Ladder | 5 | 4 | 20 | 5 | 4 | **10.40** |
| B — Kinetic headline | 4 | 3 | 12 | 3 | 3 | **6.60** |
| C — 3D track | 5 | 2 | 10 | 3 | 1 | **5.30** |
| D — Count-up metrics | 2 | 5 | 10 | 3 | 5 | **6.30** |

Formula: `(Impact×Feasibility)×0.4 + Conv_bet×0.35 + Perf_a11y×0.25`
- A = 20×.4 + 5×.35 + 4×.25 = 8.00 + 1.75 + 1.00 = **10.40**
- B = 12×.4 + 3×.35 + 3×.25 = 4.80 + 1.05 + 0.75 = **6.60**
- C = 10×.4 + 3×.35 + 1×.25 = 4.00 + 1.05 + 0.25 = **5.30**
- D = 10×.4 + 3×.35 + 5×.25 = 4.00 + 1.05 + 1.25 = **6.30**

### Winner

**Candidate A — Outcome Ladder (pinned scrub step sequence).**

- **Why it won (top 2 criteria):** highest *impact* (it dramatizes the exact thing the audience is anxious
  about — the path to a railway job) and strongest *conversion bet* (it builds desire immediately before the
  pricing/decision block, the highest-leverage doubt point).
- **What the runner-up (B, kinetic headline) offered that the winner does not:** first-impression punch on
  the value prop. **Graft without competing:** keep a *minimal* opacity stagger on the hero (already in the
  per-section map) — but NOT a second signature moment; it stays a supporting micro-effect, not a scrub.
- **Exactly ONE signature moment confirmed:** Outcome Ladder. Candidates B/C/D are cut as competing
  signature moments (C also cut on perf floor; D on low impact/generic).
- **Reduced-motion fallback (mandatory):** static stacked four-step ladder, all steps visible, no pin/scrub —
  fully readable and still narratively complete.

### Reduced-Motion Fallback

The signature moment's `prefers-reduced-motion` fallback is **a static stacked sequence**: the four steps
(eligibility → course → CPD certificate → railway role) render as a normal vertical list, all visible, with
no pinning and no scroll-scrub. The narrative survives intact; only the choreography is removed. This is a
*static state*, an acceptable fallback per the floor (not "slower parallax").

## Motion-vs-Tech Matrix

```
Effect: Outcome Ladder — pinned section, steps advance on scroll progress  [SIGNATURE MOMENT]
Technology: GSAP ScrollTrigger
Reason: scrub requires frame-accurate scroll-progress binding + pinning that Framer's viewport trigger can't provide
Sub-skills to invoke: gsap-scrolltrigger, gsap-timeline
Reduced-motion override: ScrollTrigger.matchMedia / gsap.matchMedia disables pin+scrub → static stacked steps
Perf note: transform/opacity only; pin spacer reserves height (CLS-safe); GSAP+ScrollTrigger tree-shaken
```
```
Effect: Hero stagger-in (headline → subhead → trust strip → CTA)
Technology: CSS (keyframes + IntersectionObserver gate) — or Framer Motion only if already in React tree
Reason: stateless, on-load, non-scroll → CSS is cheapest and avoids JS on the LCP path
Sub-skills to invoke: animation-on-scroll (IO gate), staggered-word-reveal (optional, hero micro-graft)
Reduced-motion override: @media (prefers-reduced-motion) → no stagger, final state
Perf note: opacity-only on already-painted text; does not block LCP
```
```
Effect: Proof / testimonial cards stagger-in
Technology: CSS + IntersectionObserver
Reason: simple viewport-entry reveal; no scrub needed
Sub-skills to invoke: animation-on-scroll
Reduced-motion override: @media query → simple 200ms fade or instant
Perf note: transform/opacity; reserved aspect-ratio media boxes prevent CLS
```
```
Effect: Pricing block CTA hover/focus micro-interaction
Technology: CSS
Reason: stateless hover/focus → always prefer CSS
Sub-skills to invoke: (none — tokenized CSS transition)
Reduced-motion override: color change only, no transform
Perf note: compositor-only; trivial
```
```
Effect: Mobile sticky CTA bar slide-in past hero
Technology: CSS + minimal JS (scroll position class toggle)
Reason: single scroll threshold, no scrub → CSS transition driven by a JS-toggled class is lightest
Sub-skills to invoke: animation-on-scroll
Reduced-motion override: bar appears statically (no slide)
Perf note: fixed-position transform; does not affect document flow → no CLS
```

## a11y + Perf Budget

### Performance Floors

```
LCP target:         < 2.5 s on 4G mid-range mobile
CLS budget:         0.00 (transform/opacity only; pin reserves height; media has reserved aspect ratios)
INP budget:         < 200 ms for any interaction-triggered animation
Total animation JS:  ≤ 60 KB gzipped (GSAP core + ScrollTrigger only; no Lenis needed — native scroll;
                     CSS used everywhere except the one scrub)
GPU layer budget:    ≤ 8 composited layers at peak scroll (Outcome Ladder uses ≤ 4 step layers)
```
Property audit — every effect animates **only** `transform` and `opacity`:
- Outcome Ladder: transform (translate/opacity) ✔
- Hero stagger: opacity (+ small translateY) ✔
- Testimonial cards: opacity + translateY ✔
- Pricing CTA hover: background-color (compositor-safe, non-layout) ✔
- Sticky bar: transform translateY ✔
No effect animates height/width/top/left/margin/padding → no layout thrash. **No effect flagged for redesign.**

### Accessibility Floors

```
prefers-reduced-motion: every effect above has an explicit fallback (instant / simple-fade / static) — listed per effect
WCAG 2.1 AA motion:     no effect flashes > 5×/s (none flash at all)
WCAG 2.1 AA contrast:   motion never reduces text contrast below 4.5:1 — text animates opacity 0→1 to FINAL
                        contrast-passing color; mid-animation low-opacity frames are non-text-critical
Focus management:       the pinned Outcome Ladder must NOT trap keyboard focus — pin is visual only; tab order
                        proceeds linearly through the four steps; pin releases on focus-out
```
Each fallback is one of the allowed kinds (instant reveal / simple ≤300ms fade / static) — no fallback is itself a parallax/scrub.

### Signature Moment Under Floor Conflict

The Outcome Ladder (pinned scrub) was checked against every floor:
- **CLS:** potential risk if the pin shifts layout — **resolved** by reserving the pin-spacer height up front (CLS stays 0).
- **a11y / reduced-motion:** **resolved** — static stacked fallback already defined; narrative survives.
- **Focus:** **resolved** — pin is visual; focus order is linear and not trapped.

No floor is violated, so **no redesign is required**; the signature moment ships as scored. (Had a conflict
existed, the rule is: floor wins, moment is *adapted* to a lighter technique — e.g. a non-pinned
viewport-triggered step reveal — never deleted. Documented here for completeness.)

---

### Inline summary (for orchestrator)

- **Signature moment:** "Outcome Ladder" — GSAP ScrollTrigger pinned scrub, eligibility→course→CPD→railway-role (weighted 10.40).
- **Runner-up cut:** kinetic value-prop headline (B) — cut as a competing signature moment; demoted to a supporting hero micro-stagger. 3D track (C) cut on the perf floor.
- **Top perf constraint that shaped decisions:** LCP < 2.5 s + CLS 0 — killed the 3D candidate and forced the pin to reserve height; CSS used everywhere except the single scrub.

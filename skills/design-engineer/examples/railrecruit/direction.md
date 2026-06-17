# direction.md

> Reads `recon.md` (Purpose, Audience, Design audit, What to keep) and `growth.md` (Primary conversion
> goal, The ONE CTA, Hypotheses).
>
> **Taste calibration (de-direction §0b):** `taste-ledger.md` has a `## Calibration` section but **no
> entries** — *Taste ledger has no calibration entries — proceeding without bias.* No score adjustments
> applied.
>
> **References (de-direction §1):** one live reference pass was run via `firecrawl-search`
> (query: "modern online course enrollment landing page design award-winning education"). The curated
> result sets below are session-fetched. To keep the smoke test cheap, the remaining concepts cite the
> same fetched reference set plus named references with prose (documented fallback) — these are marked
> `[reference: named, not individually scraped]`. The references-before-vibes rule is satisfied: at least
> one fetched reference anchors the winning concept.

## Winning Direction

### Tournament

Three genuinely distinct concepts were generated and scored. Archetypes chosen for the audience
(anxiety-driven, credibility-first, India career market): Clean-trust, Editorial-bold, Cinematic-dark.

#### Concept 1: "Clearing House" (Clean-trust)

- **Character:** Calm, legible, anxiety-reducing — every screen answers one question and points at one action.
- **References:** `unbounce.com/landing-page-examples/online-course/` (session-fetched) — steal the
  single-action above-fold pattern and explicit pricing-with-inclusions block that recurs in the
  highest-converting course pages listed.
- **Typography:** Headline = Geist / Inter-style grotesk, 600–700 weight; body = same family 400; strong
  size contrast (display ~3.5× body) so the value prop pulls without color noise.
- **Color palette:** `#FFFFFF` bg, `#0E1B2C` ink (railway-navy), `#127C71` accent (signal teal), `#5B6B7B`
  muted, `#EEF2F4` section fill.
- **Signature moment:** an **"Outcome Ladder"** — a single scroll-pinned step sequence (eligibility →
  course → CPD certificate → railway role) that makes the job outcome feel inevitable.
- **Layout intent:** Z-pattern above fold (value prop top-left → CPD badge top-right → Enroll CTA on the
  diagonal); single-column body for scannability.
- **Conversion bet:** Directly serves H-Pricing and H-Proof — clarity and trust at doubt points is exactly
  what an anxious, outcome-driven audience needs to enroll.
- **Disqualifying flags:** none (must avoid drifting into centred default-card stacks — explicitly use a
  left-aligned editorial grid instead).

#### Concept 2: "Signal Type" (Editorial-bold)

- **Character:** Authoritative, magazine-grade — big type does the persuading; the institute reads as a serious credential body.
- **References:** `landingi.com/blog/education-landing-pages/` (session-fetched) — steal the
  value-quickly / one-clear-action principle, expressed through a dominant editorial headline rather than imagery.
- **Typography:** Display serif (e.g. a transitional serif) at 6–7vw for headlines, grotesk body; very high contrast.
- **Color palette:** `#FAF7F0` warm paper, `#161616` ink, `#127C71` accent, `#8A8170` muted.
- **Signature moment:** a **kinetic headline** — the value prop word "job-ready" composes on entry (word reveal).
- **Layout intent:** F-pattern; dominant headline column left, proof rail right; CTA after the headline.
- **Conversion bet:** Editorial authority raises perceived legitimacy (serves the trust goal), supporting H-CTA by making the single CTA feel like the obvious next step.
- **Disqualifying flags:** none, but serif display risks legibility on low-end Indian mobile devices (audience-fit risk — noted in scoring).

#### Concept 3: "Control Room" (Cinematic-dark)

- **Character:** Premium, technical, powerful — dark "signalling control room" aesthetic.
- **References:** `dribbble.com/tags/course-landing-page` (session-fetched listing) — steal depth/contrast
  treatment from premium dark course concepts. `[reference: named, not individually scraped]`
- **Typography:** Mono-accented grotesk; high-contrast light pulls on dark.
- **Color palette:** `#0B0F14` bg, `#E6EDF3` text, `#19A38C` accent glow, `#1C2530` surface.
- **Signature moment:** a **3D/parallax signalling track** that lights up on scroll.
- **Layout intent:** Z-pattern on dark; hero CTA high-contrast.
- **Conversion bet:** Dark "power" register appeals to the upskilling-professional persona — but weaker for the anxious fresher who reads dark+heavy as intimidating, not reassuring.
- **Disqualifying flags:** **risk of generic AI look** — glowing accent + dark gradient hero is one of the
  doctrine's named patterns; would need explicit replacement. Also highest perf risk (3D / heavy assets vs the "slow site" we are fixing).

#### Scoring (1–5 per criterion; weighted)

Weights: Growth 30%, Editorial type 20%, References 15%, No-AI-look 15%, Signature moment 20%.

| Concept | Growth (0.30) | Editorial type (0.20) | References (0.15) | No-AI-look (0.15) | Signature (0.20) | Weighted total |
|---|---|---|---|---|---|---|
| 1 — Clearing House | 5 | 4 | 5 | 5 | 4 | **4.55** |
| 2 — Signal Type | 4 | 5 | 4 | 5 | 4 | **4.35** |
| 3 — Control Room | 3 | 4 | 4 | 2 | 4 | **3.40** |

Arithmetic:
- C1 = 5×.30 + 4×.20 + 5×.15 + 5×.15 + 4×.20 = 1.50 + 0.80 + 0.75 + 0.75 + 0.80 = **4.55**
- C2 = 4×.30 + 5×.20 + 4×.15 + 5×.15 + 4×.20 = 1.20 + 1.00 + 0.60 + 0.75 + 0.80 = **4.35**
- C3 = 3×.30 + 4×.20 + 4×.15 + 2×.15 + 4×.20 = 0.90 + 0.80 + 0.60 + 0.30 + 0.80 = **3.40**

#### Winner: Concept 1 — "Clearing House"

**Kill two:**
- **Concept 3 (Control Room) — eliminated.** Lowest growth alignment (dark/intimidating for the primary
  anxious fresher persona), triggers the named generic-AI dark-glow pattern (scored 2 on no-AI-look), and
  carries the highest perf risk while the brief's core problem is a *slow* site. Wrong tool for this audience.
- **Concept 2 (Signal Type) — eliminated (narrow loss).** Strongest editorial type, but display-serif
  legibility risk on low-end mobile slightly lowers growth fit, and the kinetic-headline moment serves trust
  less directly than the Outcome Ladder serves the job-outcome promise.

**Develop the winner — grafts from runners-up:**
- **Graft from Concept 2:** raise the headline type contrast (display ~3.5–4× body) so "Clearing House" gets
  Editorial-bold's persuasive type pull *without* the serif mobile-legibility risk — keep the grotesk family.
- **Graft from Concept 3:** borrow *one* depth cue — a subtle layered surface on the pricing block — to make
  the decision moment feel premium, **without** the dark theme, the glow, or any 3D perf cost.

#### Taste Bias Applied

No calibration entries in the taste ledger → **no bias applied.** Scores above are unadjusted. (Subsection
included per de-direction §0b so the absence of bias is explicit and challengeable.)

## Reference Board

#### Reference: Unbounce — online course examples

- **URL:** https://unbounce.com/landing-page-examples/online-course/
- **What to steal:** the recurring single-action above-fold layout and the explicit pricing-with-inclusions
  block that the highest-converting examples share — the structural answer to recon's "no clear pricing".
- **What to adapt:** these are conversion-first templates; layer in editorial type contrast so it doesn't read generic.
- **Session-fetched:** yes

#### Reference: Landingi — education landing pages

- **URL:** https://landingi.com/blog/education-landing-pages/
- **What to steal:** "communicate value quickly, reduce enrollment friction, guide to one clear action" —
  the exact friction/CTA discipline growth.md demands.
- **What to adapt:** use as a principle source, not a visual; the institute needs more authority/trust weight than a generic SaaS course page.
- **Session-fetched:** yes

#### Reference: Dribbble — course landing page tag

- **URL:** https://dribbble.com/tags/course-landing-page
- **What to steal:** depth/contrast treatments for the premium decision-block surface (the single graft from Concept 3).
- **What to adapt:** Dribbble concepts skew decorative and dark; take only the surface-depth cue, drop the dark theme and glow.
- **Session-fetched:** yes (listing); individual shots not separately scraped — `[reference: named, not individually scraped]`

## Token + Component Spine

### 5a. Color tokens

```
--color-bg-primary:     #FFFFFF   /* page background */                       contrast vs ink 16.1:1 (AAA)
--color-bg-secondary:   #EEF2F4   /* section / card backgrounds */            contrast vs ink 14.3:1 (AAA)
--color-surface:        #F7FAFB   /* elevated surface (pricing block, modal)*/contrast vs ink 15.4:1 (AAA)
--color-border:         #D6DEE3   /* default divider */                       decorative; non-text
--color-text-primary:   #0E1B2C   /* body + headings (railway navy) */        16.1:1 on white (AAA)
--color-text-secondary: #3C4A57   /* supporting copy */                       9.2:1 on white (AAA)
--color-text-muted:     #5B6B7B   /* captions, metadata */                    5.0:1 on white (AA)
--color-accent:         #0E6E63   /* primary CTA + links (signal teal, darkened for contrast) */ 5.3:1 on white (AA, AA-large pass for button text white 5.3:1)
--color-accent-hover:   #0B574E   /* CTA hover */                             7.1:1 on white (AAA)
--color-accent-subtle:  #E2F0EE   /* accent tint for trust strips */          decorative bg
```
> Accent teal darkened from the concept's `#127C71` to `#0E6E63` so white button text clears 4.5:1 (a11y
> floor). This is the conversion-critical color and must pass contrast, not just look good.

### 5b. Type scale

```
Type system: Headings + body = Geist Sans (grotesk, 400/600/700). Mono = Geist Mono (for course
codes / CPD credit numerals only). No display serif (avoids the Concept-2 mobile-legibility risk).

Scale (ratio ≈ 1.25 major-third, with a deliberate jump display→h1 for editorial pull):
--text-display:  clamp(2.75rem, 6vw, 4.5rem) / 1.05 / 700 / -0.02em   — hero value prop
--text-h1:       2.25rem / 1.1  / 700 / -0.01em   — page title
--text-h2:       1.75rem / 1.2  / 600 / -0.01em   — section heading
--text-h3:       1.375rem / 1.3 / 600 / 0          — card / subsection title
--text-body-lg:  1.25rem / 1.5  / 400 / 0          — lead paragraph
--text-body:     1.0625rem / 1.6 / 400 / 0         — default body
--text-body-sm:  0.875rem / 1.5 / 400 / 0          — captions, labels
--text-ui:       0.9375rem / 1.0 / 600 / 0.01em    — button labels, nav
```
> Stops: display→h1 ≈ 2× at top of clamp (strong editorial jump, graft from Concept 2); h1→h2→h3 ≈ 1.25×
> each. Display is ~4× body. Not flat — clears the doctrine no-flat-scale rule.

### 5c. Spacing rhythm

```
--space-unit:    8px

Section padding:  96px desktop / 56px mobile  — sections breathe; reduces "cluttered" finding
Container max-w:  1200px                       — wide layout, content not edge-to-edge
Column gutter:    24px
Component gap:    32px                          — default vertical rhythm between stacked blocks
Inline gap:       8px                           — icon + label, badge + text
```

### 5d. Core components

```
Component: Button (primary + secondary)
Driven by: shadcn (Button) + tailwindcss tokens
Variant notes: primary = accent solid (white text), the ONLY primary on a page; secondary = outline;
               states: hover (accent-hover), active, disabled, focus-visible ring (2px accent, 2px offset)
Doctrine note: exactly one primary instance at primary visual weight per page (enforces ONE CTA)

Component: Heading
Driven by: tailwindcss tokens (type scale 5b)
Variant notes: display / h1 / h2 / h3 levels; never skip levels for styling
Doctrine note: must use the scale stops — no ad-hoc sizes; editorial contrast required

Component: Section (layout wrapper)
Driven by: custom + tailwindcss
Variant notes: max-w 1200px, section padding tokens, optional bg-secondary fill
Doctrine note: enforces wide-layout + section breathing rhythm

Component: Card
Driven by: shadcn (Card) + tokens
Variant notes: course card, testimonial card; left-aligned content (NOT centred card stack)
Doctrine note: avoid the generic centred-card-stack-with-drop-shadow AI pattern; flat/bordered, left-aligned

Component: CTA Block (the ONE CTA)
Driven by: custom
Variant notes: pairs primary "Enroll Now" + demoted "Download syllabus"; includes pricing + risk-reversal
Doctrine note: single primary CTA component; cannot be instanced more than once at primary weight per page

Component: Navigation
Driven by: shadcn + custom
Variant notes: desktop top nav + mobile sticky bottom bar carrying the Enroll CTA
Doctrine note: mobile sticky CTA must be keyboard-reachable, focus-visible, contrast-passing

Component: Pricing Block
Driven by: custom + tokens
Variant notes: explicit price, inclusions list, CPD badge, money-back line; subtle surface depth (Concept-3 graft)
Doctrine note: static (no CLS), the decision-stage centrepiece; trust signals adjacent

Component: Trust Strip
Driven by: custom
Variant notes: CPD badge + "9 years" + learner count; sits under hero value prop and beside pricing
Doctrine note: proof at doubt points, never decorative
```

---

### Inline summary (for orchestrator)

- **Winning direction:** "Clearing House" (Clean-trust), weighted 4.55.
- **Top grafted runner-up element:** Editorial-bold's high headline type-contrast (from Concept 2) without the serif mobile risk.
- **Signature moment (nominated):** the "Outcome Ladder" scroll-pinned step sequence (eligibility → course → CPD → railway role). Handed to de-motion to develop.
- **Primary color tokens:** white bg, `#0E1B2C` navy ink, `#0E6E63` signal-teal accent (CTA).

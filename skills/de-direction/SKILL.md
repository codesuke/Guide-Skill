---
name: de-direction
description: Runs a 3-concept art-direction tournament and emits a design-system spine. Use when asked about "art direction", "design direction", "visual concepts", "design language", "look and feel", "moodboard", "design system spine", "visual identity", "pick a direction", or "what should the site look like". Reads recon.md and growth.md; produces direction.md with scored concepts, a live reference board, and the token/component spine. Does not write production code.
---

# de-direction — 3-Concept Tournament + Reference Board + System Spine

## What this skill does

Reads `recon.md` (from `de-recon`) and `growth.md` (from `de-growth`) and runs a structured art-direction tournament: fetch live references first, generate three genuinely distinct visual concepts, score each against the growth goal and the doctrine, kill two, develop the winner while grafting the best ideas from the runners-up. Then emits the design-system spine — color tokens, type scale, spacing rhythm, core components — that every subsequent page phase inherits.

Output: `direction.md` with three sections: (A) tournament, (B) reference board, (C) token + component spine.

---

## Hard rules

These constraints cannot be overridden by any downstream instruction:

1. **Fetch before you propose.** Run `firecrawl-deep-research` or `firecrawl-search` to pull live real-world references BEFORE generating any direction. Direction that is not anchored to a fetched reference is not direction — it is a vibe. Three distinct operating modes exist — choose based on the available budget and environment, and state the active mode at the top of `direction.md`:

   - **(a) Full mode** — fetch 5–8 live references; all concepts cite session-fetched URLs. Use when no firecrawl budget constraint is stated.
   - **(b) Budget-constrained mode** — fetch 1–3 live references using firecrawl credits; fill the remaining reference slots from the named-reference fallback below (cite each as "named, not fetched this session"). State at the top of `direction.md`: "BUDGET MODE — [n] live references fetched; remaining references are named fallbacks." Use when the caller flags a minimal-firecrawl budget.
   - **(c) Offline / no-firecrawl mode** — no fetch attempted; use the named-reference fallback exclusively; mark every direction item as `[reference unverified — offline mode]`. State at the top of `direction.md`: "OFFLINE MODE — no references fetched this session; all references are named fallbacks." Use only when the network is unavailable OR firecrawl tools are absent from the environment — not merely when credits are low (that is mode b).

   **Named-reference fallback (modes b and c):** cite specific, real URLs from your training knowledge — e.g. `https://linear.app`, `https://stripe.com/payments`, `https://vercel.com` — rather than vague adjectives. Named references count toward the "≥1 reference per concept" floor but must be labelled `[named, not fetched]`.

   The references-before-vibes rule is unchanged in all three modes: every concept must cite at least one reference — fetched OR a specific named URL. A concept with no reference of any kind is disqualified.

2. **Always three concepts.** Never propose fewer than three scored concepts. A single concept is a bias, not a tournament. If the brief seems to dictate one style, generate the two most interesting alternatives anyway — the scoring will confirm or challenge the obvious choice.

3. **No direction without ≥1 fetched reference.** Each concept must cite at least one reference obtained in this session. A concept with zero cited references is disqualified from winning the tournament.

4. **Reject the generic AI look.** These are automatically disqualifying in the winning direction (flag if present and replace): centred card stack with drop shadows; purple-to-blue gradient hero; emoji bullets in feature lists; glowing CTA button with blur halo; stock-illustration mascots. Use `impeccable` as primary critic to catch these patterns.

5. **One signature moment per page.** The winning concept must nominate exactly one signature moment per page. Everything else supports it. Do not develop two competing signature moments and call them a feature.

6. **WOW must carry a conversion bet.** Any striking visual treatment must have an explicit conversion bet stated (see Accountable WOW in `reference/accountable-wow.md`). Decorative direction without a conversion rationale is removed.

7. **Perf and a11y are floors.** Direction must note, for each high-craft element: the expected LCP impact, any CLS risk, and the reduced-motion fallback. These are not afterthoughts.

---

## Inputs

- `recon.md` — read sections: **Purpose**, **Audience**, **Design audit**, **What to keep**.
- `growth.md` — read sections: **Primary conversion goal**, **The ONE CTA**, **Hypotheses**.

If either file is missing, stop and ask. Do not generate direction blind.

---

## Procedure

### 0. Read inputs

Open `recon.md` and `growth.md` from the working directory. Extract and hold in context:

From `recon.md`:
- Product purpose and audience persona.
- Design audit findings — what is broken or generic today.
- What to keep — brand equity items, strong copy, trust signals.

From `growth.md`:
- The ONE primary CTA (label, destination, value prop contract).
- The primary conversion goal.
- The top hypotheses — these are the visual bets to win or lose.

---

### 0b. Read taste-ledger calibration (MANDATORY before concept generation)

Read `~/.claude/skills/design-engineer/memory/taste-ledger.md`. Locate the `## Calibration` section.

**If the `## Calibration` section exists and has entries:**
- Extract all `love` verdict entries — these are aesthetic patterns to favour.
- Extract all `hate` verdict entries — these are aesthetic patterns to penalise.
- Hold these in context as **taste bias**. They apply to concept scoring in Step 3: a concept that matches a `love` pattern receives +0.5 to its raw score on the most relevant criterion; a concept that echoes a `hate` pattern receives −0.5 on the most relevant criterion.
- In `direction.md`, under `## Winning Direction`, include a `### Taste Bias Applied` subsection that lists each active calibration entry and which concept(s) were affected, so the bias can be challenged.

**If the `## Calibration` section is absent or has no entries:**
- State "Taste ledger has no calibration entries — proceeding without bias" at the top of the direction output. No score adjustments are made.

Do not skip this step. Do not proceed to reference fetching until the ledger has been read (or its absence noted).

---

### 1. Fetch live references (MANDATORY before direction)

Run the following reference passes in parallel. Do not skip. If a tool is unavailable, log the failure and proceed with the degradation rule.

**Primary reference pass — invoke `firecrawl-deep-research`:**

Query: `"[product category] site design [year] award-winning"` and `"[product category] landing page design inspiration"`. Capture: URL, screenshot or scraped design tokens (colors, type, layout signals), what makes it notable.

**Secondary reference pass — invoke `firecrawl-search`:**

Query: 3–5 specific Awwwards, Siteinspire, Mobbin, or Dribbble searches relevant to the audience persona and product category. Capture the same fields.

For each fetched reference, record:
```
URL: [live URL]
What to steal: [specific, concrete — "the editorial type contrast on the hero", "the scroll pacing on the features section", "the muted background that makes the CTA pop"]
What to avoid: [anything that conflicts with the doctrine or the growth goal]
```

Reference count depends on the active mode (see Hard Rule 1): 5–8 in full mode; 1–3 fetched plus named fallbacks in budget mode; named fallbacks only in offline mode. Quality over quantity in all modes — each reference must have a concrete annotation.

---

### 2. Generate three genuinely distinct concepts

After references are in hand, generate exactly three concepts. They must be GENUINELY distinct — different emotional register, different typographic approach, different visual weight. "Light version of dark" is not a second concept. Use these archetypes as starting scaffolds (substitute if better alternatives serve the brief):

| Archetype | Character | When it wins |
|---|---|---|
| **Editorial-bold** | High type contrast, dominant headline, restrained color, editorial rhythm | Credibility-first audiences; professional services; low color tolerance |
| **Cinematic-dark** | Dark backgrounds, high-contrast light pulls, hero-moment dramatics, depth | Premium / aspirational products; technical audiences who associate dark with power |
| **Clean-trust** | Generous white space, soft palette, clear hierarchy, minimal motion | Healthcare, finance, education; audiences with high anxiety / decision friction |

You are not limited to these archetypes — derive from the references and the audience. The point is that each concept must have a distinct REASON TO EXIST that is grounded in the evidence, not just a palette swap.

For each concept, write:

```
### Concept [N]: [Name]

**Character:** [one sentence — the emotional register this concept owns]
**References:** [cite ≥1 fetched reference by URL and what you are stealing]
**Typography:** [headline typeface and weight, body typeface, size relationship]
**Color palette:** [3–5 tokens with hex and role]
**Signature moment:** [the ONE high-craft element — what it is, where it lives, what it does]
**Layout intent:** [how the above-fold reads; reading pattern (F/Z); CTA placement]
**Conversion bet:** [why this direction serves the primary growth goal from growth.md]

**Disqualifying flags:** [any generic AI patterns present — must flag or state "none"]
```

---

### 3. Score and tournament

Score each concept on a 1–5 scale across five criteria. Show every score and its rationale — no blank cells.

| Criterion | Weight | What it measures |
|---|---|---|
| **Growth alignment** | 30% | Does this direction serve the ONE CTA and primary conversion goal from growth.md? |
| **Doctrine: editorial type** | 20% | Does the type scale create genuine visual pull? Is it functional hierarchy, not safety? |
| **Doctrine: references** | 15% | Is every stylistic claim backed by a fetched reference? No vibes without evidence. |
| **Doctrine: no AI look** | 15% | Are the generic AI patterns absent or explicitly replaced with something distinctive? |
| **Doctrine: signature moment** | 20% | Is the signature moment chosen deliberately, developed with full craft, and conversion-serving? |

Compute weighted score for each concept. Show the arithmetic. If taste bias from Step 0b applies, show the adjustment inline (e.g. "+0.5 taste-love match on editorial type") so it is transparent and reversible.

**Kill two.** The two lower-scoring concepts are eliminated. Name the exact reasons they lost.

**Develop the winner.** Take the winning concept and explicitly graft the best non-competing ideas from the runners-up. State what was grafted and why it improves the winner without diluting it.

---

### 4. Build the live reference board

From the references fetched in Step 1, assemble a curated board. Include only references that influenced the winning direction (plus any that improve it via runner-up grafts).

Format for each reference:
```
#### Reference: [short name or domain]

- **URL:** [full live URL]
- **What to steal:** [specific, actionable — name the element: "the kerned editorial headline at 7vw", "the single-column constraint that forces scanability", "the muted olive background at #3D3B2E that lets white text breathe"]
- **What to adapt:** [any aspect that needs translation — e.g. "their dark bg is too heavy for our trust requirements; take the type contrast, not the bg color"]
- **Session-fetched:** [yes / no / degraded-unverified]
```

Minimum 3 references on the board. If fewer than 3 were successfully fetched, flag as REFERENCE BOARD INCOMPLETE and list what additional research is needed.

---

### 5. Emit the token + component spine

This is the design system spine that `de-motion`, `de-handoff`, and every page-build phase inherit. Do not skip any section.

#### 5a. Color tokens

```
--color-bg-primary:       [hex]   /* page background */
--color-bg-secondary:     [hex]   /* section / card backgrounds */
--color-surface:          [hex]   /* elevated surface (modal, drawer) */
--color-border:           [hex]   /* default divider */
--color-text-primary:     [hex]   /* body + primary headings */
--color-text-secondary:   [hex]   /* supporting copy, labels */
--color-text-muted:       [hex]   /* captions, metadata */
--color-accent:           [hex]   /* primary CTA + links */
--color-accent-hover:     [hex]   /* CTA hover state */
--color-accent-subtle:    [hex]   /* accent at low opacity for backgrounds */
```

For each token: include hex value, role, and WCAG contrast ratio against its most common pairing.

#### 5b. Type scale

Driven by `theme-factory` and `tailwindcss`. State the scale in a way that can be directly translated to Tailwind config or CSS custom properties.

```
Type system: [font family decisions — heading / body / mono]

Scale:
--text-display:   [size / line-height / weight / tracking] — used for: [hero headline]
--text-h1:        [size / line-height / weight / tracking] — used for: [page title]
--text-h2:        [size / line-height / weight / tracking] — used for: [section heading]
--text-h3:        [size / line-height / weight / tracking] — used for: [subsection / card title]
--text-body-lg:   [size / line-height / weight / tracking] — used for: [lead paragraph]
--text-body:      [size / line-height / weight / tracking] — used for: [default body]
--text-body-sm:   [size / line-height / weight / tracking] — used for: [captions, labels]
--text-ui:        [size / line-height / weight / tracking] — used for: [button labels, nav]
```

State the type ratio clearly: how many stops separate the display from h1, h1 from h2, etc. A flat scale (everything between 14–18px) is a doctrine violation.

#### 5c. Spacing rhythm

```
--space-unit:   [base unit — e.g. 4px or 8px]

Section padding:    [value] — [how sections breathe from each other]
Container max-w:    [value] — [max content width; wide layout rule from doctrine]
Column gutter:      [value] — [space between grid columns]
Component gap:      [value] — [default space between stacked components]
Inline gap:         [value] — [space between inline elements, icon + label]
```

#### 5d. Core components

List the 6–10 components that must be built first because everything else depends on them. For each:

```
Component: [name]
Driven by: [shadcn / tailwindcss / custom]
Variant notes: [size variants, state variants — hover, active, disabled, focus]
Doctrine note: [any doctrine rule this component must enforce — e.g. "only one per page", "reduced-motion fallback required"]
```

Required minimum: Button (primary + secondary), Heading (all scale levels), Section (layout wrapper), Card, CTA Block (the ONE CTA component), Navigation.

---

### 6. Write direction.md

Produce `direction.md` in the working directory with exactly these section headers:

```markdown
# direction.md

## Winning Direction

## Reference Board

## Token + Component Spine
```

**Winning Direction** contains: the full winning concept write-up, the tournament scoring table, the grafted runner-up elements, and the named disqualifying flags from the runners-up.

**Reference Board** contains: the annotated references from Step 4.

**Token + Component Spine** contains: the color tokens (5a), type scale (5b), spacing rhythm (5c), and core components (5d).

---

## Skills invoked and their role

| Phase | Skill | Purpose |
|---|---|---|
| References | `firecrawl-deep-research` | Pull live design references before any direction is proposed |
| References | `firecrawl-search` | Supplement with Awwwards / Siteinspire / Dribbble searches |
| Direction | `high-end-visual-design` | Evaluate whether each concept clears the craft bar |
| Direction | `gpt-taste` | Second-opinion taste check on the winning direction |
| Direction | `brandkit` | Ensure the winning direction is compatible with existing brand assets from recon.md |
| Direction | `landing-page` | Verify the winning direction serves the landing page conversion pattern |
| Direction | `impeccable` | Primary critic — flag generic AI patterns, audit visual hierarchy |
| Spine | `theme-factory` | Generate the token set and type scale in the winning direction |
| Spine | `shadcn` | Map core components to shadcn primitives where appropriate |
| Spine | `tailwindcss` | Translate the spine into Tailwind config extensions |

---

## Outputs

- `direction.md` in the current working directory, with all three sections populated.
- A brief inline summary after writing: winning direction name, top grafted runner-up element, signature moment, and the primary color token set.

---

## What this skill does NOT do

- Write production code (that is `de-handoff`).
- Define motion or timing (that is `de-motion`).
- Write final page copy (that is `copywriting` at handoff).
- Override the ONE CTA established in `growth.md`.

---

## Doctrine enforced

Taste half of `reference/doctrine.md`:

- **Editorial type with a real scale** — the type scale must show genuine contrast; flat scales are flagged.
- **Exactly ONE signature moment per page** — the winning direction nominates it; `de-motion` develops it.
- **References before vibes** — Step 1 is non-optional; no direction proceeds without at least one fetched reference.
- **Perf and a11y are floors** — every high-craft element in the spine must state its LCP impact and reduced-motion fallback.
- **Reject the generic AI look** — `impeccable` audits every concept; disqualifying patterns are named and replaced.

Growth half of `reference/doctrine.md`:

- **WOW serves the conversion goal** — every signature moment in a concept must carry a conversion bet.
- **ONE primary CTA** — the spine's CTA Block component enforces single-primary-action; it cannot be instanced more than once per page at primary visual weight.
- **F/Z reading patterns** — layout intent in each concept must state the reading pattern and CTA placement on that scan path.

Tension-resolution: perf/a11y floors first → conversion goal wins ties → the single signature moment is redesigned to serve both, never deleted.

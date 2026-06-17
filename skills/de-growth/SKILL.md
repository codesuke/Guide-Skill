---
name: de-growth
description: Converts a recon.md into a structured growth.md — primary conversion goal, funnel map, the ONE primary CTA, retention hooks, social-proof placement, SEO structure, and accountable-WOW hypotheses. Use when asked about "conversion strategy", "improve conversion", "retention plan", "growth strategy", "what should this page optimize for", "CTA strategy", "reduce churn", or "growth before direction". Runs after de-recon and before de-direction so conversion goals shape visuals. Does not write production code.
---

# de-growth — Conversion + Retention Strategy into growth.md

## What this skill does

Reads `recon.md` (produced by `de-recon`) and turns the raw site intelligence into a clear conversion brief: one primary CTA that all later phases must serve, a mapped funnel with friction fixes, retention and trust-signal placement decisions, an SEO hierarchy, and a set of accountable hypotheses that each carry a measurable conversion bet.

`growth.md` is the authority document for conversion intent. `de-direction` and `de-motion` must not override the ONE CTA or the funnel sequence without explicit sign-off.

**Hard rule: every statement in growth.md must be grounded in evidence — from recon.md, from competitor research, or from customer data. Invent nothing. If evidence is thin, flag it as an assumption and assign it a hypothesis. If any evidence skill (customer-research, competitor-profiling, firecrawl-market-research, seo-audit) returns no usable data or is unavailable, do not invent findings — flag that point as an explicit assumption and turn it into a hypothesis to validate later.**

**Embedded analysis mode:** When the source is a written brief and evidence skills cannot be dispatched (no live site, no scrape possible), run every evidence pass INLINE using the brief content as the sole data source — apply the same criteria from CRO, copywriting, marketing-psychology, etc. against what the brief describes. Mark each such finding as `[inferred from brief]`. Do not skip the evidence pass; do not invent facts absent from the brief — flag genuine gaps as `[unknown — not in brief]` and assign each gap a hypothesis to validate post-launch.

---

## Inputs

- `recon.md` — read the following sections: **Purpose**, **Audience**, **Funnel**, **What to keep**.
- Any additional brief copy, analytics data, or customer research the session provides.

---

## Procedure

### 0. Read recon.md

Open `recon.md` from the working directory. If it is missing, stop and ask for it — do not proceed blind.

Extract and hold in context:
- The stated purpose and the primary CTA already present on the site.
- The audience persona(s).
- The current funnel map and every friction point listed.
- The "What to keep" items that carry conversion equity (testimonials, certifications, pricing clarity, etc.).

---

### 1. Run evidence passes

Run the following in parallel before writing any conclusions:

**Strategy evidence (invoke these skills):**
- `cro` — audit the existing funnel for conversion rate optimisation opportunities. Focus on: above-fold clarity, CTA placement and wording, form friction, trust gap moments.
- `copywriting` — evaluate the current value proposition. Is it specific? Does a cold reader pass the one-sentence test? Flag vague taglines for rewrite.
- `marketing-psychology` — identify the dominant psychological levers available (scarcity, social proof, authority, reciprocity, commitment, loss aversion). Map each to a funnel stage.
- `offers` — assess the primary offer: is it clear, specific, risk-reversed, and differentiated? Flag any "me too" language.
- `churn-prevention` — look at the post-conversion journey (onboarding emails, in-product steps, re-engagement triggers). Identify the earliest churn moment and the highest-leverage retention hook.
- `onboarding` — map the first-session experience after the primary CTA is taken. Identify the "aha moment" and the steps that must lead there without drop-off.

**Research evidence (invoke these skills):**
- `customer-research` — pull any available voice-of-customer data (reviews, testimonials, forum threads, survey quotes). Extract the language real users use to describe the problem and the outcome.
- `competitor-profiling` — identify 2–3 direct competitors. Note their primary CTAs, their above-fold value props, and their social-proof placement. Find the gap.
- `firecrawl-market-research` — scrape the top-ranking pages for the primary keyword cluster. Note what content patterns dominate search results.
- `seo-audit` — run a keyword gap analysis. Identify the primary intent cluster, the head term, 2–3 supporting long-tails, and any existing pages that already rank and should be protected.

Synthesise findings into bullet notes before writing growth.md. Do not write growth.md until all evidence passes are complete or explicitly waived.

---

### 2. Establish the ONE primary CTA

Before writing any section: lock the single primary call-to-action.

Rules (from doctrine):
- Every page has exactly ONE primary CTA. Secondary actions exist but must be visually subordinate.
- Multiple equal-weight CTAs are a conversion killer — merge, demote, or remove.
- The CTA must survive the "cold reader test": a visitor who knows nothing about the product should understand what happens when they click it.

Format:
```
Primary CTA: [button label] → [destination / action]
Value prop contract: [one sentence — what the user gets when they click]
```

This CTA is frozen for `de-direction` and `de-motion`. Neither phase may replace it with a different primary CTA without reopening `de-growth`.

---

### 3. Write growth.md

Produce `growth.md` in the working directory with **exactly these section headers** (no additions, no omissions, no reordering):

```markdown
# growth.md

## Primary conversion goal

## Funnel

## The ONE CTA

## Retention hooks

## Social-proof placement

## SEO structure

## Hypotheses
```

Section guidance follows.

---

#### Primary conversion goal

One sentence. What is the single most important action the redesigned page must drive?

Format:
```
Goal: [action] by [audience] on [page/entry point]
Current baseline: [conversion rate or "unknown — instrument first"]
Target: [realistic uplift based on CRO benchmarks or competitor gap]
```

---

#### Funnel

Map the intended visitor journey in the redesigned site. Number each stage. For each stage that carries a friction point from `recon.md`, include a **Fix:** line.

```
1. Entry — [traffic source: SEO / paid / referral / direct]
2. Awareness — [above-fold: what the visitor must grasp in < 5 s]
3. Consideration — [what builds the case: social proof, feature evidence, case studies]
4. Decision — [primary CTA placement, secondary actions, risk-reversal copy]
5. Action — [what happens immediately after the CTA: landing, form, booking, checkout]
6. Retention — [first post-conversion touchpoint]

Friction audit:
- [Friction item from recon or evidence pass] → Fix: [specific proposed change]
(repeat for each item)
```

The friction audit must not be empty. If recon found no friction, that is itself a suspect finding — note it and flag a hypothesis.

---

#### The ONE CTA

Expand the locked CTA from Step 2.

```
Label: [exact button text]
Destination: [URL or action]
Value prop contract: [one sentence]
Placement rule: [above fold / repeated at decision stage / sticky on mobile]
Visual weight: [primary / all secondary CTAs must be one visual level below]
Copy rule: [action-oriented, specific, avoids generic "Learn more" or "Click here"]
```

---

#### Retention hooks

List the top 3–5 retention mechanisms in priority order. Each hook must state:
- The churn moment it intercepts (from `churn-prevention` output).
- The mechanism (email sequence, in-product prompt, social community, milestone reward, etc.).
- The "aha moment" it leads toward (from `onboarding` output).

Format:
```
1. [Hook name]
   - Intercepts: [churn moment]
   - Mechanism: [specific action]
   - Leads to: [aha moment or outcome]
```

---

#### Social-proof placement

Do not place social proof decoratively. Place it at the funnel's highest-doubt moments.

For each trust signal available from `recon.md` "What to keep" and `customer-research`:

```
- [Signal type: testimonial / logo / certification / review count / case study]
  - Content: [quote, logo name, or statistic]
  - Placement: [funnel stage and page position]
  - Rationale: [which doubt it resolves — e.g. "Do these people understand my industry?"]
```

If the existing site has trust signals in the wrong position (noted in the design audit), call it out and redirect.

---

#### SEO structure

From `seo-audit` and `firecrawl-market-research` output:

```
Head term: [primary keyword]
Intent: [informational / navigational / commercial / transactional]
Supporting long-tails:
  - [keyword 1] — [page / section to target]
  - [keyword 2] — [page / section to target]
  - [keyword 3] — [page / section to target]
Title tag formula: [e.g. "[Service] for [Audience] — [Brand]"]
Meta description formula: [one sentence, includes head term, includes a benefit, < 155 chars]
H1 rule: [must match or closely mirror head term; must appear above fold]
Internal link priority: [which existing pages feed the primary landing page]
Content gap: [topic cluster or question type that top-ranking competitors cover and this site does not]
```

---

#### Hypotheses

Each major conversion bet gets one Accountable WOW block. Minimum two hypotheses; maximum five per growth.md (prioritise; do not list everything).

For each hypothesis, fill in every field — no field may be left blank. If data is unavailable, state the data needed and assign instrumentation as the first experiment step.

Template (mirror `reference/accountable-wow.md`):

```
### Hypothesis: [short name]

- Decision: [what change is being made — specific, not vague]
- Conversion bet: [why this change should help convert or retain — grounded in evidence]
- Metric it moves: [e.g. hero CTA click-through rate, sign-up completion rate, 30-day retention]
- Experiment (ab-testing): [variant A description vs variant B description; success threshold e.g. 95% confidence, +10% lift]
- Instrumentation (analytics): [specific events to fire — e.g. `cta_click`, `form_start`, `form_complete`, `page_scroll_50`]
- Perf gate: [e.g. LCP < 2.5 s, no CLS from layout shift; if a visual change, state its perf constraint]
- A11y gate: [e.g. contrast ratio ≥ 4.5:1, reduced-motion fallback if motion is involved]
```

Use `ab-testing` to design the experiment structure (variant split, success threshold, min sample size).
Use `analytics` to specify the instrumentation plan (event schema, funnel steps, cohort definition).

---

## Outputs

- `growth.md` in the current working directory, with all seven sections populated.
- A brief inline summary after writing: the ONE CTA locked, the top 3 friction fixes, and the two highest-priority hypotheses.

---

## What this skill does NOT do

- Write production code.
- Define visual direction, typography, colour, or layout (that is `de-direction`).
- Define motion or animation (that is `de-motion`).
- Finalise copy (that is `de-direction` + `copywriting` at handoff).

---

## Doctrine enforced

Growth half of `reference/doctrine.md`:
- Clear value prop above the fold — recon must confirm this or the copy is flagged for rewrite.
- ONE primary CTA — established here and frozen for downstream phases.
- Friction audit — every friction point from recon gets a Fix: entry.
- Trust signals placed at doubt points — not decoratively.
- F/Z reading patterns — funnel layout respects scan paths; CTA must land on the scan path.
- WOW must serve the conversion goal — every hypothesis carries an explicit conversion bet.

Tension-resolution order (from doctrine):
1. Perf/a11y gates are hard floors.
2. Conversion goal wins ties over aesthetics.
3. The single signature moment is redesigned to serve both, never deleted.

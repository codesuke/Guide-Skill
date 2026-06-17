# Funnel mapping + friction audit

The full procedure for reading `recon.md`, running evidence passes, locking the ONE CTA, and
mapping the funnel with friction fixes. Run these in order before writing `growth.md`.

## 0. Read recon.md

Open `recon.md` from the working directory. If it is missing, stop and ask for it — do not proceed blind.

Extract and hold in context:
- The stated purpose and the primary CTA already present on the site.
- The audience persona(s).
- The current funnel map and every friction point listed.
- The "What to keep" items that carry conversion equity (testimonials, certifications, pricing clarity, etc.).

Read these `recon.md` sections specifically: **Purpose**, **Audience**, **Funnel**, **What to keep**.
Also use any additional brief copy, analytics data, or customer research the session provides.

## 1. Run evidence passes

Run the following in parallel before writing any conclusions.

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

Synthesise findings into bullet notes before writing `growth.md`. Do not write `growth.md` until all evidence passes are complete or explicitly waived.

## 2. Establish the ONE primary CTA

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

## 3. Funnel map + friction audit

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

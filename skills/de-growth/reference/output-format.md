# growth.md output format

Produce `growth.md` in the working directory with **exactly these section headers** (no additions,
no omissions, no reordering):

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

## Primary conversion goal

One sentence. What is the single most important action the redesigned page must drive?

```
Goal: [action] by [audience] on [page/entry point]
Current baseline: [conversion rate or "unknown — instrument first"]
Target: [realistic uplift based on CRO benchmarks or competitor gap]
```

## Funnel

Use the funnel map + friction audit from `reference/funnel-and-friction.md` (Step 3). The friction
audit must not be empty. If recon found no friction, that is itself a suspect finding — note it and
flag a hypothesis.

## The ONE CTA

Expand the locked CTA from the friction procedure (Step 2).

```
Label: [exact button text]
Destination: [URL or action]
Value prop contract: [one sentence]
Placement rule: [above fold / repeated at decision stage / sticky on mobile]
Visual weight: [primary / all secondary CTAs must be one visual level below]
Copy rule: [action-oriented, specific, avoids generic "Learn more" or "Click here"]
```

## Retention hooks

List the top 3–5 retention mechanisms in priority order. Each hook must state:
- The churn moment it intercepts (from `churn-prevention` output).
- The mechanism (email sequence, in-product prompt, social community, milestone reward, etc.).
- The "aha moment" it leads toward (from `onboarding` output).

```
1. [Hook name]
   - Intercepts: [churn moment]
   - Mechanism: [specific action]
   - Leads to: [aha moment or outcome]
```

## Social-proof placement

Do not place social proof decoratively. Place it at the funnel's highest-doubt moments.

For each trust signal available from `recon.md` "What to keep" and `customer-research`:

```
- [Signal type: testimonial / logo / certification / review count / case study]
  - Content: [quote, logo name, or statistic]
  - Placement: [funnel stage and page position]
  - Rationale: [which doubt it resolves — e.g. "Do these people understand my industry?"]
```

If the existing site has trust signals in the wrong position (noted in the design audit), call it out and redirect.

## SEO structure

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

## Hypotheses — Accountable WOW format

Each major conversion bet gets one Accountable WOW block. Minimum two hypotheses; maximum five per
`growth.md` (prioritise; do not list everything).

For each hypothesis, fill in every field — no field may be left blank. If data is unavailable, state
the data needed and assign instrumentation as the first experiment step.

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

## Output summary

After writing, emit a brief inline summary: the ONE CTA locked, the top 3 friction fixes, and the
two highest-priority hypotheses.

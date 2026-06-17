# Signature-Moment Concept Lab

This is the core of `de-motion`. Run a structured scoring process to select exactly ONE Signature moment.

## Step 0 — Read inputs (hold in context)

From `direction.md`:
- The ONE Signature moment nominated in the winning direction (starting candidate for the lab).
- Scroll-linked elements mentioned in the system Spine.
- Any perf/a11y notes flagged in the direction.

From `growth.md`:
- The ONE CTA (label, placement, funnel stage).
- The primary conversion goal.
- Funnel doubt points — these are where trust-building motion earns its place.
- Accountable WOW hypotheses — these anchor conversion bets for any motion proposed here.

## Step 1 — Fetch live motion references (MANDATORY before finalising shortlist)

Invoke `firecrawl-search` or `firecrawl-deep-research` to pull Awwwards or comparable references. Do not skip. If unavailable, state "OFFLINE — reference fetch failed" explicitly, degrade to named references from memory, and mark items as `[reference unverified]`.

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

## Step 3a — Generate the shortlist

Generate 4–6 candidate Signature moments. Each must be distinct — different technique, different section, different emotional register. Do not default to "hero parallax" without considering alternatives.

For each candidate:

```
Candidate: [name — e.g. "Pinned hero scrub with depth layers", "Staggered word reveal on the value prop", "Masked-reveal feature cards on scroll"]
Technique: [specific — what moves, how, easing direction]
Section: [where it lives on the page]
Reference: [cite a fetched reference or named reference from memory]
Conversion bet: [explicit bet — how this motion serves the ONE CTA or conversion goal from growth.md]
Reduced-motion version: [what the fallback looks like — must be defined before scoring]
Feasibility notes: [any perf risk, CLS risk, or implementation complexity flag]
```

## Step 3b — Score the shortlist

Score each candidate on impact × feasibility. Show every score and its rationale.

| Candidate | Impact (1–5) | Feasibility (1–5) | Impact × Feasibility | Conversion bet strength (1–5) | Perf/a11y risk (5=none, 1=high) | Weighted total |
|---|---|---|---|---|---|---|

Weighted total formula: `(Impact × Feasibility) × 0.4 + Conversion_bet × 0.35 + Perf_a11y × 0.25`

Show the arithmetic for each row.

**Impact** — how much emotional or narrative punch does this moment deliver? Does it make the page memorable?
**Feasibility** — implementation complexity, perf risk, timeline fit.
**Conversion bet strength** — how directly does this serve the ONE CTA and primary conversion goal?
**Perf/a11y risk** — does this moment survive reduced-motion? Does it avoid LCP delay and CLS?

## Step 3c — Select the winner

The highest-scoring candidate wins. State:
- Why it won (top 2 criteria).
- What the runner-up offered that the winner does not (and whether any element can be grafted without competing with the moment).
- The exact reduced-motion fallback — this is mandatory, not optional.

If the winning candidate has a perf or a11y flag, redesign it here to resolve the flag before declaring it the winner. State what changed and why the redesigned version still earns its score.

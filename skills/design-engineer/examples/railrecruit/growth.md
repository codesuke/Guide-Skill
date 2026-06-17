# growth.md

> Reads `recon.md` (Purpose, Audience, Funnel, What to keep).
> Hard rule honored: every statement is grounded in recon or flagged as an assumption + turned into a
> hypothesis. The evidence skills (cro, copywriting, marketing-psychology, offers, churn-prevention,
> onboarding, customer-research, competitor-profiling, firecrawl-market-research, seo-audit) were applied
> as **embedded analysis in this smoke test** rather than as separately dispatched runs; no findings are
> invented, and thin points are flagged.

## Primary conversion goal

```
Goal: Course enrollment (paid sign-up) by career-driven learners on the course-detail / enrollment page
Current baseline: unknown — instrument first (recon: "low enrollment conversion", no number supplied)
Target: +30–50% relative lift on enroll-CTA → enrollment-complete, driven primarily by (a) clear pricing
        and (b) a single dominant CTA. Realistic given two known decision-stage blockers are removed;
        exact target re-baselined after instrumentation.
```

## Funnel

1. **Entry** — SEO (intent: "railway signalling course", "railway job after diploma/B.Tech") + paid/referral. `[assumption — see SEO structure + H-SEO]`
2. **Awareness** — above-fold must land in < 5 s: *what* (CPD-certified railway-signalling training) + *for whom* (graduates seeking railway jobs / professionals upskilling) + *the outcome* (job-ready credential).
3. **Consideration** — proof stack: placement/outcome testimonials, CPD certification, 9-year track record, syllabus depth.
4. **Decision** — ONE primary CTA + **explicit pricing** + risk-reversal (e.g. money-back / free first module). Secondary action = "Download syllabus".
5. **Action** — short enrollment form / checkout; minimal fields; mobile sticky CTA.
6. **Retention** — onboarding to the first lesson + "aha" (first completed module) within 48 h.

Friction audit:
- **Cluttered layout / high cognitive load** → Fix: single-column scannable course pages; one decision per screen; strip theme chrome.
- **Slow load** → Fix: Next.js rebuild, image optimization, defer non-critical JS; LCP < 2.5 s as a hard floor (carried into de-motion).
- **Weak / scattered CTAs (no single primary)** → Fix: one primary CTA repeated at fixed decision points + mobile sticky bar; all other actions demoted.
- **Testimonials buried** → Fix: relocate placement proof to the two highest-doubt moments (post-value-prop and pre-CTA).
- **No clear pricing** → Fix: explicit pricing block with what's included + certification + risk-reversal; this is the single biggest decision unblock.
- **Trust not delivered at doubt points** → Fix: route CPD badge + 9-year track record to the hero and the pricing block.

## The ONE CTA

```
Label: Enroll Now
Destination: /enroll/[course] (course-specific enrollment / checkout)
Value prop contract: Start a CPD-certified railway-signalling course that makes you job-ready, with
                     transparent pricing and a money-back guarantee on the first module.
Placement rule: above the fold on course pages + repeated at the pricing/decision block + sticky on mobile
Visual weight: primary — the only accent-colored button on the page; every other action (Download syllabus,
               Talk to a counsellor) is one visual level below (outline / text link)
Copy rule: action + outcome, specific. "Enroll Now" over generic "Learn more"/"Submit"/"Click here".
           Secondary action uses "Download syllabus", never a competing primary verb.
```

> Frozen for de-direction and de-motion. Neither phase may swap the primary CTA without reopening de-growth.

## Retention hooks

```
1. First-module fast-start
   - Intercepts: post-purchase drop-off (the earliest churn moment — paid but never started)
   - Mechanism: immediate access + a "complete Module 1 in 48h" nudge email + in-product checklist
   - Leads to: aha moment = first completed signalling module (proof the course delivers)

2. Placement / outcome milestone track
   - Intercepts: mid-course disengagement ("is this worth finishing?")
   - Mechanism: progress milestones tied to job-readiness + CPD credit accrual shown in-product
   - Leads to: aha = visible progress toward the credential that gets them hired

3. Counsellor / community check-in
   - Intercepts: isolation churn (self-paced learners stalling)
   - Mechanism: cohort community + scheduled counsellor check-in at the stall point
   - Leads to: aha = a person who confirms they're on track for a railway role
```
> `churn-prevention` / `onboarding` evidence applied as embedded analysis; the exact earliest-churn timing is
> an assumption until instrumented (see H-RETAIN).

## Social-proof placement

```
- Certification — CPD-certified
  - Content: CPD certification badge + "9 years training railway-signalling professionals"
  - Placement: hero trust strip (under value prop) AND adjacent to the pricing block
  - Rationale: resolves "is this credential legitimate / will employers recognise it?"

- Testimonial — placement outcome
  - Content: a learner placement quote (verbatim from recon "What to keep" — currently buried)
  - Placement: directly after the value prop (doubt moment 1) and immediately before the enroll CTA (doubt moment 2)
  - Rationale: resolves "do people like me actually get railway jobs after this?"

- Track record — institute longevity
  - Content: "9 years, [N] learners trained" (N to confirm — flagged)
  - Placement: pricing/decision block
  - Rationale: resolves "is this institute real and durable, not a fly-by-night course mill?"
```
> Recon noted testimonials are currently buried (wrong position) — explicitly redirected here to the two
> highest-doubt moments rather than a decorative carousel.

## SEO structure

```
Head term: railway signalling training course
Intent: commercial / transactional (enrollment intent)
Supporting long-tails:
  - railway signalling course after diploma — course-detail page targeting fresh graduates
  - CPD certified railway signalling training — certification/course page
  - railway jobs after B.Tech signalling — landing/blog → funnels to course pages
Title tag formula: "Railway Signalling Training (CPD-Certified) — Get Job-Ready | RailRecruit"
Meta description formula: "CPD-certified railway-signalling courses for graduates and professionals.
                          Clear pricing, placement support, money-back first module." (< 155 chars)
H1 rule: mirrors head term, above the fold, paired with the outcome ("job-ready")
Internal link priority: certification page + testimonials → feed course-detail (the primary landing page)
Content gap: outcome/placement content ("railway jobs you can get after this course", salary, eligibility)
            — high-intent and likely under-served vs generic competitor catalog pages [assumption — see H-SEO]
```

## Hypotheses

### Hypothesis: Clear pricing block

- Decision: Add an explicit, itemized pricing block (price, what's included, CPD certification, money-back first module) on every course page, replacing the current "no clear pricing".
- Conversion bet: Hidden pricing is recon's biggest decision-stage blocker; transparent pricing + risk-reversal removes the dominant reason a ready buyer stalls.
- Metric it moves: course-page → enrollment-complete rate.
- Experiment (ab-testing): A = no/hidden pricing (current) vs B = explicit pricing + risk-reversal block. Success: +10% relative lift at 95% confidence.
- Instrumentation (analytics): `pricing_view`, `enroll_click`, `checkout_start`, `enroll_complete`.
- Perf gate: pricing block is static HTML, LCP < 2.5 s, no CLS.
- A11y gate: pricing table semantic + contrast ≥ 4.5:1; no motion dependency.

### Hypothesis: One dominant CTA

- Decision: Collapse all scattered CTAs into a single primary "Enroll Now" (accent-only) repeated at fixed decision points + mobile sticky; demote every other action.
- Conversion bet: Multiple equal-weight CTAs cause decision paralysis (recon: "weak CTAs"); a single dominant CTA on the scan path lifts click-through.
- Metric it moves: hero/decision-block enroll-CTA click-through rate.
- Experiment (ab-testing): A = multiple equal CTAs vs B = single primary + sticky mobile. Success: +15% CTA CTR at 95% confidence.
- Instrumentation (analytics): `enroll_click` (with placement attribute: hero / pricing / sticky), `scroll_50`.
- Perf gate: sticky bar uses transform/opacity only; no CLS; INP < 200 ms.
- A11y gate: sticky CTA keyboard-reachable, focus-visible, contrast ≥ 4.5:1.

### Hypothesis: Proof at doubt points

- Decision: Move buried placement testimonials + CPD badge to two doubt moments (post-value-prop, pre-CTA) instead of a decorative section.
- Conversion bet: Trust delivered exactly where doubt peaks reduces abandonment for an anxiety-driven audience.
- Metric it moves: scroll-depth-to-CTA and enroll-CTA click-through.
- Experiment (ab-testing): A = testimonials buried (current) vs B = proof at doubt points. Success: +8% scroll-to-CTA and +5% CTA CTR.
- Instrumentation (analytics): `testimonial_view`, `scroll_to_cta`, `enroll_click`.
- Perf gate: testimonial media lazy-loaded below fold; no CLS from late image load (reserved aspect ratio).
- A11y gate: testimonial carousel (if any) has reduced-motion fallback (static stack) + accessible controls.

### Hypothesis: First-module fast-start retention

- Decision: Trigger an immediate first-module onboarding (email + in-product checklist) on enrollment.
- Conversion bet: The earliest churn is "paid but never started"; a 48-h fast-start drives the aha (first completed module) and downstream completion/referral.
- Metric it moves: 7-day activation rate (% who complete Module 1) and 30-day retention.
- Experiment (ab-testing): A = no onboarding nudge vs B = 48-h fast-start sequence. Success: +20% Module-1 completion.
- Instrumentation (analytics): `enroll_complete`, `module1_start`, `module1_complete`, `d30_active`.
- Perf gate: onboarding UI client-side, no impact on landing LCP.
- A11y gate: onboarding emails/UI accessible; no motion-only cues.

---

### Inline summary (for orchestrator)

- **ONE CTA locked:** "Enroll Now" → `/enroll/[course]`, accent-only, repeated at decision points + mobile sticky.
- **Top 3 friction fixes:** (1) explicit pricing block, (2) single dominant CTA, (3) proof relocated to doubt points.
- **Two highest-priority hypotheses:** H-Pricing (clear pricing block) and H-CTA (one dominant CTA).

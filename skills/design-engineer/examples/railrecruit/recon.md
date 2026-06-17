# recon.md

> Source type: **Written brief** (controller decision — no live URL provided).
> Per de-recon Step 0, every section whose evidence would normally come from scraping is marked
> `[inferred from brief — not scraped]`. Nothing here is invented beyond what the brief supports.

**Source brief (verbatim):**
> "RailRecruit — a 9-year-old WordPress/Elementor site for an Indian railway-signalling training
> institute. Sells CPD-certified courses to (a) fresh diploma/B.Tech graduates wanting railway jobs
> and (b) working professionals upskilling. Current site: cluttered, slow, generic theme, weak CTAs,
> testimonials buried, no clear pricing, low enrollment conversion. Goal: a modern Next.js rebuild
> that dramatically lifts course-enrollment conversion and trust."

## Purpose

RailRecruit sells CPD-certified railway-signalling training courses and wants visitors to **enrol in a
course**. The site's job is to convert career-motivated learners into paid enrollments.

- **Stated headline / tagline:** none supplied in the brief. `[inferred from brief — not scraped]`
- **Primary desired action:** course enrollment (purchase / sign-up). `[inferred from brief]`
- **Implicit secondary action:** lead capture (download syllabus / book a counselling call) — typical for
  high-consideration education purchases. `[inferred from brief — flagged as assumption for de-growth]`

## Audience

Two distinct personas, both India-based, both career-outcome driven:

- **Primary — Fresh graduates (diploma / B.Tech):** want railway jobs. High anxiety, low budget,
  outcome-obsessed ("will this get me hired?"). Trust and proof of placement matter more than aesthetics.
- **Secondary — Working professionals upskilling:** already employed, time-poor, want a credential
  (CPD certification) and signalling-domain depth. Less price-sensitive, more credential-sensitive.

Both personas care about: certification legitimacy, instructor credibility, placement/outcome proof, and
clear pricing. `[inferred from brief — not scraped]`

## Tech stack

- CMS / builder: **WordPress + Elementor** — *confirmed* (stated explicitly in the brief; the brief is the source of record here).
- Age: ~9 years old — *confirmed (brief)*. Implies legacy plugin stack, theme bloat, likely render-blocking assets.
- Performance: "slow" — *confirmed (brief)*. Consistent with Elementor + accumulated plugins; not separately measured. `[inferred from brief — not scraped]`
- Theme: "generic theme" — *confirmed (brief)*. No distinctive brand visual system.
- Target rebuild stack: **Next.js** — *confirmed (brief, goal statement)*.
- Analytics / tag stack: unknown — *suspected* GA/GTM present (near-universal on WP) but **not verified**. `[inferred — flag for instrumentation in de-growth]`

> WordPress/Elementor detection (per de-recon §1): confirmed from brief rather than from `wp-content`/`?ver=`
> markers, since no live source was scraped. Treat as a rebuild signal, not a spine.

## Content inventory

`[inferred from brief — not scraped]` — this is the *expected* content set for an institute of this type,
to be confirmed against the live site before build. Structured per de-recon §4 (content kept separate from
current design).

- **Homepage hero**
  - Type: hero
  - Key copy: unknown verbatim; value prop currently weak per brief.
  - Media: likely stock theme imagery.
  - Verdict: **Restructure** (copy + proof, not theme).
- **Course catalog / course pages**
  - Type: product/service list + detail
  - Key copy: course names, syllabi, CPD certification claim.
  - Media: course thumbnails.
  - Verdict: **Keep content, Restructure presentation** (this is the conversion engine).
- **Certification / CPD section**
  - Type: trust / authority
  - Key copy: "CPD-certified" claim.
  - Media: certification badge/logo.
  - Verdict: **Keep** (core trust asset — see What to keep).
- **Testimonials**
  - Type: social proof
  - Key copy: learner/placement testimonials — currently **buried** per brief.
  - Media: learner photos (assumed).
  - Verdict: **Keep content, Relocate** to doubt points.
- **Pricing / enrollment**
  - Type: pricing / CTA
  - Key copy: currently **no clear pricing** per brief.
  - Verdict: **Restructure** — create explicit pricing.
- **About / instructors**
  - Type: authority
  - Verdict: **Keep, elevate instructor credibility.**
- **Contact / enquiry**
  - Type: lead capture
  - Verdict: **Keep, reduce friction.**

Pages in sitemap not scraped: **all** (no live scrape performed; entire inventory is inferred).

## Funnel

`[inferred from brief — not scraped]`, mapped to de-recon §5 stages:

1. **Entry** — organic search for "railway signalling course / railway jobs after diploma" (assumed; SEO meta not verified) + possibly paid/referral.
2. **Awareness** — hero currently communicates the offer weakly ("weak CTAs", "generic theme").
3. **Consideration** — testimonials exist but are **buried**; certification present; case for enrollment is under-built.
4. **Decision** — CTAs are weak and likely scattered; no single dominant primary CTA. **No clear pricing** blocks the decision.
5. **Action** — enrollment / enquiry form (destination unverified).
6. **Friction points (confirmed from brief):**
   - Cluttered layout → high cognitive load.
   - Slow load → drop-off before value is seen.
   - Weak CTAs / no single primary CTA → decision paralysis.
   - Testimonials buried → trust not delivered at the doubt moment.
   - No clear pricing → decision cannot be made; major conversion blocker.

## Design audit

`impeccable` was not separately invokable in this smoke-test run; per de-recon §6 the audit was performed
**manually against the same checklist**, grounded in the brief (no live markup to inspect).

- **Visual hierarchy:** "cluttered" → no clear type-driven pull; hierarchy is flat/competing. (brief)
- **Signature moment:** none — a generic Elementor theme has no deliberate centrepiece. (inferred)
- **Generic patterns:** generic theme implies stock-template tropes (centred card stacks, default theme
  gradients/buttons). Flagged as likely; to confirm against live site. `[inferred]`
- **Conversion-design basics:** value prop above fold is weak; no single primary CTA; trust signals
  (testimonials) misplaced (buried); pricing absent. All **fail** the doctrine growth checklist. (brief)
- **Mobile / responsive:** unknown — not inspected. Legacy Elementor sites frequently ship heavy mobile
  payloads; flag for measurement. `[inferred — not scraped]`
- **Performance as design debt:** "slow" is itself an audit finding — it degrades the LCP and the first
  impression before any visual decision matters.

## What to keep

Opinionated bridge list to de-growth / de-direction. Content & equity only — no current visual styling kept.

- **CPD certification credential** — the single strongest trust/authority asset; legitimizes every course. **Keep and elevate.**
- **Learner / placement testimonials** — real outcome proof exists but is buried. **Keep the content, move it to doubt points.**
- **Course catalog & syllabi** — the actual product substance. **Keep, restructure into scannable course pages.**
- **Instructor / institute domain authority (9 years operating)** — longevity is itself a trust signal for an anxious audience. **Keep, state it explicitly.**
- **Brand equity (logo / name "RailRecruit"):** retain the name and any logo with recognition equity even though the generic theme styling is discarded — separating brand equity from theme styling is the point (de-recon §7).

---

### Top 3 findings (for orchestrator context)

1. **No clear pricing + no single primary CTA** are the two highest-leverage conversion blockers — both are decision-stage, both are fixable in the rebuild.
2. **Trust assets exist but are mis-placed** — CPD certification and testimonials are present yet buried; the rebuild's job is largely *re-sequencing* proof to doubt points, not creating it.
3. **Performance ("slow") is a first-order design problem**, not a back-end afterthought — LCP must be a hard floor in de-motion.

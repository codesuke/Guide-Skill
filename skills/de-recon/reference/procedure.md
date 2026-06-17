# de-recon — Full Procedure

The full per-source-type procedure, the design-audit checklist, and the exact `recon.md`
section format. SKILL.md carries the hard rules and the compact overview; this file carries
the detail.

## 0. Identify the source type

Determine what you have been given:

- **Live URL** → proceed to Step 1.
- **Figma link** → fetch the link with `firecrawl-scrape` to extract text/structure; note that visual inspection is limited. Skip stack fingerprinting unless a live site is also provided. Figma share links often require auth and may return empty — if the scrape yields nothing, mark the design source as unavailable and proceed from any provided URL or written brief instead of silently producing nothing.
- **Written brief** → read it carefully; fill what you can from the text; mark every section where evidence would normally come from scraping as `[inferred from brief — not scraped]`.
- **Multiple sources** → combine; live URL takes precedence over brief for factual claims.

---

## 1. Scrape the real target

**For a live URL:**

1. Run `firecrawl-website-design-clone` on the URL. This extracts the existing design system: colours, fonts, spacing, component patterns. Capture the output.
2. Run `firecrawl-map` on the URL. This maps every reachable page or route. Note the sitemap structure.
3. Run `firecrawl-scrape` on the homepage and 2–4 representative inner pages (e.g. a product/service page, a pricing or enrolment page, an about page). Capture the full text content.

**WordPress / Elementor detection (nicety, not the spine):**

While scraping, look for any of: `wp-content`, `elementor`, `wp-json`, `?ver=` query strings on scripts, or `/wp-admin` references in page source. If found, note "WordPress detected" and flag the tech stack accordingly. This does not change the rest of the procedure — it is simply a useful signal for the rebuild plan.

---

## 2. Infer purpose and target audience

From the scraped content:

- **Purpose:** What does this site/product offer? What action does it want visitors to take? Summarise in one sentence. If a tagline or hero headline exists, quote it verbatim.
- **Audience:** Who is being addressed? Look for language level, imagery descriptions, testimonials, pricing tier names, or explicit "who this is for" copy. Identify primary persona (job title / life stage / need) and secondary if one is visible.

---

## 3. Fingerprint the tech stack

Inspect page source, HTTP headers (via scrape metadata), and asset URLs for signals:

- JavaScript framework: look for `__NEXT_DATA__` (Next.js), `__nuxt` (Nuxt), `<div id="root">` without SSR markers (SPA), `data-astro-*` (Astro).
- CMS / builder: `wp-content` (WordPress), `elementor`, `webflow.io` or Webflow class names, `squarespace.com` assets, `shopify` in asset URLs, `ghost.io`.
- CSS framework: Tailwind utility class names (`text-sm`, `flex`, `gap-`), Bootstrap grid (`col-md-`), custom CSS, or none visible.
- Analytics / scripts: look for GA, GTM, Hotjar, Segment, Intercom embed scripts.
- Hosting signals: check page headers or `<meta name="generator">` tags.

Summarise as a short bulleted list. Mark each item as **confirmed** or **suspected**.

---

## 4. Build the content inventory

**Keep content inventory strictly separate from the current design.**
The goal is to know what *content* exists so it can be reused, restructured, or discarded in the new site — independent of how it looks today.

Inventory format per page or section:

```
- [Page/Section name]
  - Type: hero / feature-list / testimonial / pricing / FAQ / CTA / etc.
  - Key copy: [verbatim headline or one-sentence summary]
  - Media: [images, video, icons — note count and role]
  - Keep / Restructure / Discard: [provisional verdict]
```

Cover: homepage, primary service/product pages, about, pricing or enrolment, contact or sign-up. Note any pages that appear in the sitemap but were not scraped.

---

## 5. Sketch the current conversion funnel

Map the intended visitor journey from the scraped content:

1. **Entry** — how does a visitor arrive? (SEO keywords visible in meta, ads, referral)
2. **Awareness** — what does the hero/above-the-fold communicate?
3. **Consideration** — what content builds the case? (features, testimonials, case studies)
4. **Decision** — what is the primary CTA? Where does it appear? How many times?
5. **Action** — where does the CTA lead? (form, checkout, booking, sign-up)
6. **Friction points** — note any visible friction: buried CTAs, long forms, jargon, missing trust signals.

Present as a numbered list matching the stages above.

---

## 6. Run a design audit

Invoke `impeccable` on the scraped homepage content (and one inner page if available). Ask it to audit:

- Visual hierarchy: does the type scale create clear pull?
- Signature moment: is there one standout interaction or visual moment, or none?
- Generic AI patterns: centred card stack, purple-to-blue gradient, emoji bullets, glowing CTA, stock mascots — flag any present.
- Conversion-design basics: value prop above fold, single primary CTA, trust signal placement, reading pattern alignment.
- Mobile / responsive: any responsive issues visible in the scraped markup?

Summarise `impeccable`'s output into 5–10 bullet findings. Quote the most important verbatim. If `impeccable` is unavailable in the environment, perform the audit manually against the same checklist rather than skipping it.

**No rendered surface (brief-only source):** If `impeccable` IS available but there is no live URL or rendered page to inspect, do not attempt to invoke it against a non-existent surface. Instead, audit the brief's described content — copy, stated layout intentions, named sections — against the same checklist above. Mark every finding as `[audited against brief, not a rendered surface]`.

---

## 7. Write recon.md

Produce `recon.md` in the working dir with exactly these section headers:

```markdown
# recon.md

## Purpose

## Audience

## Tech stack

## Content inventory

## Funnel

## Design audit

## What to keep
```

**What to keep** is a short, opinionated list of content, copy, or structural elements worth preserving in the redesign. It is the bridge to `de-growth` and `de-direction`. Typical items: a strong testimonial, a clear pricing structure, a compelling case study, a trustworthy certification badge. Do not list anything about the current visual design — that is handled by direction later. Brand-visual assets with equity — logo, illustration style, a distinctive typeface — MAY be listed here even when the surrounding visual design is being discarded; separating brand equity from generic theme styling is the point.

**What does NOT belong in recon.md:**

- Solutions, redesign ideas, or "we should…" recommendations — that is `de-growth` and `de-direction`'s job. recon describes what *is*, not what *should be*.
- Invented metrics (conversion rates, traffic, MRR) not present in the source.
- Aesthetic opinions stated as fact ("the design is dated") — design audit findings must cite the observed pattern, not a verdict.
- New conversion strategy, the ONE CTA, spine tokens, or signature-moment proposals — all downstream.

---

## Anti-patterns

- **Filling thin sections with plausible inventions.** When the source is sparse, the temptation is to write a confident `Audience` or `Funnel` from imagination so the artifact "looks complete." Failure mechanism: `de-growth` and `de-direction` cannot tell invented facts from observed ones, so they optimize the funnel, the ONE CTA, and the spine for a *fictional* audience. The whole pipeline ships a polished site aimed at people who don't exist. Mark gaps `[unknown — not in brief]` instead — a flagged hole is honest; an invented fill is a silent lie.
- **Auditing the brief's claims as if verified.** Treating "the leading platform for X" or "trusted by thousands" from a brief as established fact. Failure mechanism: marketing puffery propagates into recon as ground truth and downstream phases build trust signals on unverifiable claims. Attribute such claims to the source ("brief states…") and mark them `[inferred from brief]`; never restate them as observed reality.
- **Smuggling redesign opinions into the audit.** Writing "needs a bolder hero" instead of "hero is a centred card stack with a purple-to-blue gradient." Failure mechanism: it pre-empts `de-direction`, and a recommendation phrased as an observation can't be re-evaluated against evidence later. Record the observed pattern; leave the fix to direction.

## Good / bad

A paired example for the `Audience` section, brief-only source:

- **BAD:** `Audience: young urban professionals`
  Why it's bad: invented and unsourced. Nothing in the brief said "young," "urban," or "professionals" — it reads as fact but is a guess. `de-growth` will now target ad copy, the ONE CTA, and trust signals at a demographic that may not be real, with no flag warning anyone the foundation is fabricated.
- **GOOD:** `Audience: [inferred from brief] career-motivated graduates; income band [unknown — not in brief]`
  Why it's good: every claim is either tied to brief language and flagged `[inferred from brief]`, or the gap is named explicitly with `[unknown — not in brief]`. Downstream phases know exactly what is solid and what needs validation.

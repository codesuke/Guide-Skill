---
name: de-recon
description: Reverse-engineers any source — a live URL, a Figma link, or a written brief — into a structured recon.md. Use when asked to "reverse engineer site", "audit this site", "what stack is this", "run recon", "analyze this site before redesign", "what does this site do", or "find out what this site is about before we start". Produces: Purpose, Audience, Tech stack, Content inventory, Funnel, Design audit, and What to keep. Output consumed by de-growth and de-direction. Does not write production code.
---

# de-recon — Reverse-Engineer Any Source into recon.md

## What this skill does

Given a live URL, a Figma link, or a written brief, this skill scrapes and reads the real target, then produces a single `recon.md` that gives the rest of the design pipeline everything it needs: what the site/product does, who it is for, how the current stack is built, what content exists, how the funnel flows, what the design looks like today, and what is worth keeping.

**Hard rule: always scrape or read the actual target. Never invent findings. If the source is unreachable, say so explicitly and degrade gracefully (skip that section, note it as unavailable).**

**Embedded analysis mode:** When the only source is a written brief (no live URL, no Figma link) and evidence skills cannot be dispatched, perform every analysis step INLINE using the same criteria — purpose, audience inference, funnel sketch, design signals, etc. — drawing solely from the brief text. Mark each such finding as `[inferred from brief]` rather than skipping the step. Do not fabricate facts not present in the brief; flag genuine gaps as `[unknown — not in brief]`.

---

## Procedure

### 0. Identify the source type

Determine what you have been given:

- **Live URL** → proceed to Step 1.
- **Figma link** → fetch the link with `firecrawl-scrape` to extract text/structure; note that visual inspection is limited. Skip stack fingerprinting unless a live site is also provided. Figma share links often require auth and may return empty — if the scrape yields nothing, mark the design source as unavailable and proceed from any provided URL or written brief instead of silently producing nothing.
- **Written brief** → read it carefully; fill what you can from the text; mark every section where evidence would normally come from scraping as `[inferred from brief — not scraped]`.
- **Multiple sources** → combine; live URL takes precedence over brief for factual claims.

---

### 1. Scrape the real target

**For a live URL:**

1. Run `firecrawl-website-design-clone` on the URL. This extracts the existing design system: colours, fonts, spacing, component patterns. Capture the output.
2. Run `firecrawl-map` on the URL. This maps every reachable page or route. Note the sitemap structure.
3. Run `firecrawl-scrape` on the homepage and 2–4 representative inner pages (e.g. a product/service page, a pricing or enrolment page, an about page). Capture the full text content.

**WordPress / Elementor detection (nicety, not the spine):**

While scraping, look for any of: `wp-content`, `elementor`, `wp-json`, `?ver=` query strings on scripts, or `/wp-admin` references in page source. If found, note "WordPress detected" and flag the tech stack accordingly. This does not change the rest of the procedure — it is simply a useful signal for the rebuild plan.

---

### 2. Infer purpose and target audience

From the scraped content:

- **Purpose:** What does this site/product offer? What action does it want visitors to take? Summarise in one sentence. If a tagline or hero headline exists, quote it verbatim.
- **Audience:** Who is being addressed? Look for language level, imagery descriptions, testimonials, pricing tier names, or explicit "who this is for" copy. Identify primary persona (job title / life stage / need) and secondary if one is visible.

---

### 3. Fingerprint the tech stack

Inspect page source, HTTP headers (via scrape metadata), and asset URLs for signals:

- JavaScript framework: look for `__NEXT_DATA__` (Next.js), `__nuxt` (Nuxt), `<div id="root">` without SSR markers (SPA), `data-astro-*` (Astro).
- CMS / builder: `wp-content` (WordPress), `elementor`, `webflow.io` or Webflow class names, `squarespace.com` assets, `shopify` in asset URLs, `ghost.io`.
- CSS framework: Tailwind utility class names (`text-sm`, `flex`, `gap-`), Bootstrap grid (`col-md-`), custom CSS, or none visible.
- Analytics / scripts: look for GA, GTM, Hotjar, Segment, Intercom embed scripts.
- Hosting signals: check page headers or `<meta name="generator">` tags.

Summarise as a short bulleted list. Mark each item as **confirmed** or **suspected**.

---

### 4. Build the content inventory

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

### 5. Sketch the current conversion funnel

Map the intended visitor journey from the scraped content:

1. **Entry** — how does a visitor arrive? (SEO keywords visible in meta, ads, referral)
2. **Awareness** — what does the hero/above-the-fold communicate?
3. **Consideration** — what content builds the case? (features, testimonials, case studies)
4. **Decision** — what is the primary CTA? Where does it appear? How many times?
5. **Action** — where does the CTA lead? (form, checkout, booking, sign-up)
6. **Friction points** — note any visible friction: buried CTAs, long forms, jargon, missing trust signals.

Present as a numbered list matching the stages above.

---

### 6. Run a design audit

Invoke `impeccable` on the scraped homepage content (and one inner page if available). Ask it to audit:

- Visual hierarchy: does the type scale create clear pull?
- Signature moment: is there one standout interaction or visual moment, or none?
- Generic AI patterns: centred card stack, purple-to-blue gradient, emoji bullets, glowing CTA, stock mascots — flag any present.
- Conversion-design basics: value prop above fold, single primary CTA, trust signal placement, reading pattern alignment.
- Mobile / responsive: any responsive issues visible in the scraped markup?

Summarise `impeccable`'s output into 5–10 bullet findings. Quote the most important verbatim. If `impeccable` is unavailable in the environment, perform the audit manually against the same checklist rather than skipping it.

**No rendered surface (brief-only source):** If `impeccable` IS available but there is no live URL or rendered page to inspect, do not attempt to invoke it against a non-existent surface. Instead, audit the brief's described content — copy, stated layout intentions, named sections — against the same checklist above. Mark every finding as `[audited against brief, not a rendered surface]`.

---

### 7. Write recon.md

Produce `recon.md` in the working directory with exactly these section headers:

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

---

## Outputs

- `recon.md` in the current working directory, with all seven sections populated.
- A brief inline summary of the top 3 findings after writing the file (for the orchestrator's context).

## Inputs consumed by downstream skills

- `de-growth` reads: Purpose, Audience, Funnel, What to keep.
- `de-direction` reads: Purpose, Audience, Tech stack, Design audit, What to keep.

## Does not do

- Write production code.
- Make design or motion decisions (that is `de-direction` and `de-motion`).
- Define the new conversion strategy (that is `de-growth`).

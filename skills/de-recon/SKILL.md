---
name: de-recon
description: Reverse-engineers any source — a live URL, a Figma link, or a written brief — into a structured recon.md. Use when asked to "reverse engineer site", "audit this site", "what stack is this", "run recon", "analyze this site before redesign", "what does this site do", or "find out what this site is about before we start". Produces: Purpose, Audience, Tech stack, Content inventory, Funnel, Design audit, and What to keep. Output consumed by de-growth and de-direction. Does not write production code.
---

# de-recon — Reverse-Engineer Any Source into recon.md

> **Artifact location.** Write `recon.md` to the shared working dir
> `<repo-root>/.design-engineer/<project-slug>/` (repo root via `git rev-parse --show-toplevel`,
> else CWD); create it if missing. Never write into CWD or the repo root. Spec: the orchestrator's
> `reference/artifacts.md`.

## What this skill does

Given a live URL, a Figma link, or a written brief, this skill scrapes and reads the real target, then produces the `recon.md` **Artifact** — what the site/product does, who it is for, how the current stack is built, what content exists, how the funnel flows, what the design looks like today, and what is worth keeping. Output consumed by `de-growth` and `de-direction`. Does not write production code.

## Hard rules

- **Always scrape or read the actual target. Never invent findings. If the source is unreachable, say so explicitly and degrade gracefully** (skip that section, note it as unavailable).
- **Embedded analysis mode:** When the only source is a written brief (no live URL, no Figma link) and evidence skills cannot be dispatched, perform every analysis step INLINE using the same criteria — purpose, audience inference, funnel sketch, design signals, etc. — drawing solely from the brief text. Mark each such finding as `[inferred from brief]` rather than skipping the step. Do not fabricate facts not present in the brief; flag genuine gaps as `[unknown — not in brief]`.
- Keep the content inventory strictly separate from the current design.
- Do **not** write production code, make design/motion decisions (`de-direction`, `de-motion`), or define the new conversion strategy (`de-growth`).

## Procedure overview

Run these steps in order; full detail (per-source-type routing, design-audit checklist, exact section format) is in **[reference/procedure.md](reference/procedure.md)**.

**0. Route by source type:**

- **Live URL** → scrape it (steps below).
- **Figma link** → `firecrawl-scrape` for text/structure; visual inspection limited, stack fingerprinting skipped unless a live site is also given; if it returns empty, mark design source unavailable and proceed from any URL/brief.
- **Written brief** → read it; mark scrape-derived sections `[inferred from brief — not scraped]`; use embedded-analysis mode.
- **Multiple sources** → combine; live URL wins over brief for factual claims.

**1–6. Gather, then write the seven `recon.md` sections:**

1. **Purpose** — what it offers, the action it wants; quote tagline/hero verbatim.
2. **Audience** — primary (and secondary) persona inferred from copy, tiers, testimonials.
3. **Tech stack** — framework / CMS / CSS / analytics / hosting signals; mark each confirmed or suspected.
4. **Content inventory** — per page/section: type, key copy, media, Keep/Restructure/Discard. Kept separate from design.
5. **Funnel** — Entry → Awareness → Consideration → Decision → Action + friction points.
6. **Design audit** — run `impeccable` (or audit manually against the same checklist); 5–10 bullet findings.
7. **What to keep** — opinionated list of content/copy/structure (and brand-equity assets) worth preserving; the bridge to `de-growth`/`de-direction`.

Tools: `firecrawl-website-design-clone`, `firecrawl-map`, `firecrawl-scrape`, `impeccable`. See reference for exact invocation and the `recon.md` section template.

## Outputs

- `recon.md` in the working dir, with all seven sections populated.
- A brief inline summary of the top 3 findings after writing the file (for the orchestrator's context).

## Inputs consumed by downstream skills

- `de-growth` reads: Purpose, Audience, Funnel, What to keep.
- `de-direction` reads: Purpose, Audience, Tech stack, Design audit, What to keep.

# 0004 — Multi-page pipeline and resume detection

**Status:** Accepted · **Date:** 2026-06-17

## Context
The pipeline assumed a single page and a single run. Real redesigns span multiple pages (home,
pricing, docs), and partial runs are common (recon done, growth not). Re-running blindly wasted
work and risked overwriting completed artifacts.

## Decision
1. **Multi-page.** When the ask spans more than one page, run recon + growth + direction **once**
   for the whole site (one shared CTA hierarchy and one spine), then **loop motion + handoff per
   page**. Each page gets `pages/<page-slug>/motion.md` + `prompt-pack.md` and keeps **exactly one**
   signature moment — the doctrine is per-page, not per-site. The page list comes from the recon
   content inventory, confirmed with the user before the loop.
2. **Resume detection.** At session start the director scans the working dir for existing artifacts,
   reports which phases are done, and offers to resume from the first incomplete phase rather than
   re-running. Completed artifacts are never silently overwritten.

## Consequences
Multi-page sites are first-class; runs are interruptible and resumable; no lost work.

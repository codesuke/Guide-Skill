# 0005 — Progressive-disclosure skill structure

**Status:** Accepted · **Date:** 2026-06-17

## Context
Phase `SKILL.md` files had grown to 163–477 lines — full templates, matrices, and procedures inline.
The model loads a whole SKILL.md when the skill triggers, so monolithic files spend tokens on detail
that isn't needed yet and are harder to adapt. The bar (per mattpocock/skills and the write-a-skill
skill) is small, composable skills with detail behind links.

## Decision
Each `SKILL.md` holds only the core: purpose, workflow, hard rules, and links — target < 100 lines.
Detailed templates, scoring rubrics, matrices, and long procedures move to that skill's `reference/*.md`,
linked one level deep. The SKILL.md tells the agent *what* and *when*; reference files hold the *how*.

## Consequences
Cheaper to load, easier to hack, consistent with the ecosystem. Enforced as invariant #1 in
`CLAUDE.md`. The gap-audit harness scans each skill's whole directory so relocating content does not
break the regression checks.

# Design Engineer — Repo Guide

A collection of six composable skills. Read `CONTEXT.md` for the ubiquitous language before
working here. Read `skills/design-engineer/reference/doctrine.md` for the principles every phase
enforces.

## Layout

```
skills/
  design-engineer/   director — runs the pipeline, holds doctrine, learns taste
    SKILL.md         core workflow (<100 lines)
    reference/       doctrine, routing, accountable-wow, artifacts (working-dir convention)
    memory/          taste-ledger, conversion-wins (accumulating knowledge)
    examples/        a real end-to-end run (railrecruit)
    scripts/         scan-skills.sh (auto-discovers installed skills)
  de-recon | de-growth | de-direction | de-motion | de-handoff   phase skills
docs/
  adr/               architecture decision records (one decision per file)
  superpowers/       validators + the gap-audit regression harness + smoke test
install.sh           re-points the global symlinks at this copy (location-independent)
```

## Invariants (do not break)

1. **Progressive disclosure.** Each `SKILL.md` stays small (<100 lines): core workflow + hard
   rules only. Detail (templates, procedures, matrices) lives in that skill's `reference/*.md`,
   linked one level deep. If a SKILL.md grows past ~100 lines, split it.
2. **One artifact per phase, one home.** Every phase reads upstream artifacts from and writes its
   output to the working dir `<repo-root>/.design-engineer/<project-slug>/`. Never CWD or repo root.
3. **The locked chain.** GROWTH locks the ONE CTA; DIRECTION locks the spine; MOTION locks the one
   signature moment. Downstream phases serve these; they never override or rewrite them.
4. **Hard floors win.** LCP < 2.5s, CLS = 0, reduced-motion fallback, WCAG contrast — non-negotiable,
   above both conversion and aesthetics. The signature moment is redesigned to fit, never deleted.
5. **Default mode writes no code.** Only `de-handoff --build` dispatches build subagents.
6. **Descriptions are trigger surfaces.** Every SKILL.md `description:` is third person, says what
   it does, then "Use when …" with concrete triggers (the model only sees the description when
   choosing a skill).
7. **Consistent terminology.** Use the terms in `CONTEXT.md` exactly. New terms get added there first.

## When you change a skill

- Re-run `bash docs/superpowers/validate-skill.sh <name>` (structure + discoverability).
- Re-run `bash docs/superpowers/audit-gaps.sh` (the 8 operational-gap regression checks).
- If a structural decision changed, add an ADR under `docs/adr/`.
- Keep `README.md` and `.claude-plugin/plugin.json` in sync with the skill set.

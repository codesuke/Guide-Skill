# Design Engineer

**A Design Engineering Director for coding agents.** Point it at a tired site or a written brief
and it runs a studio of specialist skills — research → conversion strategy → art direction →
motion → implementation — to produce a high-converting, high-retention *WOW* site.

It does **not** write production code by default. It produces a plan you (or another agent) build
from. Pass `--build` to dispatch and adversarially review actual sections.

Small, composable, hackable. Read `CONTEXT.md` for the language and `CLAUDE.md` for how the repo
is organized.

## The failure modes it fixes

- **"It looks like generic AI slop."** A hard doctrine disqualifies the tells (centred card stacks,
  purple→blue gradient heroes, glowing CTAs) and forces editorial type + references-before-vibes.
  Every page gets **exactly one** crafted signature moment, not ten competing effects.
- **"It's pretty but doesn't convert."** Growth runs *before* looks: one primary CTA, a friction
  audit, and trust signals placed at the funnel's doubt points. Decorative WOW with no conversion
  bet is cut — see `reference/accountable-wow.md`.
- **"The agent guessed and got it wrong."** The pipeline checkpoints after every phase, backs
  direction calls with fetched real references, and treats perf/a11y as hard floors, not polish.
- **"It doesn't get better over time."** Taste calibration learns your eye (project-scoped, so it
  doesn't bleed across clients); shipped conversion bets are recorded and reused.

## Install (global — usable in any project)

```bash
bash install.sh
```

Links all six skills into `~/.agents/skills/` and `~/.claude/skills/` from wherever this folder
lives. **Re-run it any time you move or re-clone the folder** — the symlinks re-point at this copy.

## The collection

| Skill | Role | Output |
|---|---|---|
| [`design-engineer`](skills/design-engineer/SKILL.md) | Director — runs the pipeline, holds doctrine, learns taste | orchestrates all phases |
| [`de-recon`](skills/de-recon/SKILL.md) | Reverse-engineer any source (URL / Figma / brief) | `recon.md` |
| [`de-growth`](skills/de-growth/SKILL.md) | Conversion + retention strategy (the ONE CTA, hypotheses) | `growth.md` |
| [`de-direction`](skills/de-direction/SKILL.md) | 3-concept art-direction tournament + design-system spine | `direction.md` |
| [`de-motion`](skills/de-motion/SKILL.md) | Motion architecture + one scored signature moment + a11y/perf floors | `motion.md` |
| [`de-handoff`](skills/de-handoff/SKILL.md) | Build prompts (default) or `--build` studio loop | `prompt-pack.md` / `studio-output.md` |

All artifacts land in one working dir: `<repo-root>/.design-engineer/<project-slug>/`.

## Usage

```bash
design-engineer <url-or-brief>            # full pipeline → copy-paste prompt pack
design-engineer --build <url-or-brief>    # full pipeline → builds + adversarially reviews each section
de-direction <ask>                        # run a single phase on its own
```

- **[HOW-TO-USE.md](HOW-TO-USE.md)** — prompt-craft patterns + 8 golden prompts.
- **[skills/design-engineer/GUIDE.md](skills/design-engineer/GUIDE.md)** — full reference + a worked end-to-end run.
- **[skills/design-engineer/examples/railrecruit/](skills/design-engineer/examples/railrecruit/)** — a real run, artifact by artifact.

## How it's built

Each `SKILL.md` is a small core (<100 lines); detail lives in that skill's `reference/*.md`
(progressive disclosure). Design decisions are recorded in [`docs/adr/`](docs/adr/). Two harnesses
guard quality — re-run them after any change:

```bash
bash docs/superpowers/validate-skill.sh <skill>   # structure + discoverability
bash docs/superpowers/audit-gaps.sh               # 8 operational-gap regression checks
```

## Requirements

Works best alongside the specialist skills it routes to (firecrawl, impeccable, the GSAP/motion
set, the marketing/CRO set, frontend-design, senior-frontend) and the `shot` screenshot tool for
`--build` visual verification. Missing skills degrade gracefully — the director routes around them.

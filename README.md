# Design Engineer — a skill collection

A **Design Engineering Director** for AI coding agents. Point it at any tired site or a written
brief and it orchestrates a studio of specialist skills to produce a high-converting, high-retention,
*WOW* site — research → conversion strategy → art direction → motion → implementation prompts.

It does **not** write production code by default. It produces a plan you (or another agent) build
from. Pass `--build` to dispatch and self-review actual sections.

## Install (global — usable in any project/instance)

```bash
bash install.sh
```

This links all six skills into `~/.agents/skills/` and `~/.claude/skills/` from wherever this
folder lives. **Run it again any time you move or re-clone the folder** — the global symlinks point
at this copy, so re-running re-points them.

## The collection

| Skill | Role | Output |
|---|---|---|
| `design-engineer` | Director — runs the full pipeline, holds the doctrine, learns your taste | orchestrates all phases |
| `de-recon` | Reverse-engineer any source (URL / Figma / brief) | `recon.md` |
| `de-growth` | Conversion + retention strategy (the ONE CTA, hypotheses) | `growth.md` |
| `de-direction` | 3-concept art-direction tournament + design-system spine | `direction.md` |
| `de-motion` | Motion architecture + one scored signature moment + a11y/perf floors | `motion.md` |
| `de-handoff` | Build prompts (default) or `--build` studio loop | `prompt-pack.md` / `studio-output.md` |

## Usage

```bash
design-engineer <url-or-brief>            # full pipeline → copy-paste prompt pack
design-engineer --build <url-or-brief>    # full pipeline → builds + adversarially reviews each section
de-direction <ask>                        # run a single phase on its own
```

- **[HOW-TO-USE.md](HOW-TO-USE.md)** — the best way to drive it: prompt-craft patterns + 8 golden prompts.
- **[skills/design-engineer/GUIDE.md](skills/design-engineer/GUIDE.md)** — full reference, 17 examples, a worked end-to-end run.
- **[skills/design-engineer/examples/railrecruit/](skills/design-engineer/examples/railrecruit/)** — a real run, artifact by artifact.

## How it improves over time

- **Taste calibration** — on first run it learns what you love/hate and biases every future direction tournament toward your eye (`skills/design-engineer/memory/taste-ledger.md`).
- **Skill auto-discovery** — new skills you install are picked up automatically and routed to the right phase.
- **Conversion-wins ledger** — bets that moved a metric are remembered and reused.

## Requirements

Works best alongside the specialist skills it routes to (firecrawl, impeccable, the GSAP/motion
set, the marketing/CRO set, frontend-design, etc.) and the `shot` screenshot tool for `--build`
visual verification. Missing skills degrade gracefully — the director routes around them.

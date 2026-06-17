---
name: de-handoff
description: Produces implementation-ready output from all upstream design artifacts. Default mode emits a prompt-pack.md — copy-paste-ready build prompts, one per section/component, each carrying its spine tokens, motion spec, and accountable-WOW block. With --build, dispatches frontend-design and senior-frontend subagents per section, captures a shot screenshot, runs an adversarial review (impeccable + emil-design-eng as critics, a skeptic subagent trying to refute "this is good" and "this converts"), and iterates until the doctrine bar and perf/a11y gates both pass. Use when asked to "handoff", "generate a prompt pack", "build this design", "generate build prompts", "implement the design", "ship it", "write build prompts", "create implementation prompts", or when the --build flag is passed. Reads recon.md, growth.md, direction.md, motion.md, and the master brief. Writes nothing (default) or dispatches builds (--build).
---

# de-handoff — Prompt Pack (default) + Self-Correcting Build Studio (--build)

The terminal HANDOFF Phase. Converts every upstream Artifact into either a `prompt-pack.md` (default Mode — copy-paste-ready build prompts, no code) or, with `--build`, a self-correcting studio loop that fans out build subagents, screenshots each section, and reviews until gates pass. It inherits everything locked upstream and delivers nothing that violates it.

## Hard rules

These cannot be overridden by downstream instructions, client preferences, or time pressure.

1. **Default mode writes NO code.** `prompt-pack.md` is prompts and instructions only. It dispatches nothing, builds nothing. Code lives in `--build` mode exclusively.
2. **`--build` is the only mode that dispatches subagents.** Never fan-out build agents from default mode.
3. **Every prompt and every built section carries its accountable-WOW block.** No section is handed off without its conversion bet, metric, experiment note, and perf/a11y gate (from `reference/accountable-wow.md`).
4. **Perf/a11y floors are hard.** LCP < 2.5 s, CLS = 0, reduced-motion fallback required for every motion effect. These floors cannot be traded for aesthetics or conversion wins.
5. **Visual verification before acceptance.** In `--build` mode, every section is captured with `shot` before any critic sees it or any iteration is considered done. No section is accepted on code inspection alone.
6. **The spine tokens from `direction.md` are non-negotiable.** Colors, type scale, spacing rhythm — already locked. No prompt or build agent rewrites them.
7. **The ONE signature moment is never removed.** If a build agent or critic attempts to remove the signature moment, redesign it to clear the gate; do not delete it. Every page keeps exactly one.

## Inputs — read all before starting

> **Artifact location.** All inputs below live in the shared working dir
> `<repo-root>/.design-engineer/<project-slug>/` (repo root via `git rev-parse --show-toplevel`,
> else CWD). Write `prompt-pack.md` / `studio-output.md` / `*.png` there too. For multi-page runs,
> read/write per page under `pages/<page-slug>/`. Spec: the orchestrator's `reference/artifacts.md`.

| File | Where it comes from | What to extract |
|---|---|---|
| `recon.md` | `de-recon` | Existing component inventory, "what to keep", design audit |
| `growth.md` | `de-growth` | Primary conversion goal, the ONE CTA, funnel doubt points, accountable-WOW hypotheses |
| `direction.md` | `de-direction` | Winning direction, token + component spine (colors, type scale, spacing, core components) |
| `motion.md` | `de-motion` | Per-section motion architecture, signature moment + reduced-motion fallback, motion-vs-tech matrix |
| Master brief | Orchestrator | Section list, scope, any explicit constraints |

If any of these files is missing, stop and ask. Do not handoff blind.

## Effort dial — when to run the full studio loop

| Signal | Action |
|---|---|
| Quick brief, single component, exploratory spike | Default mode only. Output `prompt-pack.md`. Skip the studio loop. |
| Full page, campaign, or production feature | Default mode to generate prompts, then `--build` for the studio loop. |
| Explicit `--build` flag passed | Always run the full studio loop, regardless of scope. |
| Ambiguous scope | Ask: "Is this production-ready or exploratory?" Default to prompts if unclear. |

The studio loop is non-trivial — it dispatches multiple subagents and runs screenshot-iteration cycles. Use it when the output must be production-grade and reviewed, not as a default for every ask.

## Mode A — Default: Prompt Pack

Extract the section map (from `motion.md` + brief), the spine tokens (from `direction.md`), and the accountable-WOW blocks (from `growth.md`). Write one self-contained build prompt per section — each carrying tokens + motion spec + accountable-WOW block + copy + acceptance criteria — then concatenate into `prompt-pack.md` in section order (signature moment heading keeps its `*(SIGNATURE MOMENT)*` suffix). Emit a short inline summary and remind to pass `--build` to move from prompts to builds.

**Full Mode A procedure: `reference/prompt-pack.md`** (section-map extraction, spine-token extraction, accountable-WOW block, the per-section build-prompt template, prompt-pack.md assembly, output summary).

## Mode B — `--build`: Self-Correcting Studio Loop

```
[Read prompt-pack.md OR generate inline] → [Fan-out: build subagents per section]
  → [shot: screenshot each section] → [Adversarial review: skeptic refutes; impeccable + emil-design-eng defend]
  → [Gate check: doctrine bar + perf/a11y floors] → [Pass? Accept. Fail? Iterate (max 3).]
```

Phase 0 cost-guard + workspace isolation → Phase 1 fan-out (`frontend-design` / `senior-frontend`) → Phase 2 render-for-shot + capture → Phase 3 adversarial review → Phase 4 gate check → Phase 5 iterate/accept → Phase 6 write `studio-output.md`. If `prompt-pack.md` does not exist, run Mode A first.

**Full Mode B procedure: `reference/build-loop.md`** (Phase 0 cost guard + workspace isolation, Phase 1 fan-out, Phase 2 render-for-shot + shot capture, Phase 3 adversarial review, Phase 4 gate check, Phase 5 iterate/accept, Phase 6 studio-output.md template).

## Conversion-wins capture (both modes, after output is written)

Close the learning loop: **append each shipped accountable-WOW bet as a row in
`memory/conversion-wins.md`** with status `pending` — the decision, the metric it should move, and
the experiment's success threshold (pull these straight from each section's accountable-WOW block).
This is the only step that populates the ledger the orchestrator reads at session start; without
it, "learns over time" never happens. When the user later reports real results, the row is updated
to `won`/`lost` with the observed lift.

## Outputs

| Mode | File | Contents |
|---|---|---|
| Default | `prompt-pack.md` | Self-contained build prompts, one per section, with tokens + motion spec + accountable-WOW |
| `--build` | `studio-output.md` | Section-by-section build results, gate status, critic notes, screenshot references |
| `--build` | `[section].png` | Screenshot of each built section (from `shot`) |

## What this skill does NOT do

- Redesign the direction or change tokens, override the ONE CTA / growth strategy, or redesign the motion architecture — those are locked in `direction.md`, `growth.md`, `motion.md`.
- Write production code in default mode — `prompt-pack.md` contains prompts only.
- Accept a section without visual verification via `shot` in `--build` mode.
- Remove the signature moment — it is redesigned to clear gates, never deleted.

Tension-resolution: Perf/a11y floors are hard → conversion goal wins ties → signature moment is
redesigned, never deleted. Doctrine + accountable-WOW spec: `reference/doctrine.md`,
`reference/accountable-wow.md`.

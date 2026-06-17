# Design Engineer Skill Collection — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a global 7-skill "Design Engineering Director" collection that orchestrates the installed specialist skills to turn any site/brief into a high-converting WOW site — emitting a prompt pack by default, or dispatching + reviewing build subagents on `--build`.

**Architecture:** A thin `design-engineer` orchestrator (doctrine + learning ledger + skill auto-discovery + effort dial) sequences five single-purpose sub-skills (`de-recon`, `de-growth`, `de-direction`, `de-motion`, `de-handoff`). Each is an authored `SKILL.md` (+ reference files) under the **global** skills store. Build spine-first: prove the orchestrator + ledger + routing before fleshing out sub-skills; ship `GUIDE.md` last.

**Tech Stack:** Markdown SKILL.md with YAML frontmatter; the `skills` CLI for install/list; existing global skills (firecrawl-*, impeccable, taste set, gsap/MengTo motion, coreyhaines growth suite, frontend-design, shot tool).

## Global Constraints

- **Source of truth = in-repo**: author every skill under `Guide-Skill/skills/<name>/` (git-tracked), then symlink it into the global store via `bash Guide-Skill/skills/link-skill.sh <name>` (creates `~/.agents/skills/<name>` → repo path). One source: versioned AND live in every project. The `~/.agents/skills/<name>/...` paths in tasks below are the *symlinked* path; the real files live in `Guide-Skill/skills/<name>/`.
- All paths are relative to the repo root (`/home/codesuke/Virtunode/railway-nextjs`); the skills live under `Guide-Skill/skills/`. Work on `main`.
- Skills must NOT write production code by default — deliverable is understanding, decisions, briefs. Only `--build` mode dispatches build subagents.
- Every SKILL.md MUST have valid frontmatter: `name` (kebab-case, matches dir) and `description` (third-person, with trigger phrases).
- Reference-fetching is a rule: direction/recon/motion fetch live references; never invent references; degrade + state when offline.
- Conversion goal wins ties over aesthetics, but never removes the single signature moment; perf + a11y gates are hard floors.
- The orchestrator carries doctrine; primary critic = `impeccable`. Growth phase precedes direction.
- No `Co-Authored-By` trailer in commits (project rule).

---

## File Structure

```
Guide-Skill/skills/          (git-tracked source; each <name>/ symlinked into ~/.agents/skills/<name> via link-skill.sh)
  link-skill.sh               helper: ln -s repo skill dir into ~/.agents/skills/
  design-engineer/
    SKILL.md                  orchestrator: doctrine, phase flow, modes, effort dial
    reference/
      doctrine.md             taste half + growth half + tension-resolution rule
      routing.md              phase → skills routing table
      accountable-wow.md      hypothesis/experiment/gate template
    memory/
      taste-ledger.md         user-calibrated taste verdicts (seeded empty)
      skill-registry.md       known skills + routing notes (auto-refreshed)
      conversion-wins.md      patterns that moved the metric (seeded empty)
    scripts/
      scan-skills.sh          re-scan installed skills → refresh skill-registry.md
    GUIDE.md                  usage guide + quality prompt examples (built last)
  de-recon/SKILL.md           reverse-engineer any source → recon.md
  de-growth/SKILL.md          conversion + retention strategy → growth.md
  de-direction/SKILL.md       3-concept tournament + system spine → direction.md
  de-motion/SKILL.md          motion architecture + signature moment → motion.md
  de-handoff/SKILL.md         prompt-pack | --build studio loop
docs/superpowers/
  validate-skill.sh           shared frontmatter+discoverability checker (test harness)
```

**Verification harness (used by every task):** `validate-skill.sh <name>` checks the
SKILL.md has valid `name`/`description` frontmatter, `name` matches the directory, and
the skill is discoverable via `npx skills list`. This is the "test" for skill authoring.

---

### Task 1: Verification harness + symlink helper + orchestrator skeleton

**Files:**
- Create: `Guide-Skill/docs/superpowers/validate-skill.sh`
- Create: `Guide-Skill/skills/link-skill.sh`
- Create: `Guide-Skill/skills/design-engineer/SKILL.md`

**Interfaces:**
- Produces: `validate-skill.sh <skill-name>` → exits 0 if frontmatter valid + name matches dir + discoverable, else non-zero with reason. Reused by all later tasks.
- Produces: `link-skill.sh <name>` → symlinks `Guide-Skill/skills/<name>` to `~/.agents/skills/<name>` (idempotent). Run after authoring each skill. Reused by all later tasks.
- Produces: global skill `design-engineer` discoverable by the Skill tool.

**link-skill.sh (author in Step 1 alongside the validator):**

```bash
#!/usr/bin/env bash
set -euo pipefail
name="$1"
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$name"
[ -d "$repo_dir" ] || { echo "FAIL: $repo_dir missing"; exit 1; }
mkdir -p "$HOME/.agents/skills"
ln -sfn "$repo_dir" "$HOME/.agents/skills/$name"
echo "linked $name → $repo_dir"
```

Note: author the SKILL.md at `Guide-Skill/skills/design-engineer/SKILL.md`, then run
`bash Guide-Skill/skills/link-skill.sh design-engineer` before validating. The
validator's `~/.agents/skills/design-engineer/SKILL.md` path resolves through the
symlink. Commit `validate-skill.sh`, `link-skill.sh`, AND `skills/design-engineer/SKILL.md`.

- [ ] **Step 1: Write the failing test (validator + run it against not-yet-existing skill)**

```bash
# docs/superpowers/validate-skill.sh
#!/usr/bin/env bash
set -euo pipefail
name="$1"
dir="$HOME/.agents/skills/$name"
f="$dir/SKILL.md"
[ -f "$f" ] || { echo "FAIL: $f missing"; exit 1; }
fm=$(awk '/^---$/{c++; next} c==1' "$f")
echo "$fm" | grep -qE "^name:[[:space:]]*$name$" || { echo "FAIL: name != $name"; exit 1; }
echo "$fm" | grep -qE "^description:[[:space:]]*.+" || { echo "FAIL: description missing"; exit 1; }
echo "OK: $name frontmatter valid"
```

- [ ] **Step 2: Run it to verify it fails**

Run: `bash docs/superpowers/validate-skill.sh design-engineer`
Expected: FAIL: `~/.agents/skills/design-engineer/SKILL.md missing`

- [ ] **Step 3: Author the orchestrator SKILL.md skeleton**

Create `~/.agents/skills/design-engineer/SKILL.md`:

```markdown
---
name: design-engineer
description: Use when turning any site or brief into a high-converting, high-retention WOW site. A Design Engineering Director that orchestrates specialist skills (recon, growth, art-direction, motion, handoff) to produce a prompt pack, or with --build dispatches and reviews build subagents. Triggers: "design engineer", "redesign this site", "make this a wow site", "modernize this landing page", "turn this into a high-converting site".
---

# Design Engineer

Director of a studio of specialist skills. Does NOT write production code by default —
produces understanding, decisions, and briefs. `--build` dispatches + reviews subagents.

## Workflow (checkpoint after each phase)
1. RECON     → invoke `de-recon`      → recon.md
2. GROWTH    → invoke `de-growth`     → growth.md
3. DIRECTION → invoke `de-direction`  → direction.md
4. MOTION    → invoke `de-motion`     → motion.md
5. SYNTHESIZE→ apply reference/doctrine.md, resolve tensions, write master brief
6. HANDOFF   → invoke `de-handoff`    → prompt-pack.md (default) | --build studio loop

## At session start (ALWAYS)
- Read `reference/doctrine.md` and `reference/routing.md`.
- Run `scripts/scan-skills.sh` to refresh `memory/skill-registry.md`.
- Read `memory/taste-ledger.md` and `memory/conversion-wins.md` to bias decisions.

## Modes & effort dial
- Default → prompt pack. `--build` → dispatch + self-correcting studio loop.
- Scale depth to the ask: quick brief ↔ full adversarial studio. Don't pay studio cost for a brief.

## Doctrine (summary; full text in reference/doctrine.md)
Taste: editorial type, ONE signature moment/page, references-before-vibes, reject the AI look.
Growth: clear value prop above fold, ONE primary CTA, friction audit, trust signals.
Tension rule: conversion wins ties, never kills the signature moment; perf/a11y are hard floors.
Primary critic: impeccable.
```

- [ ] **Step 4: Run the test to verify it passes**

Run: `bash docs/superpowers/validate-skill.sh design-engineer && npx --yes skills list 2>/dev/null | grep -q design-engineer && echo DISCOVERABLE`
Expected: `OK: design-engineer frontmatter valid` then `DISCOVERABLE`

- [ ] **Step 5: Commit**

```bash
git add docs/superpowers/validate-skill.sh
git commit -m "Add skill validation harness and design-engineer orchestrator skeleton"
```

---

### Task 2: Doctrine + routing + accountable-WOW reference files

**Files:**
- Create: `~/.agents/skills/design-engineer/reference/doctrine.md`
- Create: `~/.agents/skills/design-engineer/reference/routing.md`
- Create: `~/.agents/skills/design-engineer/reference/accountable-wow.md`

**Interfaces:**
- Consumes: orchestrator SKILL.md references these three files by path.
- Produces: `routing.md` table consumed by every phase; `accountable-wow.md` template consumed by de-growth/de-direction/de-motion.

- [ ] **Step 1: Write the failing test**

```bash
test -f ~/.agents/skills/design-engineer/reference/doctrine.md \
 && test -f ~/.agents/skills/design-engineer/reference/routing.md \
 && test -f ~/.agents/skills/design-engineer/reference/accountable-wow.md \
 && echo PASS || echo FAIL
```

- [ ] **Step 2: Run it to verify it fails**

Run the Step 1 block. Expected: `FAIL`

- [ ] **Step 3: Author doctrine.md** (full taste half, growth half, tension-resolution rule — verbatim from spec §5).

- [ ] **Step 4: Author routing.md** with the phase→skills table:

```markdown
| Phase | Primary skills | Research/evidence |
|---|---|---|
| recon | firecrawl-website-design-clone, firecrawl-scrape/map, impeccable (audit) | — |
| growth | cro, copywriting, marketing-psychology, offers, churn-prevention, onboarding, ab-testing, analytics | customer-research, competitor-profiling, firecrawl-market-research, seo-audit |
| direction | high-end-visual-design, gpt-taste, brandkit, landing-page, theme-factory/shadcn/tailwindcss | firecrawl-deep-research/search |
| motion | cinematic-gsap-lenis-motion-system, gsap-scrolltrigger/timeline/plugins, threejs/webgl-*/globe-*, masked-reveal, staggered-word-reveal, progressive-blur | live Awwwards refs via firecrawl |
| handoff | frontend-design, senior-frontend; critic=impeccable (+emil-design-eng) | shot for visual verify |
```

- [ ] **Step 5: Author accountable-wow.md** — the per-decision template:

```markdown
## Accountable WOW — every major aesthetic decision fills this in
- Decision: <what>
- Conversion bet: <why it should help convert/retain>
- Metric it moves: <e.g. hero CTA click-through>
- Experiment (ab-testing): <variant A vs B, success threshold>
- Instrumentation (analytics): <events to fire>
- Perf gate: <e.g. LCP < 2.5s, no CLS from motion>  |  A11y gate: <reduced-motion fallback>
```

- [ ] **Step 6: Run test to verify it passes** — run the Step 1 block. Expected: `PASS`

- [ ] **Step 7: Commit**

```bash
git commit --allow-empty -m "Add design-engineer doctrine, routing table, accountable-WOW template"
```

---

### Task 3: Learning ledger + skill auto-discovery

**Files:**
- Create: `~/.agents/skills/design-engineer/scripts/scan-skills.sh`
- Create: `~/.agents/skills/design-engineer/memory/{taste-ledger,skill-registry,conversion-wins}.md`

**Interfaces:**
- Consumes: orchestrator calls `scripts/scan-skills.sh` at session start.
- Produces: `scan-skills.sh` regenerates `memory/skill-registry.md` from the live global store; ledger files persist across runs and across projects (global location).

- [ ] **Step 1: Write the failing test**

```bash
bash ~/.agents/skills/design-engineer/scripts/scan-skills.sh 2>/dev/null \
 && grep -q "cro" ~/.agents/skills/design-engineer/memory/skill-registry.md \
 && echo PASS || echo FAIL
```

- [ ] **Step 2: Run it to verify it fails**

Run the Step 1 block. Expected: `FAIL` (script + registry missing).

- [ ] **Step 3: Seed the three memory files**

`taste-ledger.md` and `conversion-wins.md`: a header + an empty "## Entries" section.
`skill-registry.md`: a header noting "auto-generated by scan-skills.sh; do not hand-edit below".

- [ ] **Step 4: Author scan-skills.sh**

```bash
#!/usr/bin/env bash
set -euo pipefail
reg="$HOME/.agents/skills/design-engineer/memory/skill-registry.md"
{
  echo "# Skill Registry (auto-generated by scan-skills.sh)"
  echo "_Refreshed each run. New skills appear here and are eligible for routing._"
  echo
  for d in "$HOME/.agents/skills"/*/; do
    n=$(basename "$d")
    desc=$(awk '/^description:/{sub(/^description:[[:space:]]*/,""); print; exit}' "$d/SKILL.md" 2>/dev/null)
    echo "- **$n** — ${desc:-(no description)}"
  done
} > "$reg"
echo "scan-skills: wrote $(grep -c '^- ' "$reg") skills to registry"
```

- [ ] **Step 5: Run test to verify it passes** — run the Step 1 block. Expected: `PASS`.
Also confirm graceful behavior: registry includes newly added skills on next run (idempotent regenerate).

- [ ] **Step 6: Commit**

```bash
git commit --allow-empty -m "Add design-engineer learning ledger + skill auto-discovery scan"
```

---

### Task 4: de-recon sub-skill

**Files:**
- Create: `~/.agents/skills/de-recon/SKILL.md`

**Interfaces:**
- Produces: `recon.md` with sections: Purpose, Audience, Tech stack, Content inventory, Funnel, Design audit, "What to keep". Consumed by de-growth and de-direction.

- [ ] **Step 1: Write the failing test**

Run: `bash docs/superpowers/validate-skill.sh de-recon`
Expected: FAIL (SKILL.md missing).

- [ ] **Step 2: Author de-recon/SKILL.md** with frontmatter (`name: de-recon`, description with triggers "reverse engineer site", "audit this site", "what stack is this") and a body that: scrapes ANY source (firecrawl-website-design-clone for design system, firecrawl-scrape/map for content; WordPress/Elementor detection as a nicety), infers purpose + audience, fingerprints stack, builds a content inventory **separate from the discardable old design**, sketches the current funnel, runs an `impeccable` audit, and writes `recon.md` with the exact section headers above. Rule: always scrape the real target; never invent.

- [ ] **Step 3: Run the test to verify it passes**

Run: `bash docs/superpowers/validate-skill.sh de-recon && npx --yes skills list 2>/dev/null | grep -q de-recon && echo DISCOVERABLE`
Expected: `OK` + `DISCOVERABLE`.

- [ ] **Step 4: Commit**

```bash
git commit --allow-empty -m "Add de-recon: reverse-engineer any source into recon.md"
```

---

### Task 5: de-growth sub-skill

**Files:**
- Create: `~/.agents/skills/de-growth/SKILL.md`

**Interfaces:**
- Consumes: `recon.md`. Produces: `growth.md` with: Primary conversion goal, Funnel, The ONE CTA, Retention hooks, Social-proof placement, SEO structure, and a list of conversion **hypotheses** (each using `reference/accountable-wow.md`). Consumed by de-direction + de-motion as success metrics.

- [ ] **Step 1: Write the failing test** — `bash docs/superpowers/validate-skill.sh de-growth` → FAIL.

- [ ] **Step 2: Author de-growth/SKILL.md** — frontmatter (`name: de-growth`, triggers "conversion strategy", "improve conversion", "retention plan"). Body drives `cro`, `copywriting`, `marketing-psychology`, `offers`, `churn-prevention`, `onboarding` for strategy; `customer-research`, `competitor-profiling`, `firecrawl-market-research`, `seo-audit` for evidence; emits `growth.md` with the exact sections above and an accountable-WOW hypothesis block per major bet. Establishes the ONE primary CTA that later phases must serve.

- [ ] **Step 3: Run the test to verify it passes** — validator + discoverable. Expected `OK` + `DISCOVERABLE`.

- [ ] **Step 4: Commit** — `git commit --allow-empty -m "Add de-growth: conversion + retention strategy into growth.md"`

---

### Task 6: de-direction sub-skill (tournament + system spine)

**Files:**
- Create: `~/.agents/skills/de-direction/SKILL.md`

**Interfaces:**
- Consumes: `recon.md`, `growth.md`. Produces: `direction.md` containing (a) **3 distinct scored concepts → 1 winner** with runner-up grafts, (b) a live **reference board** (fetched real examples, annotated), (c) a **token + component spine** (colors, type scale, spacing, components) pages inherit.

- [ ] **Step 1: Write the failing test** — `bash docs/superpowers/validate-skill.sh de-direction` → FAIL.

- [ ] **Step 2: Author de-direction/SKILL.md** — frontmatter (`name: de-direction`, triggers "art direction", "design direction", "visual concepts"). Body: MUST fetch live references first (firecrawl-deep-research/search); generate **3 genuinely distinct concepts** (e.g. editorial-bold / cinematic-dark / clean-trust), score each against the growth goal + doctrine, kill two, develop the winner grafting best runner-up ideas; emit the token/component spine via `theme-factory`/`shadcn`/`tailwindcss`; drive `high-end-visual-design`, `gpt-taste`, `brandkit`, `landing-page`. Write `direction.md` with the three sections above. Rule: never propose a direction without ≥1 fetched real reference; never a single concept.

- [ ] **Step 3: Run the test to verify it passes** — validator + discoverable.

- [ ] **Step 4: Commit** — `git commit --allow-empty -m "Add de-direction: 3-concept tournament + reference board + system spine"`

---

### Task 7: de-motion sub-skill (signature moment + gates)

**Files:**
- Create: `~/.agents/skills/de-motion/SKILL.md`

**Interfaces:**
- Consumes: `direction.md`, `growth.md`. Produces: `motion.md` with per-section motion architecture, the chosen **signature moment** (one, from a scored impact×feasibility shortlist), a **motion-vs-tech matrix** (GSAP/Framer/CSS/R3F per effect + reason), and **a11y + perf budget**.

- [ ] **Step 1: Write the failing test** — `bash docs/superpowers/validate-skill.sh de-motion` → FAIL.

- [ ] **Step 2: Author de-motion/SKILL.md** — frontmatter (`name: de-motion`, triggers "motion design", "scroll animation plan", "parallax/gsap plan"). Body: pick which sections parallax/snap/pin/scrub/stagger; run a **signature-moment concept lab** scoring candidates on impact×feasibility, keep exactly ONE; build the motion-vs-tech matrix routing to `cinematic-gsap-lenis-motion-system`, `gsap-scrolltrigger`/`timeline`/`plugins`, `threejs`/`webgl-*`/`globe-*`, `masked-reveal`, `staggered-word-reveal`, `progressive-blur`; specify reduced-motion fallbacks + a perf budget (e.g. LCP/CLS targets) as hard floors. May fetch live Awwwards refs. Write `motion.md`.

- [ ] **Step 3: Run the test to verify it passes** — validator + discoverable.

- [ ] **Step 4: Commit** — `git commit --allow-empty -m "Add de-motion: motion architecture, signature-moment lab, a11y+perf gates"`

---

### Task 8: de-handoff sub-skill (prompt pack + --build studio loop)

**Files:**
- Create: `~/.agents/skills/de-handoff/SKILL.md`

**Interfaces:**
- Consumes: `recon.md`, `growth.md`, `direction.md`, `motion.md`, master brief. Produces: `prompt-pack.md` (default) OR, on `--build`, dispatched subagents + reviewed code. Defines the studio loop: `build → shot → adversarial review → iterate`.

- [ ] **Step 1: Write the failing test** — `bash docs/superpowers/validate-skill.sh de-handoff` → FAIL.

- [ ] **Step 2: Author de-handoff/SKILL.md** — frontmatter (`name: de-handoff`, triggers "handoff", "prompt pack", "build this design"). Body, two modes:
  - **Default:** compile copy-paste-ready prompts per section/component, each carrying its accountable-WOW block + the relevant spine tokens; drive nothing, write `prompt-pack.md`.
  - **`--build`:** dispatch build subagents (`frontend-design`/`senior-frontend`) per section, then the **self-correcting studio loop**: capture a `shot` screenshot → **adversarial review** (a skeptic subagent tries to refute "this is good" and "this converts"; `impeccable` primary + `emil-design-eng` polish defend) → iterate until the doctrine bar + perf/a11y gates pass. Uses `superpowers:dispatching-parallel-agents` for fan-out.
  - Effort dial: skip the loop for quick briefs.

- [ ] **Step 3: Run the test to verify it passes** — validator + discoverable.

- [ ] **Step 4: Commit** — `git commit --allow-empty -m "Add de-handoff: prompt pack + --build self-correcting studio loop"`

---

### Task 9: Taste calibration onboarding

**Files:**
- Modify: `~/.agents/skills/design-engineer/SKILL.md` (add onboarding section)
- Modify: `~/.agents/skills/design-engineer/memory/taste-ledger.md` (calibration schema)

**Interfaces:**
- Consumes: empty/seed `taste-ledger.md`. Produces: a populated ledger schema (`## Calibration` with liked/disliked reference patterns + the why) that biases de-direction scoring.

- [ ] **Step 1: Write the failing test**

```bash
grep -q "## Calibration" ~/.agents/skills/design-engineer/memory/taste-ledger.md \
 && grep -q "first run" ~/.agents/skills/design-engineer/SKILL.md \
 && echo PASS || echo FAIL
```

- [ ] **Step 2: Run it to verify it fails** — Expected `FAIL`.

- [ ] **Step 3: Add the onboarding section to the orchestrator** — on first run (empty ledger), present 4–6 reference sets (terminal links or a `shot` board), record the user's likes/dislikes + the *why* into `taste-ledger.md` under `## Calibration`. On later runs, skip and read the ledger to bias `de-direction` concept scoring.

- [ ] **Step 4: Add the `## Calibration` schema to taste-ledger.md** — fields: pattern, verdict (love/hate), why, date.

- [ ] **Step 5: Run the test to verify it passes** — run the Step 1 block. Expected `PASS`.

- [ ] **Step 6: Commit** — `git commit --allow-empty -m "Add taste-calibration onboarding feeding the ledger"`

---

### Task 10: End-to-end dry run on a real tired site

**Files:**
- Create: `docs/superpowers/de-smoke-test.md` (record of the run)

**Interfaces:**
- Consumes: the full collection. Produces: evidence that recon→growth→direction→motion→handoff yields all artifacts on a real URL, default mode.

- [ ] **Step 1: Write the failing test** — define expected artifacts: recon.md, growth.md, direction.md (3 scored concepts + spine), motion.md (one signature moment + gates), prompt-pack.md.

- [ ] **Step 2: Run `design-engineer` on a real tired site (default mode)** against a chosen URL; let it run all phases with checkpoints.

- [ ] **Step 3: Verify each artifact exists and meets its contract** — direction.md has exactly one winning concept from 3; motion.md has exactly one signature moment; every major decision has an accountable-WOW block; prompt-pack.md prompts are copy-paste-ready. Record pass/fail per artifact in `de-smoke-test.md`.

- [ ] **Step 4: Fix any sub-skill gaps surfaced**, re-run the affected phase.

- [ ] **Step 5: Commit** — `git add docs/superpowers/de-smoke-test.md && git commit -m "Add end-to-end smoke test of design-engineer collection"`

---

### Task 11: GUIDE.md — usage guide with quality prompt examples

**Files:**
- Create: `~/.agents/skills/design-engineer/GUIDE.md`

**Interfaces:**
- Consumes: the finished collection + the smoke-test run as the worked example. Produces: the user-facing usage guide.

- [ ] **Step 1: Write the failing test**

```bash
test -f ~/.agents/skills/design-engineer/GUIDE.md \
 && grep -q "Worked example" ~/.agents/skills/design-engineer/GUIDE.md \
 && grep -q -- "--build" ~/.agents/skills/design-engineer/GUIDE.md \
 && echo PASS || echo FAIL
```

- [ ] **Step 2: Run it to verify it fails** — Expected `FAIL`.

- [ ] **Step 3: Author GUIDE.md** covering (per spec §9b): when to use `design-engineer` vs a single sub-skill; copy-paste invocation examples per phase and for `--build` vs prompt-pack; a worked end-to-end example (tired site → WOW) drawn from the smoke test, showing each artifact; effort-dial guidance with example prompts; how the learning ledger improves results over repeated use. Include ≥5 quality prompt examples.

- [ ] **Step 4: Run the test to verify it passes** — run the Step 1 block. Expected `PASS`.

- [ ] **Step 5: Commit** — `git add -A && git commit -m "Add design-engineer GUIDE.md with quality prompt examples"`

---

## Self-Review

**Spec coverage:** §2 collection → Tasks 1,4–8. §3 workflow → Task 1 + smoke (10). §4.1 tournament → Task 6. §4.2 accountable WOW → Task 2 (template) + 5–7 (applied). §4.3 studio loop → Task 8. §4.4 calibration+system-first → Tasks 9 + 6. §5 doctrine → Task 2. §6 learning system → Task 3. §7 routing → Task 2. §8 modes/effort dial → Tasks 1 + 8. §9a global install → Global Constraints + all dirs under `~/.agents/skills`. §9b guide → Task 11. §10 internet-always → embedded in de-recon/direction/motion bodies (Tasks 4,6,7). §12 success criteria → Task 10 contracts. No gaps.

**Placeholder scan:** Sub-skill bodies (Tasks 4–8) describe required sections + routing rather than full verbatim prose — acceptable for skill authoring where the SKILL.md *is* the prose; section contracts and frontmatter are exact. No TBD/TODO.

**Type consistency:** Artifact names consistent across tasks (recon.md, growth.md, direction.md, motion.md, prompt-pack.md). Validator signature `validate-skill.sh <name>` reused unchanged. Skill names match dirs throughout.

# How to Use the Design Engineer Skill — The Best Way

A practical, opinionated guide to driving the `design-engineer` collection well.
For the full feature reference, see [`skills/design-engineer/GUIDE.md`](skills/design-engineer/GUIDE.md).

---

## TL;DR

```
design-engineer <url-or-brief>            # full pipeline → a copy-paste prompt pack
design-engineer --build <url-or-brief>    # full pipeline → actually builds + reviews each section
de-direction <ask>                        # run just one phase, when you already have the inputs
```

The collection is **installed globally** — these work in any project, not just this folder.
If you ever move or re-clone this folder, run `bash install.sh` once to re-point the global links.

It does **not** write production code by default. It produces a *plan you (or another agent) build from*. `--build` is the only mode that writes code.

---

## The mental model

Think of `design-engineer` as a **director** running six specialists in sequence. Each produces one artifact the next one consumes:

```
RECON → GROWTH → DIRECTION → MOTION → SYNTHESIZE → HANDOFF
recon.md  growth.md  direction.md  motion.md   (brief)   prompt-pack.md / studio-output.md
```

Two rules drive everything downstream, so get them right early:
- **The ONE primary CTA** is locked in GROWTH and every later phase must serve it.
- **Exactly ONE signature moment** per page is chosen (by score) in MOTION.

If you only remember one thing: **growth before looks.** Conversion goal shapes the visuals, never the reverse.

---

## The single best way to use it: full pipeline, with checkpoints

For a real redesign, run the whole pipeline and **review the artifact after each phase** before moving on. The director checkpoints by default — use those moments.

```
design-engineer Redesign https://oldsite.com into a high-converting, modern site.
Primary goal: more demo bookings. Audience: ops managers at mid-size logistics firms.
Walk the full pipeline and pause after each phase so I can review the artifact.
```

Why this beats one big prompt: you catch a wrong audience read in `recon.md` *before* it poisons direction and motion. Fixing phase 1 is cheap; fixing it after handoff is not.

---

## Writing prompts that get the best result

The skill is good on a one-liner, but it's *great* when you feed it the three things it would otherwise have to guess:

1. **The conversion goal** — what should this page make people *do*? ("book a demo", "enroll", "start a trial")
2. **The audience + their emotional state** — "anxious first-time buyers", "skeptical senior engineers", "time-poor founders"
3. **The hard constraints** — stack, perf floor, brand colors you must keep, things you must *not* change

**Weak prompt:**
```
design-engineer make my site look better
```

**Strong prompt:**
```
design-engineer Redesign the homepage at https://acme.dev.
Goal: increase free-trial signups. Audience: senior backend engineers who distrust marketing fluff.
Must stay on Next.js + Tailwind. Perf floor: LCP < 2.5s, CLS = 0. Keep the wordmark; everything else is open.
Give me the prompt pack — I'll build it myself.
```

The second prompt lets GROWTH lock a real CTA, lets DIRECTION score concepts against a real audience, and lets MOTION respect your perf floor. Same skill, far better output.

---

## Golden prompts (copy, adapt, paste)

**1 — Modernize a tired site, plan only**
```
design-engineer Turn https://oldsite.com into a modern, high-converting site.
Goal: more enquiries. Default mode — I want a prompt pack, not a build.
```

**2 — Full studio build, production-bound**
```
design-engineer --build https://oldsite.com
Run every phase, build each section in parallel, screenshot and adversarially review each one,
and iterate until the doctrine bar and the perf/a11y gates pass.
```

**3 — From a written brief (no live site needed)**
```
design-engineer Brief: a 2-year-old Shopify store for handmade ceramics. Sales are flat, the hero is a
stock slider, reviews are buried. Goal: lift add-to-cart rate. Modern, warm, editorial — not another generic store.
```

**4 — Just the visual direction (you already know the strategy)**
```
de-direction Run a 3-concept tournament for a calm, trustworthy fintech onboarding page.
Audience: anxious first-time investors. Score the concepts and emit the winning token spine.
```

**5 — Just the motion plan, with a hard perf budget**
```
de-motion Design the scroll/motion layer for this landing page. The signature moment must serve the
"start free trial" CTA. Perf floor: LCP < 2.5s, CLS = 0, total animation JS ≤ 60KB. Give reduced-motion fallbacks.
```

**6 — Audit an existing site before deciding anything**
```
de-recon https://acme.dev — reverse-engineer purpose, audience, stack, content inventory, funnel, and a design audit.
Tell me what's worth keeping.
```

**7 — Turn an approved plan into build prompts**
```
de-handoff Read recon.md, growth.md, direction.md, motion.md and produce prompt-pack.md —
one self-contained build prompt per section, each carrying its tokens, motion spec, and conversion bet.
```

**8 — Push back / iterate on a phase**
```
de-direction The winning concept feels too safe for this brand. Re-run the tournament with a bolder
editorial archetype in the mix, and show me the scoring so I can see why it wins or loses.
```

---

## `--build` vs default — when to spend the studio

| You want… | Use | You get |
|---|---|---|
| A plan to hand to your own devs / another agent | **default** | `prompt-pack.md` — copy-paste prompts |
| To explore directions cheaply | **default**, maybe skip motion | quick prompt pack |
| Actual built, reviewed sections | **`--build`** | built code + `shot` screenshots + `studio-output.md` review log |

Don't pay studio cost for an exploratory pass. Start default; run `--build` once the direction is approved.

---

## First run: the taste calibration

The very first time you use it, the director shows you 4–6 reference aesthetics and asks **what you love, what you hate, and why.** Spend two minutes here and answer honestly — your verdicts are saved to `memory/taste-ledger.md` and bias every future direction tournament toward *your* eye. Skipping it just means generic taste until you do it.

It gets smarter over time on its own: it auto-discovers newly installed skills, and records conversion bets that worked so later runs start from proven patterns instead of guesses.

---

## Common mistakes (and the fix)

- **Vague goal** ("make it pop") → the pipeline picks a goal for you. **Fix:** state the one action the page should drive.
- **Skipping checkpoints** → a bad recon read compounds. **Fix:** review each artifact before the next phase.
- **Reaching for `--build` first** → expensive iteration on an unapproved direction. **Fix:** approve the prompt pack, *then* `--build`.
- **Asking for many "wow" effects** → the doctrine allows exactly one signature moment. **Fix:** name the one moment that matters; let the rest be quiet.
- **Fighting the perf/a11y floors** → they're hard floors by design. **Fix:** give the floor up front so motion is planned within it.

---

## Where things live

```
skills/design-engineer/
  SKILL.md            the director (workflow, modes, calibration)
  GUIDE.md            full feature reference + 17 examples
  reference/          doctrine, routing table, accountable-WOW template
  memory/             taste-ledger, conversion-wins  (your accumulating knowledge)
  examples/railrecruit/   a real end-to-end run you can read as a model
skills/de-recon | de-growth | de-direction | de-motion | de-handoff
```

Read `examples/railrecruit/` to see exactly what a finished run looks like, artifact by artifact.

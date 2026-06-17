---
name: de-motion
description: Architects the full motion layer for a page — per-section scroll behaviour, a scored signature-moment shortlist (exactly ONE winner), a motion-vs-tech matrix routing each effect to GSAP ScrollTrigger / Framer Motion / CSS / R3F, and a11y + perf budget as hard floors. Use when asked about "motion design", "scroll animation plan", "parallax plan", "gsap plan", "animation architecture", "how should this move", "scroll experience", "scroll choreography", "entrance animations", "page motion", "interaction design plan", or "motion strategy". Reads direction.md and growth.md; produces motion.md. Does not write production code.
---

# de-motion — Motion Architecture, Signature-Moment Lab, and a11y + Perf Gates

## What this skill does

Reads `direction.md` (from `de-direction`) and `growth.md` (from `de-growth`) and produces the full motion architecture for the page. It maps per-section scroll behaviours, runs a scored Signature-Moment Concept Lab to select exactly ONE Signature moment, builds a Motion-vs-Tech Matrix routing each effect to the right tool, and locks a11y + perf Hard floors that every motion decision must clear before handoff.

Output: `motion.md` in the shared working dir `<repo-root>/.design-engineer/<project-slug>/`
(repo root via `git rev-parse --show-toplevel`, else CWD; read `direction.md` + `growth.md` from
the same dir). For multi-page runs, write to `pages/<page-slug>/motion.md`. If upstream files are
missing, run the earlier phases first. Spec: the orchestrator's `reference/artifacts.md`.

## The crux

Choose exactly ONE Signature moment by score; everything else supports it. Spend
disproportionate effort scoring and developing that one moment — competing effects dilute it and
break the perf floors. Make every other section quiet so the winner reads as the hero.

## Do not proceed

Do not emit `motion.md` until the signature-moment shortlist is scored with visible arithmetic to
exactly ONE winner, every section has a reduced-motion fallback, and every effect is routed in the
Motion-vs-Tech Matrix and clears the Hard floors.

---

## Hard rules

These constraints are non-negotiable. They cannot be waived by downstream instructions, client preferences, or aesthetic arguments.

1. **Exactly ONE signature moment.** The shortlist must score candidates on impact × feasibility and pick one winner. Never assert a Signature moment without showing the shortlist and scores. Competing Signature moments are cut, not compromised.

2. **Motion without intent is cut.** Every effect must have a stated conversion bet or UX purpose tied to content or the conversion goal from `growth.md`. Decoration with no rationale is removed at synthesis, regardless of how good it looks.

3. **Reduced-motion fallbacks are mandatory floors.** Every effect in `motion.md` must list its `prefers-reduced-motion` fallback. A Signature moment that cannot survive that fallback is redesigned to a lighter technique — it is never deleted. Every page keeps exactly one Signature moment.

4. **Perf budget is a hard floor.** LCP < 2.5 s and CLS = 0 from motion are non-negotiable. Any effect that risks CLS (position-shifting during scroll) or delays LCP must be redesigned or deferred. These Hard floors cannot be traded for aesthetic or conversion goals.

5. **References before vibe.** Fetch at least one live Awwwards or comparable reference before finalising the signature-moment shortlist. If the network is unavailable, state "OFFLINE — reference fetch failed" explicitly, degrade to named references from memory, and mark items as `[reference unverified]`.

6. **The signature moment is redesigned, not deleted, under conflict.** If the chosen Signature moment violates a perf or a11y floor, it is redesigned (lighter technique, reduced-motion version) to fit. The floor still wins — but the moment survives in adapted form.

7. **Tension-resolution order.** Perf/a11y floors → conversion goal → Signature moment. The moment is never removed to win a conversion argument; it is adapted.

---

## Inputs

- `direction.md` — read **Winning Direction**, **Token + Component Spine** (scroll-linked elements, Signature moment candidate, layout rhythm).
- `growth.md` — read **Primary conversion goal**, **The ONE CTA**, **Hypotheses**, **Funnel map** (doubt points, friction zones).

If either file is missing, stop and ask. Do not design motion blind.

---

## Procedure overview

1. **Per-section motion map** — map the page section by section, one `### <Section>` sub-header each (the parseable map `de-handoff` reads), with motion type, intent, trigger, reduced-motion fallback, CLS risk, and LCP impact. Min 5 sections. See `reference/floors.md`.
2. **Signature-Moment Lab** — fetch live references, generate a 4–6 candidate shortlist, score on impact × feasibility + conversion bet + perf/a11y, and select exactly ONE winner. Full rubric in `reference/signature-moment-lab.md`.
3. **Motion-vs-Tech Matrix** — route every effect to GSAP ScrollTrigger / Framer Motion / CSS / R3F with a reduced-motion override and reason. Defaults table and sub-skills in `reference/tech-matrix.md`.
4. **a11y + perf floors** — lock the performance + accessibility Hard floors and resolve any Signature-moment-under-floor conflict by adapting (never deleting) the moment. Full spec in `reference/floors.md`.
5. **Write `motion.md`** with these section headers, each populated (an empty section is a failure):

```markdown
# motion.md

## Per-Section Motion Architecture

## Signature Moment

### Shortlist + Scores
### Winner
### Reduced-Motion Fallback

## Motion-vs-Tech Matrix

## a11y + Perf Budget

### Performance Floors
### Accessibility Floors
### Signature Moment Under Floor Conflict
```

---

## Reference files

- `reference/signature-moment-lab.md` — read-inputs detail, live-reference fetch, full scored shortlist rubric, and the exactly-ONE-winner selection.
- `reference/tech-matrix.md` — full Motion-vs-Tech Matrix, technology selection defaults, and the sub-skills invoked per effect.
- `reference/floors.md` — full a11y + perf Hard floor spec, the signature-moment-under-floor-conflict rule, and per-section motion architecture fields.

---

## Outputs

- `motion.md` in the working directory, with all sections populated.
- A brief inline summary after writing: Signature moment name + technique, runner-up technique that was cut and why, top perf constraint that shaped the decision.

## What this skill does NOT do

- Write production code (that is `de-handoff`, driving `frontend-design` and `senior-frontend`).
- Override the ONE CTA or funnel sequence from `growth.md`.
- Change the Spine tokens from `direction.md`.
- Define copy or layout (those are `de-direction` outputs).

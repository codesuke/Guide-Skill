# Output Format — direction.md

Produce `direction.md` in the working dir with exactly these section headers:

```markdown
# direction.md

## Winning Direction

## Reference Board

## Token + Component Spine
```

State the active reference mode (full / budget / offline — see SKILL.md Hard rule 1) at the top of
the file. If the taste ledger had no calibration entries, also state that at the top.

**Winning Direction** contains: the full winning concept write-up, the tournament scoring table,
the grafted runner-up elements, the named disqualifying flags from the runners-up, and (if taste
bias applied) the `### Taste Bias Applied` subsection. See `reference/tournament.md`.

**Reference Board** contains: the annotated references. See `reference/spine.md`.

**Token + Component Spine** contains: color tokens (5a), type scale (5b), spacing rhythm (5c), core
components (5d). See `reference/spine.md`.

---

## Skills invoked and their role

| Phase | Skill | Purpose |
|---|---|---|
| References | `firecrawl-deep-research` | Pull live design references before any direction is proposed |
| References | `firecrawl-search` | Supplement with Awwwards / Siteinspire / Dribbble searches |
| Direction | `high-end-visual-design` | Evaluate whether each concept clears the craft bar |
| Direction | `gpt-taste` | Second-opinion taste check on the winning direction |
| Direction | `brandkit` | Ensure the winning direction is compatible with existing brand assets from recon.md |
| Direction | `landing-page` | Verify the winning direction serves the landing page conversion pattern |
| Direction | `impeccable` | Primary critic — flag generic AI patterns, audit visual hierarchy |
| Spine | `theme-factory` | Generate the token set and type scale in the winning direction |
| Spine | `shadcn` | Map core components to shadcn primitives where appropriate |
| Spine | `tailwindcss` | Translate the spine into Tailwind config extensions |

---

## Outputs

- `direction.md` in the working dir, with all three sections populated.
- A brief inline summary after writing: winning direction name, top grafted runner-up element,
  signature moment, and the primary color token set.

---

## What does NOT belong in direction.md

Keep these out — each is owned by another phase or is explicitly locked:

- **Motion / scroll choreography, timing, easing** — that is `de-motion`. DIRECTION only nominates
  the signature moment; it does not animate it.
- **Conversion strategy changes** — the primary goal, hypotheses, and funnel are locked in
  `growth.md`. Do not revise them here.
- **Overriding or re-labelling the ONE CTA** — locked in `growth.md`; the spine serves it, never
  redefines it.
- **Build / implementation code, framework choices, file scaffolding** — that is `de-handoff`.
- **Final page copy** — that is `copywriting` at handoff.

## What this skill does NOT do

- Write production code (that is `de-handoff`).
- Define motion or timing (that is `de-motion`).
- Write final page copy (that is `copywriting` at handoff).
- Override the ONE CTA established in `growth.md`.

---

## Doctrine enforced

Taste half of `reference/doctrine.md`:

- **Editorial type with a real scale** — the type scale must show genuine contrast; flat scales are
  flagged.
- **Exactly ONE signature moment per page** — the winning direction nominates it; `de-motion`
  develops it.
- **References before vibes** — reference fetching is non-optional; no direction proceeds without at
  least one fetched reference.
- **Perf and a11y are floors** — every high-craft element in the spine must state its LCP impact and
  reduced-motion fallback.
- **Reject the generic AI look** — `impeccable` audits every concept; disqualifying patterns are
  named and replaced.

Growth half of `reference/doctrine.md`:

- **WOW serves the conversion goal** — every signature moment in a concept must carry a conversion
  bet (Accountable WOW).
- **ONE primary CTA** — the spine's CTA Block component enforces single-primary-action; it cannot be
  instanced more than once per page at primary visual weight.
- **F/Z reading patterns** — layout intent in each concept must state the reading pattern and CTA
  placement on that scan path.

Tension-resolution: perf/a11y floors first → conversion goal wins ties → the single signature
moment is redesigned to serve both, never deleted.

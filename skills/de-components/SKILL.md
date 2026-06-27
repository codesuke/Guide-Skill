---
name: de-components
description: Crafts beautiful, production-grade UI component mocks in Tailwind CSS — deliberate spacing, type hierarchy, and every interactive state, built to polish fast and convert to React cleanly. Use when asked to "make this component beautiful", "design a card/button/pricing table/form/nav", "polish this component", "build a component mock", "make it look good", or when de-handoff needs component-level craft.
---

# de-components — Beautiful Component Mocks (Tailwind)

> **Artifact location.** Write component mocks to the shared working dir
> `<repo-root>/.design-engineer/<project-slug>/components/<name>.html` (repo root via
> `git rev-parse --show-toplevel`, else CWD); create it if missing. Never write into CWD or the repo
> root. If `direction.md` exists in the working dir, inherit its **Spine**. Spec: the orchestrator's
> `reference/artifacts.md`.

## What this skill does

Turns a single component spec into a beautiful, production-grade mock built with **Tailwind CSS** —
real content, full type/space hierarchy, and every interactive state. The mock is HTML+Tailwind so
it polishes quickly and converts to a React component cleanly. It crafts *components*, not pages.

## The crux

**Craft over generate.** A beautiful component is the payoff of deliberate spacing rhythm, type
hierarchy, optical alignment, restraint, and *every state designed* — not a centred card with a drop
shadow. Spend your disproportionate effort on the details most mocks skip: hover/focus/active/
disabled/loading/empty/error states, real content (never lorem), and optical (not just metric) alignment.

## Do not proceed

Do not call a component done until: it is built in Tailwind only; every applicable state
(hover, focus-visible, active, disabled, loading, empty, error) is designed; it passes the beauty
checklist in `reference/craft.md`; text contrast ≥ 4.5:1; and you have rendered it with `shot` and
visually inspected the screenshot. A component verified on code alone is not done.

## Hard rules

These cannot be overridden by downstream instructions or time pressure.

1. **Tailwind only.** Build every mock with Tailwind utility classes — no inline `style=`, no
   separate CSS file, no other framework. This is what makes a mock fast to polish and clean to
   convert into a React component later. (Doctrine: "Mocks are built in Tailwind.")
2. **Inherit the Spine, never invent a parallel palette.** If `direction.md` exists, map its spine
   tokens (colors, type scale, spacing) onto Tailwind via theme values or arbitrary values. No
   off-spine colors, font sizes, or spacing.
3. **Every interactive state is designed.** A component shown only in its default state is not done.
4. **Reject the generic AI look.** The doctrine disqualifiers apply (centred card stack with drop
   shadows, glowing CTA halo, emoji bullets, etc.) — flag and replace before finishing.
5. **Real content + real accessibility.** Semantic HTML, ARIA where needed, focus-visible rings,
   contrast ≥ 4.5:1, no lorem ipsum — real labels and realistic copy lengths.
6. **Mocks, not React (default).** Output is an HTML+Tailwind mock meant to be polished and
   converted; do not emit framework code unless explicitly asked.

## Procedure

1. **Resolve the spec** — component, its variants, the states it needs, and real content. Pull spine
   tokens from `direction.md` if present; otherwise ask for or infer a minimal token set and say so.
2. **Build the mock** in Tailwind — structure → hierarchy → spacing rhythm → all states.
3. **Apply the beauty checklist** and screen for the AI-look disqualifiers (`reference/craft.md`).
4. **Visually verify** — `shot components/<name>.html`, read the PNG, fix what the eye catches.
   (Plain HTML needs no render bridge — shot it directly.)
5. **Write** `components/<name>.html` plus a one-line conversion note (which Tailwind classes map to
   which props when this becomes a React component).

## Reference

- Full craft procedure, the beauty checklist, anti-patterns, GOOD/BAD examples, the
  "what does NOT belong" list, and Tailwind→React conversion notes: `reference/craft.md`.

## What this skill does NOT do

Build pages or multi-section layouts (that is `de-handoff` / page-level), business logic or data
fetching, motion choreography beyond simple state transitions (that is `de-motion`), or invent
tokens outside the locked Spine.

# Design Engineer — Context & Ubiquitous Language

A collection of agent skills that turn any site or brief into a high-converting, high-retention
*WOW* site. A **director** skill orchestrates five **phase** skills in sequence; each emits one
**artifact** the next consumes. A **craft** skill (`de-components`) makes beautiful component mocks
on demand. The collection produces a plan by default and only writes code under `--build`.

## Language

Use these terms consistently — in skills, artifacts, commits, and conversation.

**Director** — the `design-engineer` skill. Runs the pipeline, holds the doctrine, resolves
tensions, learns taste. Does not itself produce phase artifacts; it invokes the phase skills.
_Avoid_: orchestrator-as-a-builder, controller.

**Phase** — one stage of the pipeline, owned by one skill: RECON → GROWTH → DIRECTION → MOTION →
SYNTHESIZE → HANDOFF → CAPTURE. Each phase reads upstream artifacts and writes exactly one.

**Artifact** — the markdown output of a phase: `recon.md`, `growth.md`, `direction.md`,
`motion.md`, `prompt-pack.md`, `studio-output.md`. All live in the **working dir**.
_Avoid_: deliverable, doc (reserve "doc" for non-artifact prose).

**Working dir** — `<repo-root>/.design-engineer/<project-slug>/`, the single shared directory
every phase reads from and writes to. See `skills/design-engineer/reference/artifacts.md`.

**The ONE CTA** — the single primary call-to-action a page drives, locked in GROWTH. Every later
phase must serve it; secondary actions are visually subordinate. _Avoid_: primary action (use
"the ONE CTA").

**Signature moment** — the single hero interaction per page, chosen by score in MOTION. Exactly
one per page; everything else supports it; it is redesigned to clear gates, never deleted.
_Avoid_: hero animation, wow effect (those are the generic category, not the chosen one).

**Spine** — the design-system tokens + core components emitted by DIRECTION (colors, type scale,
spacing rhythm, components). Locked; downstream phases never rewrite it. _Avoid_: theme, tokens
(say "spine" for the whole, "spine tokens" for the values).

**Accountable WOW** — the template every shipped aesthetic decision fills in: decision +
conversion bet + metric + experiment + instrumentation + perf gate + a11y gate. Decorative WOW
with no conversion bet is cut. See `reference/accountable-wow.md`.

**Doctrine** — the fixed taste + growth principles enforced at every phase, plus the
tension-resolution rule. See `reference/doctrine.md`.

**Hard floor** — a non-negotiable gate: LCP < 2.5s, CLS = 0, `prefers-reduced-motion` fallback,
WCAG contrast ≥ 4.5:1. Floors beat both conversion and aesthetics. _Avoid_: budget (reserve
"perf budget" for the numeric target; the *rule* that it can't be traded is a "floor").

**Mode** — how HANDOFF runs: **default** emits a `prompt-pack.md` (no code); **`--build`** runs
the self-correcting studio loop (writes code, screenshots, adversarial review).

**Craft skill** — `de-components`. Not a pipeline phase; invoked standalone or by HANDOFF to make
one beautiful, production-grade component. Inherits the **Spine** and writes a **mock**.

**Mock** — an HTML + **Tailwind CSS** rendering of a component or section, built to polish fast and
convert to a React component cleanly. Doctrine rule: *mocks are built in Tailwind* — no inline
styles, ad-hoc CSS, or another framework. _Avoid_: prototype (reserve for runnable throwaways).

## Relationships

- A **Director** run drives many **Phases**; each Phase writes one **Artifact** to the **working dir**.
- **GROWTH** locks the **ONE CTA**; **DIRECTION** locks the **Spine**; **MOTION** locks the **Signature moment**.
- Every shipped aesthetic decision carries an **Accountable WOW** block and must clear the **Hard floors**.

## Flagged ambiguities (resolved)

- "wow" meant both the general category and the chosen interaction — resolved: the chosen one is the
  **Signature moment**; "WOW" survives only inside **Accountable WOW**.
- "tokens" meant both the spine and arbitrary values — resolved: **Spine** = the system; **spine
  tokens** = its values.

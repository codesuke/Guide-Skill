# a11y + Perf Budget (Hard floors)

State the budget as a formal constraints table. These are Hard floors, not targets — everything above them is acceptable, anything below them requires a redesign of the offending effect.

## Performance floors

```
LCP target:         < 2.5 s on 4G mid-range mobile
CLS budget:         0.00 (motion must not shift layout; use transform/opacity only)
INP budget:         < 200 ms for any interaction-triggered animation
Total animation JS: ≤ 60 KB gzipped for GSAP + Lenis combined (tree-shake aggressively)
GPU layer budget:   ≤ 8 simultaneous composited layers during peak scroll
```

For each effect in the Motion-vs-Tech Matrix, confirm it uses only `transform` and `opacity` for animation properties (GPU-compositable, CLS-safe). Flag any effect that animates `height`, `width`, `top`, `left`, `margin`, or `padding` — these cause layout thrash and must be redesigned.

## Accessibility floors

```
prefers-reduced-motion: all effects must have an explicit fallback defined
WCAG 2.1 AA motion:    no animation > 5 flashes per second
WCAG 2.1 AA contrast:  motion does not reduce text contrast below 4.5:1 at any point
Focus management:       scroll-hijack / pinned sections must not trap keyboard focus
```

For every effect, the reduced-motion fallback must be one of:
- **Instant reveal** — element appears at its final state, no animation.
- **Simple fade** — 200–300 ms opacity transition only.
- **Static state** — no motion at all; content fully readable without animation.

Fallbacks that are themselves animations (e.g. "slower parallax") are not acceptable — they do not satisfy `prefers-reduced-motion`.

## Signature moment under floor conflict

If the chosen Signature moment conflicts with any floor above:

1. State the conflict explicitly.
2. Propose a redesigned technique that clears the Hard floor.
3. Confirm the redesigned technique still earns its Signature-moment status.
4. Update the reduced-motion fallback if needed.

**The moment is never deleted. It is adapted.**

## Per-section motion architecture fields

Map the page section by section. Emit each section under its own `### <Section name>` markdown sub-header (e.g. `### Hero`, `### Social Proof`) — one sub-header per section, NOT a single fenced block. The `### ` sub-headers are the parseable section map that `de-handoff` reads to build its section list. Under each section's sub-header, define the per-section fields:

```
### [Section name — e.g. Hero, Features, Social Proof, CTA, Footer]
Motion type: [one of: parallax / snap / pin-scrub / stagger-in / word-reveal / static / masked-reveal / progressive-blur / none]
Intent: [why — what UX or conversion goal does this motion serve]
Trigger: [viewport entry / scroll position / user interaction]
Reduced-motion fallback: [exact fallback — e.g. "fade-in at 0.3s" or "instant reveal"]
CLS risk: [none / low (state why) / HIGH (redesign required)]
LCP impact: [none / deferral possible / BLOCKS LCP (flag for redesign)]
```

Sections with `CLS risk: HIGH` or `LCP impact: BLOCKS LCP` must be redesigned before the motion architecture is finalised. Flag them explicitly with `[REDESIGN REQUIRED]`. Minimum 5 sections mapped. If `direction.md` specifies fewer sections, infer from standard landing page structure and note the inference.

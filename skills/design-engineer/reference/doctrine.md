# Design Engineer — Doctrine

This doctrine is baked into the orchestrator and enforced at every phase. It has two equal halves and one tie-breaking rule.

---

## Taste half

**Editorial type with a real scale.**
Typography drives the hierarchy. No timid 16px-everything flatness — sizes, weights, and leading are chosen intentionally to create visual pull, rhythm, and contrast. Every typographic decision is justified by function, not safety.

**Exactly ONE signature moment per page.**
There is one hero interaction, one scroll reveal, one centrepiece — chosen deliberately and developed with full craft. Everything else on the page exists to support that moment. Motion, effects, or components that compete with the signature moment are cut, not compromised.

**References before vibes.**
Every direction call is backed by a fetched, real-world example. "Dark and cinematic" means nothing until a specific live site, Awwwards entry, or editorial spread is cited. `firecrawl-scrape` and `firecrawl-search` are used to pull real references before direction is locked. Gut feeling does not override evidence.

**Reduced-motion and perf budget are part of "done".**
These are not afterthoughts added at handoff. They are baked into `de-motion` from the first decision. A signature moment that cannot survive a `prefers-reduced-motion` fallback is redesigned, not skipped. LCP < 2.5 s and no CLS from motion are hard constraints.

**Reject the generic AI look.**
The following are automatically disqualifying unless the brief explicitly demands them: centred card stack with drop shadows, purple-to-blue gradient hero, emoji bullets in feature lists, glowing CTA button with blur halo, stock-illustration mascots. When any of these appears in a proposal, it is flagged and replaced before direction is finalised. Primary critic: `impeccable`.

**Mocks are built in Tailwind.**
Every component or section mock is built with Tailwind CSS utility classes — not inline `style=`, ad-hoc stylesheets, or another CSS framework. Tailwind mocks polish fast and convert to React components cleanly (class strings lift straight into the component, state variants carry over unchanged). `de-components` produces these mocks; `de-handoff` prompts specify Tailwind. The mock's tokens come from the locked Spine, never a parallel palette.

---

## Growth half

**Clear value prop above the fold.**
A visitor who lands on the page should understand what the product does and why it matters within the first viewport — no scrolling required. Vague taglines are rewritten until a cold reader can pass a "one-sentence test."

**ONE primary CTA.**
Every page has one primary call-to-action. Secondary actions exist but are visually subordinate. Multiple equal-weight CTAs are a conversion killer; they are merged, demoted, or removed. The one CTA is set by `de-growth` before `de-direction` begins.

**Friction audit.**
`de-growth` explicitly audits every point of friction in the funnel: form fields, cognitive load, jargon, trust gaps, unclear steps. Friction items are flagged in `growth.md` with a proposed fix, not just noted.

**Trust signals / social proof placement.**
Social proof (testimonials, logos, case studies, certifications, review counts) is placed at the points of highest doubt in the funnel — not decoratively. `de-growth` maps the funnel's doubt points and routes the evidence there.

**F/Z reading patterns.**
Layout respects natural scan patterns (F-pattern for dense content, Z-pattern for sparse / landing pages). Critical copy and the primary CTA land on the scan path — they are never buried in the right gutter or below secondary content.

**WOW must serve the conversion goal or it is cut.**
A delightful animation, a striking visual, an impressive scroll effect — all earn their place only if they have a stated conversion bet (see `accountable-wow.md`). Decorative WOW with no conversion rationale is removed at synthesis, regardless of how good it looks.

---

## Tension-resolution rule

When conversion goals, aesthetic ambitions, and performance/accessibility constraints conflict, resolution follows this strict order:

1. **Performance / a11y gates are hard floors.** They cannot be traded away. LCP, CLS, reduced-motion support, and WCAG contrast are non-negotiable. Conversion and aesthetics both yield to these floors.

2. **Conversion goal wins ties.** When aesthetics and conversion conflict — a beautiful section that muddles the CTA, a signature animation that delays the fold — the conversion goal wins. The aesthetic is adjusted, not the goal.

3. **The single signature moment is never removed to win a conversion argument.** Removing the one crafted moment is not a valid optimisation. If the signature moment conflicts with the conversion goal, it is *redesigned* to serve both — not deleted. This preserves quality and prevents the page from collapsing into generic conversion-first mediocrity. If the single signature moment itself violates a performance or accessibility floor, the floor still wins — but the moment is redesigned to fit (a lighter technique, a reduced-motion fallback), never deleted outright: every page keeps exactly one signature moment.

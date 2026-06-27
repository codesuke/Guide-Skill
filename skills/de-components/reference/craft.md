# de-components — Craft Procedure, Checklist, Anti-patterns

The detail behind `SKILL.md`. Read it before building anything you intend to call beautiful.

## Full procedure

1. **Resolve the spec.** Name the component, its variants (e.g. primary/secondary/ghost), the data
   it carries, and the exact states it must support. Write real content — real labels, realistic
   copy lengths, a long-name and an empty case. Pull the Spine from `direction.md` (colors, type
   scale, spacing, radii). If no Spine exists, propose a minimal token set and state that it is
   provisional.
2. **Structure first.** Lay out semantic HTML (the right element for the job: `button`, `a`, `ul`,
   `dl`, `figure`, `label`+`input`). Get the DOM right before a single utility class.
3. **Hierarchy.** Apply the type scale so the eye lands in the intended order. No timid
   16px-everything — size, weight, and color create the rank.
4. **Spacing rhythm.** Use one consistent spacing step set (the Spine's). Space is the cheapest
   luxury signal; uneven padding is the loudest amateur tell.
5. **State design.** Build every applicable state: `hover:`, `focus-visible:`, `active:`,
   `disabled:`, loading (skeleton/spinner), empty, and error. Use Tailwind state variants.
6. **Polish pass.** Optical alignment (not just metric), border/shadow restraint, transition
   timing, dark-mode if the Spine defines it.
7. **Verify.** `shot components/<name>.html`, read the PNG, fix what the eye catches that the code
   hid. Then write the file + conversion note.

## The beauty checklist (must pass)

```
[ ] Tailwind only — no inline styles, no separate CSS, no other framework
[ ] Inherits the Spine — every color / size / space is a Spine token, none invented
[ ] Type hierarchy is intentional and scaled (not flat 16px-everything)
[ ] Spacing rhythm is consistent (one step set, even optical padding)
[ ] Every state designed: hover, focus-visible, active, disabled, loading, empty, error
[ ] Semantic HTML + ARIA where needed; visible focus-visible ring
[ ] Contrast ≥ 4.5:1 on text in every state
[ ] Real content (no lorem); handles long text and the empty case without breaking
[ ] None of the AI-look disqualifiers present
[ ] shot screenshot captured and visually inspected
```

## Anti-patterns (with the bad output each causes)

- **Generic card with a drop shadow and centred text.** The AI-default look — reads as a template,
  not craft; fails the doctrine's reject-the-AI-look rule on sight.
- **Only the default state designed.** Ship it and hover/focus/disabled feel broken or missing in
  real use; keyboard users get no focus ring; the component looks unfinished the moment it's touched.
- **Lorem ipsum content.** Hides real-content overflow, wrapping, and empty-state bugs — the mock
  lies about how it behaves with production data, so the bug surfaces only after the React build.
- **Inline styles or a separate stylesheet instead of Tailwind.** Slow to iterate on, and the
  React conversion becomes a rewrite instead of a copy of class strings — the exact pain the
  Tailwind rule exists to prevent.
- **Inventing colors/sizes off the Spine.** The component looks fine alone but clashes the moment
  it sits next to the rest of the system; defeats the locked design system.

## Good / bad

**BAD** — non-semantic, inline styles, lorem, one state, off-spine:
```html
<div style="box-shadow:0 4px 12px rgba(0,0,0,.1);text-align:center;padding:20px">
  <p>Lorem ipsum dolor sit amet</p>
  <div style="background:#6d28d9;color:#fff;border-radius:9999px">Click here</div>
</div>
```
Why it's bad: inline styles (won't convert cleanly), centred-card-with-shadow AI look, lorem hides
real wrapping, the "button" is a `div` (no keyboard/focus), purple is off-Spine, zero states.

**GOOD** — semantic, Tailwind, real content, Spine tokens, states:
```html
<article class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
  <h3 class="text-lg font-semibold tracking-tight text-slate-900">Signalling Fundamentals</h3>
  <p class="mt-1 text-sm text-slate-600">CPD-certified · 6 weeks · job-ready outcomes</p>
  <button type="button"
    class="mt-4 inline-flex items-center rounded-lg bg-teal-700 px-4 py-2 text-sm font-medium
           text-white transition hover:bg-teal-800 focus-visible:outline-none
           focus-visible:ring-2 focus-visible:ring-teal-600 focus-visible:ring-offset-2
           active:bg-teal-900 disabled:cursor-not-allowed disabled:opacity-50">
    Enroll now
  </button>
</article>
```
Why it's good: real content, semantic `article`/`h3`/`button`, Spine colors, full state set
(hover/focus-visible/active/disabled), and every class string lifts straight into a React component.

## What does NOT belong in a component mock

- Page layout or multiple sections — that is `de-handoff` / page-level work.
- Business logic, data fetching, or state management.
- React / JSX / framework code in default mode (mocks are HTML + Tailwind).
- Motion choreography beyond simple state transitions — that is `de-motion`.
- Any color, size, or spacing not drawn from the locked Spine.

## Tailwind → React conversion note

Because the mock is utility classes on semantic HTML, conversion is mechanical: copy the markup into
a component, lift repeated class strings into the variant the prop selects (e.g. `intent="primary"` →
the teal class set; `intent="ghost"` → the bordered set), and replace static content with props. The
state variants (`hover:`/`focus-visible:`/`disabled:`) carry over unchanged. Note the prop→class map
in one line when you save the mock so the conversion is unambiguous.

# Spine — Token + Component Specification

The **Spine** is the design-system tokens + core components emitted by DIRECTION (colors, type
scale, spacing rhythm, components). It is locked; downstream phases (`de-motion`, `de-handoff`, and
every page-build phase) inherit it and never rewrite it. Do not skip any section.

---

## Reference board (build before the spine)

From the references fetched in the tournament, assemble a curated board. Include only references
that influenced the winning direction (plus any that improve it via runner-up grafts).

Format for each reference:
```
#### Reference: [short name or domain]

- **URL:** [full live URL]
- **What to steal:** [specific, actionable — name the element: "the kerned editorial headline at 7vw", "the single-column constraint that forces scanability", "the muted olive background at #3D3B2E that lets white text breathe"]
- **What to adapt:** [any aspect that needs translation — e.g. "their dark bg is too heavy for our trust requirements; take the type contrast, not the bg color"]
- **Session-fetched:** [yes / no / degraded-unverified]
```

Minimum 3 references on the board. If fewer than 3 were successfully fetched, flag as REFERENCE
BOARD INCOMPLETE and list what additional research is needed.

---

## 5a. Color tokens

```
--color-bg-primary:       [hex]   /* page background */
--color-bg-secondary:     [hex]   /* section / card backgrounds */
--color-surface:          [hex]   /* elevated surface (modal, drawer) */
--color-border:           [hex]   /* default divider */
--color-text-primary:     [hex]   /* body + primary headings */
--color-text-secondary:   [hex]   /* supporting copy, labels */
--color-text-muted:       [hex]   /* captions, metadata */
--color-accent:           [hex]   /* primary CTA + links */
--color-accent-hover:     [hex]   /* CTA hover state */
--color-accent-subtle:    [hex]   /* accent at low opacity for backgrounds */
```

For each token: include hex value, role, and WCAG contrast ratio against its most common pairing.

---

## 5b. Type scale

Driven by `theme-factory` and `tailwindcss`. State the scale in a way that can be directly
translated to Tailwind config or CSS custom properties.

```
Type system: [font family decisions — heading / body / mono]

Scale:
--text-display:   [size / line-height / weight / tracking] — used for: [hero headline]
--text-h1:        [size / line-height / weight / tracking] — used for: [page title]
--text-h2:        [size / line-height / weight / tracking] — used for: [section heading]
--text-h3:        [size / line-height / weight / tracking] — used for: [subsection / card title]
--text-body-lg:   [size / line-height / weight / tracking] — used for: [lead paragraph]
--text-body:      [size / line-height / weight / tracking] — used for: [default body]
--text-body-sm:   [size / line-height / weight / tracking] — used for: [captions, labels]
--text-ui:        [size / line-height / weight / tracking] — used for: [button labels, nav]
```

State the type ratio clearly: how many stops separate the display from h1, h1 from h2, etc. A flat
scale (everything between 14–18px) is a doctrine violation.

---

## 5c. Spacing rhythm

```
--space-unit:   [base unit — e.g. 4px or 8px]

Section padding:    [value] — [how sections breathe from each other]
Container max-w:    [value] — [max content width; wide layout rule from doctrine]
Column gutter:      [value] — [space between grid columns]
Component gap:      [value] — [default space between stacked components]
Inline gap:         [value] — [space between inline elements, icon + label]
```

---

## 5d. Core components

List the 6–10 components that must be built first because everything else depends on them. For
each:

```
Component: [name]
Driven by: [shadcn / tailwindcss / custom]
Variant notes: [size variants, state variants — hover, active, disabled, focus]
Doctrine note: [any doctrine rule this component must enforce — e.g. "only one per page", "reduced-motion fallback required"]
```

Required minimum: Button (primary + secondary), Heading (all scale levels), Section (layout
wrapper), Card, CTA Block (the ONE CTA component), Navigation.

The CTA Block enforces single-primary-action: it cannot be instanced more than once per page at
primary visual weight. This protects the ONE CTA — DIRECTION never overrides it.

# Tournament — Concept Generation, Scoring, Kill/Graft, Taste Bias

The tournament runs after inputs are read and references are fetched. It produces the
**Winning Direction** section of `direction.md`: three genuinely distinct concepts, a weighted
scoring table, two kills, and a developed winner that grafts the best runner-up ideas.

---

## 0. Read inputs

Open `recon.md` and `growth.md` from the working dir. Extract and hold in context:

From `recon.md`:
- Product purpose and audience persona.
- Design audit findings — what is broken or generic today.
- What to keep — brand equity items, strong copy, trust signals.

From `growth.md`:
- The ONE CTA (label, destination, value prop contract).
- The primary conversion goal.
- The top hypotheses — these are the visual bets to win or lose.

Read sections precisely: `recon.md` → **Purpose**, **Audience**, **Design audit**, **What to
keep**. `growth.md` → **Primary conversion goal**, **The ONE CTA**, **Hypotheses**. If either file
is missing, stop and ask. Do not generate direction blind.

---

## 0b. Read taste-ledger calibration (MANDATORY before concept generation)

Read `~/.claude/skills/design-engineer/memory/taste-ledger.md`. Locate the `## Calibration`
section. A per-project taste override at `<working-dir>/taste.md` takes precedence over the global
ledger for concept scoring (this is project-scoped taste).

**If the `## Calibration` section exists and has entries:**
- Extract all `love` verdict entries — aesthetic patterns to favour.
- Extract all `hate` verdict entries — aesthetic patterns to penalise.
- Hold these as **taste bias**. They apply in Step 3: a concept matching a `love` pattern receives
  +0.5 to its raw score on the most relevant criterion; a concept echoing a `hate` pattern receives
  −0.5 on the most relevant criterion.
- In `direction.md`, under `## Winning Direction`, include a `### Taste Bias Applied` subsection
  listing each active calibration entry and which concept(s) it affected, so the bias can be
  challenged.

**If the `## Calibration` section is absent or has no entries:**
- State "Taste ledger has no calibration entries — proceeding without bias" at the top of the
  direction output. No score adjustments are made.

Do not skip this step. Do not proceed to reference fetching until the ledger has been read (or its
absence noted).

---

## 1. Fetch live references (MANDATORY before direction)

Run reference passes in parallel. Do not skip. If a tool is unavailable, log the failure and
proceed with the degradation rule (the mode rules in SKILL.md Hard rule 1).

**Primary reference pass — invoke `firecrawl-deep-research`:**

Query: `"[product category] site design [year] award-winning"` and `"[product category] landing
page design inspiration"`. Capture: URL, screenshot or scraped design tokens (colors, type, layout
signals), what makes it notable.

**Secondary reference pass — invoke `firecrawl-search`:**

Query: 3–5 specific Awwwards, Siteinspire, Mobbin, or Dribbble searches relevant to the audience
persona and product category. Capture the same fields.

For each fetched reference, record:
```
URL: [live URL]
What to steal: [specific, concrete — "the editorial type contrast on the hero", "the scroll pacing on the features section", "the muted background that makes the CTA pop"]
What to avoid: [anything that conflicts with the doctrine or the growth goal]
```

Reference count depends on the active mode (SKILL.md Hard rule 1): 5–8 in full mode; 1–3 fetched
plus named fallbacks in budget mode; named fallbacks only in offline mode. Quality over quantity in
all modes — each reference must have a concrete annotation.

---

## 2. Generate three genuinely distinct concepts

After references are in hand, generate exactly three concepts. They must be GENUINELY distinct —
different emotional register, different typographic approach, different visual weight. "Light
version of dark" is not a second concept. Use these archetypes as starting scaffolds (substitute if
better alternatives serve the brief):

| Archetype | Character | When it wins |
|---|---|---|
| **Editorial-bold** | High type contrast, dominant headline, restrained color, editorial rhythm | Credibility-first audiences; professional services; low color tolerance |
| **Cinematic-dark** | Dark backgrounds, high-contrast light pulls, hero-moment dramatics, depth | Premium / aspirational products; technical audiences who associate dark with power |
| **Clean-trust** | Generous white space, soft palette, clear hierarchy, minimal motion | Healthcare, finance, education; audiences with high anxiety / decision friction |

You are not limited to these archetypes — derive from the references and the audience. The point is
that each concept must have a distinct REASON TO EXIST grounded in the evidence, not just a palette
swap.

For each concept, write:

```
### Concept [N]: [Name]

**Character:** [one sentence — the emotional register this concept owns]
**References:** [cite ≥1 fetched reference by URL and what you are stealing]
**Typography:** [headline typeface and weight, body typeface, size relationship]
**Color palette:** [3–5 tokens with hex and role]
**Signature moment:** [the ONE high-craft element — what it is, where it lives, what it does]
**Layout intent:** [how the above-fold reads; reading pattern (F/Z); CTA placement]
**Conversion bet:** [why this direction serves the primary growth goal from growth.md]

**Disqualifying flags:** [any generic AI patterns present — must flag or state "none"]
```

---

## 3. Score and tournament

Score each concept on a 1–5 scale across five criteria. Show every score and its rationale — no
blank cells.

| Criterion | Weight | What it measures |
|---|---|---|
| **Growth alignment** | 30% | Does this direction serve the ONE CTA and primary conversion goal from growth.md? |
| **Doctrine: editorial type** | 20% | Does the type scale create genuine visual pull? Is it functional hierarchy, not safety? |
| **Doctrine: references** | 15% | Is every stylistic claim backed by a fetched reference? No vibes without evidence. |
| **Doctrine: no AI look** | 15% | Are the generic AI patterns absent or explicitly replaced with something distinctive? |
| **Doctrine: signature moment** | 20% | Is the signature moment chosen deliberately, developed with full craft, and conversion-serving? |

Compute the weighted score for each concept. Show the arithmetic. If taste bias from Step 0b
applies, show the adjustment inline (e.g. "+0.5 taste-love match on editorial type") so it is
transparent and reversible.

**Kill two.** The two lower-scoring concepts are eliminated. Name the exact reasons they lost.

**Develop the winner.** Take the winning concept and explicitly graft the best non-competing ideas
from the runners-up. State what was grafted and why it improves the winner without diluting it.

The winner must nominate exactly one Signature moment per page — never two competing ones called a
feature. Any striking visual treatment must carry an Accountable WOW conversion bet (see
`reference/accountable-wow.md`); decorative direction without a conversion rationale is removed.

---

## Anti-patterns

- **Three concepts that are the same layout in three colour palettes.** This is a fake tournament:
  the caller gets no real strategic choice, the scoring is theatre, and the "winner" is arbitrary
  (whichever palette you liked). Fix by varying emotional register, layout system, and type
  personality — not the accent hue.
- **Vibes without references.** A direction call with no fetched (or specific named) reference is
  unfalsifiable: nobody can check it, so it drifts under the first downstream pushback and the spine
  built on it has no anchor. Every stylistic claim must point at a real URL.
- **Timid 16px-everything type scale.** A flat scale (everything between 14–18px) produces no
  editorial hierarchy: the eye finds no entry point, the headline has no pull, and the page reads as
  a generic AI template. Force genuine stops between display, h1, h2, body (see `spine.md` 5b).

---

## Good / bad

**BAD — concepts differ only in accent colour:**
```
Concept 1: centred hero, 16px body, indigo CTA.   Ref: linear.app
Concept 2: centred hero, 16px body, emerald CTA.  Ref: linear.app
Concept 3: centred hero, 16px body, crimson CTA.  Ref: linear.app
```
Same layout, same type, same reference, same signature moment — one concept wearing three coats.
The kill is meaningless because nothing real was eliminated.

**GOOD — concepts differ in emotional register + layout system + type personality, each cited:**
```
Concept 1 (clean-trust): single-column, single-action above fold, soft palette, humanist sans,
  generous whitespace.        Ref: stripe.com/payments — "calm hierarchy that de-risks the click".
Concept 2 (editorial-bold): asymmetric magazine grid, 7vw kerned display headline, high type
  contrast, restrained colour.  Ref: an Awwwards editorial site fetched this session.
Concept 3 (cinematic-dark):  dark canvas, high-contrast light pulls, depth and one dramatic hero
  moment.                       Ref: vercel.com — "dark surface that makes the accent detonate".
```
Each owns a distinct reason to exist grounded in evidence, so the scoring discriminates and the kill
removes a real alternative.

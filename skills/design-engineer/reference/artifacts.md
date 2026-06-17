# Design Engineer — Artifact Location Convention

Every phase reads its upstream inputs from, and writes its output to, ONE shared working
directory. This removes the cross-phase ambiguity of "where is recon.md?" when phases run
as separate invocations or across sessions.

## The working directory

```
<repo-root>/.design-engineer/<project-slug>/
```

- **`<repo-root>`** — if invoked inside a git repo, the repo root (`git rev-parse --show-toplevel`).
  Otherwise the current working directory.
- **`<project-slug>`** — a kebab-case slug derived from the project/domain or brief
  (e.g. `acme-dev`, `railrecruit`). One slug per redesign target. Reuse the same slug across
  phases so they share artifacts.

## What lives there

| File | Written by |
|---|---|
| `recon.md` | de-recon |
| `growth.md` | de-growth |
| `direction.md` | de-direction |
| `motion.md` | de-motion |
| `prompt-pack.md` | de-handoff (default) |
| `studio-output.md`, `*.png` | de-handoff (--build) |
| `taste.md` (optional) | per-project taste override — see taste-ledger.md |

## Rules

1. **Resolve the dir once, at the start of every phase.** Create it if missing (`mkdir -p`).
2. **Read upstream artifacts from this dir.** If a required upstream file is missing, stop and
   say which phase must run first — do not proceed blind.
3. **Never scatter artifacts into CWD or the repo root.** They always go in the working dir.
4. **Multi-page runs** namespace per-page files under `pages/<page-slug>/` — see the
   orchestrator's "Multi-page sites" section. Site-wide artifacts (recon, growth, direction
   spine) stay at the project-slug root; `motion.md` and `prompt-pack.md` are per page.

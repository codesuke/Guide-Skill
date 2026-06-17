# 0001 — Shared working directory for pipeline artifacts

**Status:** Accepted · **Date:** 2026-06-17

## Context
Phases run as separate skill invocations, sometimes across sessions. Each reads upstream artifacts
("read recon.md") and writes its own, but no location was defined — so later phases could fail to
find inputs or scatter outputs into CWD or the repo root.

## Decision
All phases share one working dir: `<repo-root>/.design-engineer/<project-slug>/` (repo root via
`git rev-parse --show-toplevel`, else CWD). Every phase resolves it first, creates it if missing,
reads upstream artifacts from it, and writes its output there. Multi-page runs namespace per-page
files under `pages/<page-slug>/`. Full spec: `skills/design-engineer/reference/artifacts.md`.

## Consequences
Cross-phase hand-off is deterministic; standalone phase invocations agree on location; artifacts
never pollute the repo. Each phase skill carries an "Artifact location" note so it holds even when
invoked without the director.

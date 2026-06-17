# 0002 — `--build` rendering, workspace isolation, and cost guard

**Status:** Accepted · **Date:** 2026-06-17

## Context
The `de-handoff --build` studio loop mandates visual verification via `shot`, dispatches parallel
build subagents that write real code, and can fan out to ~tens of agent calls. Three gaps:
`shot` cannot screenshot a raw `.tsx`/`.jsx` source; parallel writes had no workspace isolation;
and there was no cost ceiling before fan-out.

## Decision
1. **Render-for-shot bridge.** Before `shot`, obtain a rendered surface: start the project's dev
   server and target the route; or render the component into a standalone HTML harness; or shot a
   static HTML file. No rendered surface → the section cannot pass visual verification.
2. **Workspace isolation.** Before fan-out, create an isolated workspace (`superpowers:using-git-worktrees`
   or a new git branch) so parallel writes cannot corrupt the user's tree and the run is reviewable
   or discardable as a unit.
3. **Cost guard.** Before fan-out, compute and show an agent-count estimate
   (`sections × roles × iterations`) and confirm scope with the user unless they passed an explicit
   no-ask/budget directive.

## Consequences
Visual verification works on real component stacks; the user's tree is safe; large runs are
opt-in. Adds a Phase 0 to `--build` and a render step to Phase 2.

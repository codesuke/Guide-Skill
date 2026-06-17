#!/usr/bin/env bash
# Deterministic gap audit for the design-engineer collection.
# Each check keys on a SPECIFIC, CONTIGUOUS anchor phrase unique to that provision.
# Newlines are flattened so a phrase wrapped across a line break still matches, but NO
# unbounded `.*` is used — that would span the whole document and match spuriously.
# PASS = provision present, FAIL = provision absent. Exit code = gaps still open.
set -uo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/skills"
de="$root/design-engineer"
fail=0

# hasflat <regex> <file...> -> 1 if regex matches any file's whitespace-collapsed content
hasflat() {
  local re="$1"; shift
  local f
  for f in "$@"; do
    [ -f "$f" ] || continue
    if tr '\n' ' ' < "$f" | tr -s ' ' | grep -iEq "$re"; then echo 1; return; fi
  done
  echo 0
}
chk() {
  local name="$1" found="$2"
  if [ "$found" -eq 1 ]; then echo "PASS  $name"; else echo "FAIL  $name"; fail=$((fail+1)); fi
}

# Scan each skill's WHOLE directory (SKILL.md + any reference/*.md) so progressive-disclosure
# splits relocate content without breaking these regression checks.
ALL=$(find "$root" -name '*.md')
HANDOFF=$(find "$root/de-handoff" -name '*.md')
ORCH=$(find "$de" -name '*.md')

# G1 — shared working-dir convention (intentionally repeated across phase skills + artifacts.md)
chk "G1 artifact location convention defined" \
  "$(hasflat '\.design-engineer/<project-slug>' $ALL)"

# G2 — how to get a rendered surface before shot (contiguous, unique phrases)
chk "G2 render-for-shot step defined in --build" \
  "$(hasflat 'standalone html harness|cannot screenshot a raw|project has a dev server' $HANDOFF)"

# G3 — workspace isolation before fan-out
chk "G3 workspace isolation before build fan-out" \
  "$(hasflat 'superpowers:using-git-worktrees|create an isolated workspace|cut a new git branch' $HANDOFF)"

# G4 — a phase WRITES the conversion-wins ledger (not just reads it)
chk "G4 conversion-wins capture step defined" \
  "$(hasflat 'append each shipped accountable-wow bet|the only step that populates the ledger' $ALL)"

# G5 — project-scopable taste
chk "G5 project-scoped taste mechanism" \
  "$(hasflat 'project-scoped taste|per-project taste override file' $ALL)"

# G6 — multi-page pipeline
chk "G6 multi-page support in orchestrator" \
  "$(hasflat 'multi-page sites|loop motion \+ handoff per page|the doctrine is per-page' $ORCH)"

# G7 — cost/scope guard before --build fan-out (NOT 'perf budget')
chk "G7 cost/scope guard before --build fan-out" \
  "$(hasflat 'agent-count estimate|confirm scope with the user before dispatching' $HANDOFF)"

# G8 — resume / existing-artifact detection
chk "G8 resume / existing-artifact detection" \
  "$(hasflat 'resume detection|offer to resume from the first incomplete phase' $ORCH)"

echo
echo "GAPS OPEN: $fail / 8"
exit "$fail"

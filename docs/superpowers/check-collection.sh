#!/usr/bin/env bash
# One command to hold the whole collection to its bar. Aggregates:
#   - per-skill structure + description-format validation
#   - the operational-gap regression audit
#   - the CLAUDE.md structural invariant: every skill is registered in BOTH
#     README.md and .claude-plugin/plugin.json (and nothing dangling)
#   - SKILL.md size guidance (<110 lines; warns, does not fail)
# Exit non-zero if any hard check fails. Run after any change to the collection.
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
root=skills
fail=0
say() { printf '%s\n' "$*"; }

skills=$(for d in "$root"/*/; do [ -f "$d/SKILL.md" ] && basename "$d"; done)

say "== per-skill validate (structure + description format) =="
for s in $skills; do bash docs/superpowers/validate-skill.sh "$s" || fail=1; done

say; say "== operational-gap audit =="
bash docs/superpowers/audit-gaps.sh || fail=1

say; say "== registration invariant (README + plugin.json) =="
for s in $skills; do
  grep -q "skills/$s" README.md || { say "FAIL: $s not referenced in README.md"; fail=1; }
  grep -q "\"./skills/$s\"" .claude-plugin/plugin.json || { say "FAIL: $s missing from plugin.json"; fail=1; }
done
# reverse: nothing registered that doesn't exist
for s in $(grep -oE '"\./skills/[a-z0-9-]+"' .claude-plugin/plugin.json | tr -d '"' | sed 's|./skills/||'); do
  [ -f "$root/$s/SKILL.md" ] || { say "FAIL: plugin.json lists $s but skills/$s/SKILL.md missing"; fail=1; }
done
[ "$fail" = 0 ] && say "OK: all $(echo "$skills" | wc -w | tr -d ' ') skills registered in README + plugin.json"

say; say "== SKILL.md size (guidance <110; warn only) =="
for s in $skills; do n=$(wc -l < "$root/$s/SKILL.md"); [ "$n" -le 110 ] && say "ok   $n  $s" || say "WARN $n  $s (>110 — consider moving detail to reference/)"; done

say; say "== broken reference links =="
bad=0
for f in $(find "$root" -name '*.md'); do d=$(dirname "$f")
  for rel in $(grep -oE '\(([A-Za-z0-9._/-]+\.md)\)' "$f" | tr -d '()'); do case "$rel" in /*) continue;; esac
    [ -e "$d/$rel" ] || { say "FAIL: dangling link in $f -> $rel"; bad=1; fail=1; }; done; done
[ "$bad" = 0 ] && say "OK: all intra-skill .md links resolve"

say; [ "$fail" = 0 ] && say "ALL CHECKS PASS" || say "CHECKS FAILED"
exit "$fail"

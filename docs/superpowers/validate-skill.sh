#!/usr/bin/env bash
set -euo pipefail
if [ $# -lt 1 ]; then echo "usage: $(basename "$0") <skill-name>" >&2; exit 2; fi
name="$1"
dir="$HOME/.agents/skills/$name"
f="$dir/SKILL.md"
[ -f "$f" ] || { echo "FAIL: $f missing"; exit 1; }
fm=$(awk '/^---$/{c++; next} c==1' "$f")
echo "$fm" | grep -qE "^name:[[:space:]]*$name$" || { echo "FAIL: name != $name"; exit 1; }
echo "$fm" | grep -qE "^description:[[:space:]]*.+" || { echo "FAIL: description missing"; exit 1; }
[ -L "$HOME/.claude/skills/$name" ] || { echo "FAIL: $name not discoverable (~/.claude/skills/$name missing)"; exit 1; }
[ -f "$HOME/.claude/skills/$name/SKILL.md" ] || { echo "FAIL: $name not discoverable (~/.claude/skills/$name missing)"; exit 1; }
echo "OK: $name valid + discoverable"

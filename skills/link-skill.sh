#!/usr/bin/env bash
set -euo pipefail
if [ $# -lt 1 ]; then echo "usage: $(basename "$0") <skill-name>" >&2; exit 2; fi
name="$1"
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$name"
[ -d "$repo_dir" ] || { echo "FAIL: $repo_dir missing"; exit 1; }
mkdir -p "$HOME/.agents/skills"
ln -sfn "$repo_dir" "$HOME/.agents/skills/$name"
echo "linked ~/.agents/skills/$name → $repo_dir"
mkdir -p "$HOME/.claude/skills"
ln -sfn "../../.agents/skills/$name" "$HOME/.claude/skills/$name"
echo "linked ~/.claude/skills/$name → ../../.agents/skills/$name"

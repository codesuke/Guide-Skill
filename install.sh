#!/usr/bin/env bash
# Install the design-engineer skill collection globally (usable in any project/instance).
# Location-independent: run this from wherever the folder lives — after moving it, or
# after cloning it from GitHub — and it (re)points the global symlinks at THIS copy.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
link="$here/skills/link-skill.sh"
[ -f "$link" ] || { echo "FAIL: $link not found — run from the collection root" >&2; exit 1; }

skills=(design-engineer de-recon de-growth de-direction de-motion de-handoff de-components)
for s in "${skills[@]}"; do
  bash "$link" "$s"
done

echo
echo "Done. ${#skills[@]} skills linked globally from: $here/skills"
echo "Verify with: ls -l ~/.claude/skills/design-engineer"

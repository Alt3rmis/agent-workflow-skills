#!/usr/bin/env bash
set -euo pipefail
repo="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo"
git fetch upstream main
reviewed="$(node -p "require('./docs/v2/provenance.json').upstream_reviewed_through")"
echo "Review changes after $reviewed; no merge, rebase, install or push was performed."
git log --oneline "$reviewed..upstream/main"
git diff --stat "$reviewed" upstream/main -- skills

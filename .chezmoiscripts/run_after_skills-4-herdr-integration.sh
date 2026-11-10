#!/bin/bash
set -euo pipefail

# Herdr's Claude Code hook (~/.claude/hooks/herdr-agent-state.sh). `herdr
# integration status` is local and instant, so this runs on every apply and
# also brings the hook up to date after a Herdr upgrade.
export PATH="/opt/homebrew/bin:$PATH"

if ! command -v herdr >/dev/null; then
  echo "skills: herdr not found; install it (Brewfile), then 'chezmoi apply' again"
  exit 0
fi

# Captured first: `grep -q` exits on the first match and, under pipefail, the
# SIGPIPE to herdr would read as "not current".
status=$(herdr integration status 2>/dev/null || true)
if grep -q '^claude: current' <<<"$status"; then
  exit 0
fi

herdr integration install claude

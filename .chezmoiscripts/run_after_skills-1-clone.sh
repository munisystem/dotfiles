#!/bin/bash
set -euo pipefail

# munisystem/skills is checked out at a fixed path: the ~/.claude/rules symlinks
# and the settings.json hooks point into it. It is the human's working checkout,
# so only clone it when missing; never pull, reset or switch branches here.
#
# run_after_ (every apply) rather than run_once_: without gh auth this skips,
# and the next apply has to try again. The "already there" path is one test.
dir="$HOME/workspace/repos/github.com/munisystem/skills"
if [[ -d "$dir/.git" ]]; then
  exit 0
fi

# A fresh shell may not have the mise shims (gh) on PATH yet.
export PATH="$HOME/.local/share/mise/shims:$HOME/.local/bin:/opt/homebrew/bin:$PATH"

# The repo is private: clone through gh's credentials, never a password prompt.
if ! command -v gh >/dev/null || ! gh auth status >/dev/null 2>&1; then
  echo "skills: not cloned; run 'gh auth login', then 'chezmoi apply' again"
  exit 0
fi

mkdir -p "$(dirname "$dir")"
GIT_TERMINAL_PROMPT=0 gh repo clone munisystem/skills "$dir"

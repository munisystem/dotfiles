#!/bin/bash
set -euo pipefail

# The munisystem-agent-skills marketplace (with auto-update), its plugins, and
# the user-scope Linear MCP server. Each one is checked against Claude Code's
# own files first, so an apply where everything is in place starts no `claude`.
#
# run_after_ (every apply): the marketplace clone needs GitHub access, and when
# it is skipped the next apply has to try again.
export PATH="$HOME/.local/share/mise/shims:$HOME/.local/bin:/opt/homebrew/bin:$PATH"

marketplace=munisystem-agent-skills
plugins=(linear herdr company slack)
settings="$HOME/.claude/settings.json"
known="$HOME/.claude/plugins/known_marketplaces.json"

if ! command -v claude >/dev/null; then
  echo "skills: claude not found; install Claude Code, then 'chezmoi apply' again"
  exit 0
fi

if ! jq -e --arg mp "$marketplace" '.[$mp]' "$known" >/dev/null 2>&1; then
  # The repo is private; fail fast instead of asking for a password or key.
  if ! GIT_TERMINAL_PROMPT=0 GIT_SSH_COMMAND="ssh -o BatchMode=yes" \
    claude plugin marketplace add munisystem/skills; then
    echo "skills: marketplace not added; set up GitHub access (gh auth login / SSH key), then 'chezmoi apply' again"
    exit 0
  fi
fi

[[ -f "$settings" ]] || echo '{}' >"$settings"
if ! jq -e --arg mp "$marketplace" '.extraKnownMarketplaces[$mp].autoUpdate == true' "$settings" >/dev/null 2>&1; then
  updated=$(jq --arg mp "$marketplace" '
    .extraKnownMarketplaces[$mp] //= {source: {source: "github", repo: "munisystem/skills"}}
    | .extraKnownMarketplaces[$mp].autoUpdate = true' "$settings")
  printf '%s\n' "$updated" >"$settings.tmp"
  mv "$settings.tmp" "$settings"
fi

for p in "${plugins[@]}"; do
  id="$p@$marketplace"
  if jq -e --arg id "$id" '.enabledPlugins[$id] == true' "$settings" >/dev/null 2>&1; then
    continue
  fi
  claude plugin install "$id" -y
  claude plugin enable "$id" 2>/dev/null || true
done

# The OAuth login is interactive, so this only adds the server.
if ! jq -e '.mcpServers.linear' "$HOME/.claude.json" >/dev/null 2>&1; then
  claude mcp add --transport http -s user linear https://mcp.linear.app/mcp
  echo "skills: Linear MCP added; run /mcp in Claude Code to log in"
fi

#!/bin/bash
set -euo pipefail

# company-events: the local event server the company plugin waits on, run by
# launchd. Its installer copies itself out of the skills checkout, so this
# needs the checkout (run_after_skills-1-clone) and retries on the next apply
# until it is there.
export PATH="$HOME/.local/share/mise/shims:$HOME/.local/bin:/opt/homebrew/bin:$PATH"

plist="$HOME/Library/LaunchAgents/com.munisystem.company-events.plist"
if [[ -L "$HOME/.local/bin/company-events" && -f "$plist" ]]; then
  exit 0
fi

installer="$HOME/workspace/repos/github.com/munisystem/skills/plugins/company/events/company-events"
if [[ ! -x "$installer" ]]; then
  echo "skills: company-events not installed; the skills checkout is missing (see above)"
  exit 0
fi

# The install only records the op:// reference; the server reads the key later.
"$installer" install --linear-op-ref "op://Personal/Linear API Key/password"
echo "skills: company-events reads the Linear key through the 1Password CLI; sign in to op (1Password app > Settings > Developer > CLI integration)"

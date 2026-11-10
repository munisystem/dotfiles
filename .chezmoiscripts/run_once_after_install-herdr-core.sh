#!/bin/bash
set -euo pipefail

# herdr-core (hc) is not in Homebrew or the mise registry (mise's `herdr` is the
# older multiplexer). Its own installer puts Herdr Core.app under
# ~/.local/share/herdr-core and links ~/.local/bin/herdr-core and hc, the same
# thing the Herdr app runs on first launch. ~/.local/bin is on PATH via .zshenv.
#
# Install only when missing: after that hc keeps itself current (`hc update`,
# Herdr's own updates), and re-running the installer would restart the core.
if [[ -x "$HOME/.local/bin/herdr-core" ]]; then
  exit 0
fi

curl -fsSL https://releases.herdr.dev/core/install.sh | sh

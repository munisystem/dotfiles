setopt prompt_subst
setopt prompt_percent

autoload -Uz colors
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'
precmd () { vcs_info }
PROMPT='%F{242}%~ ${vcs_info_msg_0_}
%F{blue}$ %f'

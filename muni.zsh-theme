#!/usr/bin/env zsh
# #
# # #README
# #
# # This theme provides two customizable header functionalities:
# # a) displaying a pseudo-random message from a database of quotations
# # (https://en.wikipedia.org/wiki/Fortune_%28Unix%29)
# # b) displaying randomly command line tips from The command line fu
# # (http://www.commandlinefu.com) community: in order to make use of this functionality
# # you will need Internet connection.
# # This theme provides as well information for the current user's context, like;
# # branch and status for the current version control system (git and svn currently
# # supported) and time, presented to the user in a non invasive volatile way.
# #
# # #REQUIREMENTS
# # This theme requires wget::
# # -Homebrew-osx- brew install wget
# # -Debian/Ubuntu- apt-get install wget
# # and fortune ::
# # -Homebrew-osx- brew install fortune
# # -Debian/Ubuntu- apt-get install fortune
# #
# # optionally:
# # -Oh-myzsh vcs plug-ins git and svn.
# # -Solarized theme (https://github.com/altercation/solarized/)
# # -OS X: iTerm 2 (http://www.iterm2.com/)
# # -font Source code pro (https://github.com/adobe/source-code-pro)
# #
# # This theme's look and feel is based on the Aaron Toponce's zsh theme, more info:
# # http://pthree.org/2008/11/23/727/
# # enjoy!
########## COLOR ###########
PR_RESET="%{$reset_color%}"
PR_GREEN='%{\e[38;5;118m%}'
PR_RED='%{\e[38;5;197m%}'
PR_GREY='%{\e[38;5;246m%}'
PR_START="${PR_RESET}${PR_GREY}>${PR_RESET}>> "
VCS_SUFIX_COLOR="${PR_RESET}${PR_RED}%{%B%}] ${PR_RESET}"
# ########## COLOR ###########
# ########## SVN ###########
ZSH_THEME_SVN_PROMPT_PREFIX="${PR_RESET}${PR_RED}[svn:"
ZSH_THEME_SVN_PROMPT_SUFFIX=""
ZSH_THEME_SVN_PROMPT_DIRTY="*${VCS_SUFIX_COLOR}"
ZSH_THEME_SVN_PROMPT_CLEAN="=${VCS_SUFIX_COLOR}"
## ########## SVN ###########
## ########## GIT ##########}#
ZSH_THEME_GIT_PROMPT_PREFIX="${PR_RESET}${PR_RED}%{%B%}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" *${VCS_SUFIX_COLOR}"
ZSH_THEME_GIT_PROMPT_CLEAN=" =${VCS_SUFIX_COLOR}"
ZSH_THEME_GIT_PROMPT_ADDED="${PR_RESET}${PR_RED} ✚${PR_RESET}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${PR_RESET}${PR_RED} ✹${PR_RESET}"
ZSH_THEME_GIT_PROMPT_DELETED="${PR_RESET}${PR_RED} ✖${PR_RESET}"
ZSH_THEME_GIT_PROMPT_RENAMED="${PR_RESET}${PR_RED} ➜${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${PR_RESET}${PR_RED} ═${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${PR_RESET}${PR_RED} ✭${PR_RESET}"
# ########## GIT ###########
# Context: user@directory or just directory
prompt_context () {
    local user=`whoami`
    if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        echo -n "${PR_RESET}${PR_RED}%{%B%}$user ${PR_RESET}in ${PR_RESET}${PR_GREEN}%m ${PR_RESET}${PR_RESET}${PR_GREY}%~${PR_RESET}"
    else
        echo -n "${PR_RESET}%~%<<${PR_RESET}"
    fi
}

prompt_start () {
    echo -n "${PR_START}"
}

set_prompt () {
    # required for the prompt
    setopt prompt_subst
    autoload zsh/terminfo
    # ######### PROMPT #########
#    PROMPT='${PROMPT_HEAD}
PROMPT='${PR_RESET}$(prompt_context)${PR_RESET}
$(prompt_start)'
    RPROMPT='${PR_RESET}$(git_prompt_info)$(svn_prompt_info)${PR_YELLOW}${PR_RESET}'
    # ######### PROMPT #########
}

set_prompt

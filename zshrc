# ----- Aliases -----
alias ll='ls -la'

alias ..='cd ..'
alias rm='rm -i'
alias rmd='rm -rf i'
alias vimrc='vim ~/.vimrc'
alias profile='vim ~/.zshrc'
alias reload='source ~/.zshrc'

alias emp='cd ~/workspace/employer'
alias empc='cd ~/workspace/employer/client'
alias emps='cd ~/workspace/employer/server'
# --------------------

# ----- Packages -----
autoload -U add-zsh-hook  # Handling multiple precmd hooks
autoload -Uz vcs_info # Version control info (for branch name in prompt)
autoload -Uz compinit && compinit # Git completion
# --------------------

# ----- Command Prompt -----
get_version_control_info() { vcs_info }
add-zsh-hook precmd get_version_control_info
zstyle ':vcs_info:git:*' formats ' [%b]'
setopt PROMPT_SUBST
PROMPT='%1/%F{yello}${vcs_info_msg_0_}%F{white} → '
# ------------------------

# ---- iTerm Tab Title -----
# Set iTerm Tab Title to Current Working Directory
if [ $ITERM_SESSION_ID ]; then
set_tab_title() {
  echo -ne "\033]0;$(dirs)\007"
}
add-zsh-hook precmd set_tab_title
fi
# --------------------------

# Clean up squash and merge branches
alias sweep='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase    =$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)    ) == "-"* || $(git branch --merged | grep -v "\* master" | grep $branch) ]] && git branch -D $branch; done'

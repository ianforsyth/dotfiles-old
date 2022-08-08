# [libpq] PATH update by relay-bootstrap (DO NOT EDIT):
export PATH=/usr/local/opt/libpq/bin:$PATH
# [libpq] PATH update by relay-bootstrap (DO NOT EDIT):
export PATH=/opt/homebrew/opt/libpq/bin:$PATH
# [go@1.16] PATH update by relay-bootstrap (DO NOT EDIT):
export PATH=/Users/ianforsyth/go/bin:$PATH
# [libpq] PATH update by relay-bootstrap (DO NOT EDIT):
export PATH="/usr/local/opt/libpq/bin:$PATH"
# [libpq] PATH update by relay-bootstrap (DO NOT EDIT):
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
# [go@1.16] PATH update by relay-bootstrap (DO NOT EDIT):
export PATH="/Users/ianforsyth/go/bin:$PATH"

# ----- Aliases -----
alias ll='ls -la'

alias ..='cd ..'
alias rm='rm -i'
alias rmd='rm -rf i'
alias vimrc='vim ~/.vimrc'
alias profile='vim ~/.zshrc'
alias reload='source ~/.zshrc'

alias hoahq='itermocil --here hoahq'
alias vh='cd ~/workspace/saas/; vim .'
alias sc='cd ~/workspace/saas/saas-client'
alias sa='cd ~/workspace/saas/saas-api'
alias deploy='./deploy.sh'
alias pgh='docker stop relay_db_1; brew services start postgresql'
alias pgr='brew services stop postgresql; docker start relay_db_1'

alias relay='itermocil --here relay'
alias vr='cd ~/workspace/relay/; vim .'
alias dev='cd ~/workspace/relay/dev-env'
alias fe='cd ~/workspace/relay/api-v2-frontend'
alias be='cd ~/workspace/relay/api-v2-backend'
alias core='cd ~/workspace/relay/api-v2'
alias rr='relay-run'
alias rs='relay-sync'
alias da='cd ~/workspace/relay/driver-app'
alias db='relay-db-data --source dev --dest local relay_portal'

alias pr='open "https://gitlab.dev/relay/${PWD##*/}/-/merge_requests/new?merge_request%5Bsource_branch%5D=$(git symbolic-ref --short -q HEAD)"'
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
  echo -ne "]0;$(dirs)"
}
add-zsh-hook precmd set_tab_title
fi
# --------------------------

export PATH=$PATH:~/workspace/relay/dev-env/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

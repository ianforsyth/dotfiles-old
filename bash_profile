alias ll='ls -la'

alias ..='cd ..'
alias rm='rm -i'
alias rmd='rm -rf i'
alias vimrc='vim ~/.vimrc'
alias profile='vim ~/.bash_profile'
alias reloadprofile='source ~/.bash_profile'

# Clean up squash and merge branches
alias sweep='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase    =$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)    ) == "-"* || $(git branch --merged | grep -v "\* master" | grep $branch) ]] && git branch -D $branch; done'

# Loop through autocomplete options, don't display list
bind TAB:menu-complete

# Command Prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
export PS1="\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] → "

# iTerm2 tab title
export PROMPT_COMMAND='echo -ne "\033];${PWD#~}\007"; '

# For git-completion package
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

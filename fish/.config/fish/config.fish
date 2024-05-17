if test -f ~/.dircolors
    eval (dircolors -c ~/.dircolors)
end

set -x PATH ~/bin/ ~/.local/bin ~/.yarn/bin $PATH

set -x BROWSER firefox
set -x EDITOR nvim

#CUSTOM GIT ALIASES
alias g="git"
alias ga="git add ."
alias gap="git add -p"
alias gb="git checkout -b"
alias gc="git commit"
alias gchm="git checkout main"
alias gch="git checkout"
alias gf="git fetch"
alias gph="git push"
alias gpho="git push -u origin HEAD"
alias gpl="git pull"
alias gpm="git pull origin main"
alias gs="git status"
    # Deletes all branches locally that have been merged into the current branch
alias gdmb="git branch --merged | grep -v \"\*\" | grep -v main | grep -v dev | xargs -n 1 git branch -d"
#Fuzzy find and checkout branch
    alias gce="git checkout (git branch | fzf)"

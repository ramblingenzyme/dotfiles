if test -f ~/.dircolors
    eval (dircolors -c ~/.dircolors)
end

set -x PATH ~/bin/ ~/.local/bin ~/.yarn/bin $PATH

set -x EDITOR nvim

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'


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
alias gp="git push"
alias gpho="git push -u origin HEAD"
alias gpl="git pull"
alias gpm="git pull origin main"
alias gs="git status"
    # Deletes all branches locally that have been merged into the current branch
alias gdmb="git branch --merged | grep -v \"\*\" | grep -v main | grep -v dev | xargs -n 1 git branch -d"
#Fuzzy find and checkout branch
    alias gce="git checkout (git branch | fzf)"

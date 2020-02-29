eval (dircolors -c ~/.dircolors)
#eval (thefuck --alias | tr '\n' ';')

set -x PATH ~/bin/ ~/.local/bin ~/.yarn/bin $PATH

set -x BROWSER firefox
set -x EDITOR nvim

set -x TTC_BOTS tinycarebot,selfcare_bot,magicrealismbot
set -x TTC_REPOS ~/src
set -x TTC_APIKEYS false

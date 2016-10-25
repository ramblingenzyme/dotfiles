eval (dircolors -c ~/.dircolors)
eval (thefuck --alias | tr '\n' ';')

set -x BROWSER firefox
set -x EDITOR nvim

set -x PATH $PREFIX/bin ~/bin $PATH

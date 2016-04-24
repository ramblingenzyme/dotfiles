set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
eval (dircolors -c ~/.dircolors)
set -x BROWSER firefox
set -x EDITOR nvim

set -x PATH $PREFIX/bin ~/bin $PATH

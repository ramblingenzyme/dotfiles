set -x NVM_DIR $HOME/.nvm
set -x PATH $NVM_DIR/bin/node-v6.5.0-darwin-x64/ $PATH

#eval (dircolors -c ~/.dircolors)
set -x BROWSER firefox
set -x EDITOR nvim
nvm use node

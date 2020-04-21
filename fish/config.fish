# install fisher as plugin manager
# fisher plugins - bobthefish (theme), z (file history),
# done (task timer), fast-nvm-fish
set -g theme_nerd_fonts yes

set -x ANDROID_HOME ~/Library/Android/sdk

alias ..="cd .."

set -x NODE_ENV development
set -x ENVNAME E0
set -x EDITOR "nvim"
set -x CLICOLOR 1
set -x LSCOLORS "ExFxBxDxCxegedabagacad"

# Path setup

set -x PATH $PATH $ANDROID_HOME/tools
set -x PATH $PATH $ANDROID_HOME/platform-tools
set -x PATH $PATH `yarn global bin`

set -x PYTHONPATH $PYTHONPATH:~/anaconda/bin/
set -x PATH $PATH:~/anaconda/bin

# Functions
function config
  cd ~/.config
end

function cfish 
  nvim ~/.config/fish/config.fish
end

function cnvim
  nvim ~/.config/nvim/init.vim
end

function reload
  source ~/.config/fish/config.fish
end

function coverage
  open ./test-results/coverage/lcov-report/index.html
end

function clean
  git reset --soft HEAD~$argv[1]
end

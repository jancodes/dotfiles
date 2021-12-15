# install fisher as plugin manager
# fisher plugins - bobthefish (theme), z (file history),
# done (task timer), fast-nvm-fish
# most plugins found here: https://github.com/jorgebucaran/awsm.fish
# font: Fira Mono Regular Nerd Font Complete
set -g theme_nerd_fonts yes

set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/Cellar/watchman/4.9.0_3/bin" $fish_user_paths

alias ..="cd .."

set -x NODE_ENV development
set -x EDITOR "nvim"
set -x CLICOLOR 1
set -x LSCOLORS "ExFxBxDxCxegedabagacad"

# Functions
function createJSConfig
  cp ~/.config/jsconfig.json . 
end

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

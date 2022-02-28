# install fisher as plugin manager
# fisher plugins - bobthefish (theme), z (file history),
# done (task timer)
# Schniz/fnm for nvm usage in fish (not a plugin)
# most plugins found here: https://github.com/jorgebucaran/awsm.fish
# font: Fira Mono Regular Nerd Font Complete
set -g theme_nerd_fonts yes

alias ..="cd .."

set -x NODE_ENV development
set -x EDITOR "nvim"
set -x CLICOLOR 1
set -x LSCOLORS "ExFxBxDxCxegedabagacad"

# windows only
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
set -gx GPG_TTY (tty)
set DISPLAY (grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0
# windows end

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
  nvim ~/.config/nvim/init.lua
end

function pnvim
  nvim ~/.config/nvim/lua/plugins/init.lua
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


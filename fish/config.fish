set -g theme_nerd_fonts yes

alias ..="cd .."
alias g="git"

set -x NODE_ENV development
set -x EDITOR "nvim"
set -x CLICOLOR 1
set -x LSCOLORS "ExFxBxDxCxegedabagacad"

set -Ux fish_tmux_config $HOME/.config/tmux.conf

if [ (uname) = 'Linux' ]
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  set -gx GPG_TTY (tty)
  set DISPLAY (grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0
end

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

function ctmux
  nvim ~/.config/tmux.conf
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


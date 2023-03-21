set -g theme_nerd_fonts yes

alias ..="cd .."
alias g="git"
alias ta="tmux attach -t" # attach new tmux session
alias tad="tmux attach -d t" # detach named tmux session
alias ts="tmux new-session -s" # create new named tmux session
alias tl="tmux list-sessions" # list sessions
alias tksv="tmux kill-server" # terminate all sessions
alias tkss="tmux kill-session -t" # terminate current named session

set -x NODE_ENV development
set -x EDITOR "nvim"
set -x CLICOLOR 1
set -x LSCOLORS "ExFxBxDxCxegedabagacad"

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
  nvim ~/.config/.tmux.conf
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

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

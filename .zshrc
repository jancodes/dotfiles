# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# this needs to be above p10k prompt
export GPG_TTY=$TTY
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

if command -v uname >/dev/null 2>&1 && [[ "$(uname)" = 'Linux' ]]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  export DISPLAY=$(ip route list default | awk '{print $3}'):0
  # for nvidia-smi
  export PATH=$PATH:/usr/lib/wsl/lib 
  export PATH=/usr/local/cuda-12.8/bin:$PATH 
  export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64:$LD_LIBRARY_PATH

  export LDFLAGS="-Wl,-rpath,$(brew --prefix openssl)/lib"
  export CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl)"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOQUIT=false
export TZ=America/New_York
export TERM="screen-256color"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(tmux zsh-z zsh-autosuggestions history-substring-search zsh-syntax-highlighting)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
source $ZSH/oh-my-zsh.sh

alias ..="cd .."
alias g="git"
alias tsd="tmux new-session -d -s" # create a new session detach from inside a tmux session

export EDITOR="nvim"

# Functions
createJSConfig () {
  cp ~/.config/jsconfig.json . 
}

config () {
  cd ~/.config
}

cfish () {
  nvim ~/.config/fish/config.fish
}

czsh () {
  nvim  ~/.zshrc
}

cnvim () {
  nvim ~/.config/nvim/init.lua
}

pnvim () {
  nvim ~/.config/nvim/lua/plugins/init.lua
}

ctmux () {
  nvim ~/.config/.tmux.conf
}

reload () {
  source ~/.zshrc
}

coverage () {
  open ./test-results/coverage/lcov-report/index.html
}

clean () {
  git reset --soft HEAD~$argv[1]
}

gitdiff() {
  # must be in a git repo
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Not a git repo" >&2
    return 1
  fi

  local target="$1"

  if [ -z "$target" ]; then
    # try origin/HEAD symbolic-ref -> .../main or .../master
    if remote_head=$(git symbolic-ref --quiet refs/remotes/origin/HEAD 2>/dev/null); then
      target=${remote_head##*/}
    else
      # fallback: check which branch exists on origin
      if git ls-remote --exit-code --heads origin main >/dev/null 2>&1; then
        target=main
      elif git ls-remote --exit-code --heads origin master >/dev/null 2>&1; then
        target=master
      else
        echo "Could not determine remote default branch. Pass a branch name." >&2
        return 1
      fi
    fi
  fi

  git difftool -d "$target"
}

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env`"

#virutalenv
export PATH=$HOME/.local/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fnm
export PATH="/home/jan/.fnm:$PATH"
eval "`fnm env`"

#homebrew m1 mac
export PATH="/usr/local/bin:$PATH"    # arm64e homebrew path (m1   )
export PATH="/opt/homebrew/bin:$PATH" # x86_64 homebrew path (intel)

alias mbrew="arch -arm64e /opt/homebrew/bin/brew" # arm64e homebrew path (m1   )
alias ibrew="arch -x86_64 /usr/local/bin/brew"    # x86_64 homebrew path (intel)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

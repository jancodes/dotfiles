#!/usr/bin/env bash

set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"

run_step() {
  local description="$1"
  shift

  printf "\n==> %s\n" "$description"
  "$@"
  local status=$?
  if [ $status -ne 0 ]; then
    printf "[warn] step failed (%s). Continuing...\n" "$status"
  fi
}

install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

setup_brew_shellenv() {
  if [ "$OS" = "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
}

run_step "Install Homebrew" install_homebrew
run_step "Load Homebrew into shell" setup_brew_shellenv

run_step "Install core packages" brew install zsh fnm tmux gcc make gnu-sed ripgrep fd fzf bob

run_step "Install Node LTS with fnm" bash -lc 'eval "$(fnm env --shell bash)" && fnm install --lts && fnm use lts/latest'

run_step "Install Oh My Zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

run_step "Install zsh-autosuggestions" git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
run_step "Install zsh-history-substring-search" git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"
run_step "Install zsh-syntax-highlighting" git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
run_step "Install zsh-z" git clone https://github.com/agkozak/zsh-z "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z"

run_step "Install powerlevel10k" git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

run_step "Symlink .zshrc" bash -lc "rm -rf ~/.zshrc && ln -s '$ROOT_DIR/.zshrc' ~/.zshrc"
run_step "Symlink .gitconfig" bash -lc "rm -rf ~/.gitconfig && ln -s '$ROOT_DIR/.gitconfig' ~/.gitconfig"
run_step "Symlink .tmux.conf" bash -lc "rm -rf ~/.tmux.conf && ln -s '$ROOT_DIR/.tmux.conf' ~/.tmux.conf"

run_step "Install tmux plugin manager" git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

run_step "Install bob" brew install bob
run_step "Use Neovim nightly with bob" bob use nightly

printf "\nDone. Remaining manual steps:\n"
printf "- Set terminal font to a Nerd Font (Caskaydia Cove Nerd Font suggested).\n"
printf "- Apply terminal theme (One Dark for iTerm2 or Windows Terminal alternative).\n"
printf "- Start tmux and run prefix + I to install tmux plugins.\n"
printf "- Open nvim, run :Mason, and install: eslint_d and prettierd (plus any other LSPs you want).\n"
printf "- If clipboard/font setup on WSL still fails, check VcXsrv + firewall notes in README.\n"

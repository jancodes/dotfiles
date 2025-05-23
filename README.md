# dotfiles

<p>
<img src="https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg" alt="Awesome Badge"/> <img src="https://img.shields.io/static/v1?label=%F0%9F%8C%9F&message=If%20Useful&style=style=flat&color=BC4E99" alt="Star Badge"/>
</p>
<p>
<em>
that traveled the world with me
</em>
</p>

> Tools used: Zsh, Tmux, Neovim (Javascript/Typescript), and IntelliJ IDEA .ideavimrc (VIM settings for Java)

> Currently configs does not work with Warp

### Setup (Last updated 01/03/2025)

<em>one day this will be script once I change jobs enough</em>

1.  Install iTerm2
    > https://iterm2.com/downloads.html
2.  Clone repo into as ~/.config folder. If your computer is not new, there might be a config folder already. You can move the files into config or delete your config folder if there is nothing important.
    > `rm -rf ~/.config && git clone https://github.com/jancodes/dotfiles.git ~/.config`
3.  Install Homebrew
    > `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
4.  Install Zsh (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
    > `brew install zsh`
5.  Install Fnm https://github.com/Schniz/fnm
    > `brew install fnm`
6.  Install Node with fnm and use it.

    > `fnm install --lts`

    > `fnm use lts/latest`

7.  Install Oh My Zsh
    > `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
8.  Install Zsh plugins below:

    > `git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions`

    > `git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search`

    > `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

    > `git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z`

9.  Install powerline theme

    > `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

10. Symlink .zshrc

    `rm -rf ~/.zshrc && ln -s ~/.config/.zshrc ~/.zshrc`

11. Set theme and fonts
    in terminal of choice

        > https://www.nerdfonts.com/font-downloads (I'm using Caskaydia Cove Nerd Font Complete Mono Regular)

        > https://github.com/one-dark/iterm-one-dark-theme/blob/main/One%20Dark.itermcolors (One Dark for Iterm2)

        > For WSL2 font issues, restart windows explorer

12. Install Tmux
    > `brew install tmux`
13. Install tpm
    > `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
14. Symlink .tmux.conf
    > `ln -s ~/.config/.tmux.conf ~/.tmux.conf`
15. Install tmux plugins

    > `prefix + I` Mac uses ctrl and Windows/WSL uses alt. Example: Ctrl A is the prefix combo for Mac.

    If you see extra keys being typed while in tmux for mac, check below link to install the missing colors

    > `https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95#the-right-way`

16. Install Neovim nightly with bob

    > https://github.com/MordechaiHadad/bob
    > bob use nightly

17. Install Neovim plugins dep

    > `brew install gcc make gnu-sed ripgrep fd fzf`

18. Mason install lsps

    > `:Mason` in a nvim session (nvim in terminal then use the command) then pick the lsp you want to use

    LSP used in my config: `lua, prettierd, json-lsp, typescript, tailwindcss , eslint_d, cssls`

    Note: lua, json, typescript, tailwindcss, cssls is installed by default with setup with Mason lspconfig

    There is no support for eslint_d and prettier for auto install, so install manually with :Mason

19. Optional:

    > https://github.com/commitizen/cz-cli for writing beatiful commit messages

    > https://github.com/yosukes-dev/one-dark-windows-terminal (wsl only)

    > https://command-not-found.com/xdg-open (wsl only)

    > https://github.com/cpbotha/xdg-open-wsl xdg-open is not in wsl, so you will need an alternative

20. Optional: Install VcXsrv and xclip (WSL only) https://sourceforge.net/projects/vcxsrv/

    Follow Step 2, my config already contain Step 3 setup:

    > https://gist.github.com/necojackarc/02c3c81e1525bb5dc3561f378e921541#2-set-up-vcxsrv-windows-x-server

    > https://installati.one/ubuntu/20.04/xclip/

    > if clipboard still don't work, check if your firewall is blocking VcXsrv.

### Useful notes and resources

#### Tmux

`prefix + [ to go into vim copy mode`

#### Live grep related

> source: https://github.com/nvim-telescope/telescope-live-grep-args.nvim

`"foo" --iglob` search for foo ignoring ignore files

`"foo" --tts` search for foo only in typescript files

`rg --type-list` get the possible types add `| rg "filter string"` to filter down the results

### Mappings

| Mappings | Action                              |
| -------- | ----------------------------------- |
| `<C-k>`  | Quote prompt, e.g. `foo` → `"foo" ` |

### Grep argument examples

(Some examples are ripgrep specific)

| Prompt                   | Args                      | Description                            |
| ------------------------ | ------------------------- | -------------------------------------- |
| `foo bar`                | `foo bar`                 | search for „foo bar“                   |
| `"foo bar" baz`          | `foo bar`, `baz`          | search for „foo bar“ in dir „baz“      |
| `--no-ignore "foo bar`   | `--no-ignore`, `foo bar`  | search for „foo bar“ ignoring ignores  |
| `"foo" ../other-project` | `foo`, `../other-project` | search for „foo“ in `../other-project` |

<br>

#### WSL

WSL Optimization

> https://jade.fyi/blog/development-in-wsl/

MarkdownPreview, use wsl-open

If gcc can't postinstall, make sure you have installed build-essential

#### Mac stuff

`Change key repeat for moving faster in vim with hjkl`

 defaults write -g ApplePressAndHoldEnabled -bool false 

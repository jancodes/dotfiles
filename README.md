# dotfiles

<p>
<img src="https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg" alt="Awesome Badge"/> <img src="https://img.shields.io/static/v1?label=%F0%9F%8C%9F&message=If%20Useful&style=style=flat&color=BC4E99" alt="Star Badge"/>
</p>
<p>
<em>
that traveled the world with me
</em>
</p>

> Tools used: Zsh or Fish shell, Tmux, Neovim (Javascript/Typescript), and IntelliJ IDEA .ideavimrc (VIM settings for Java)

### Setup (Last updated 10/13/2022)

<em>one day this will be script once I change jobs enough</em>

1.  Clone repo into as ~/.config folder
    > `git clone git@github.com:jancodes/dotfiles.git ~/.config`
2.  Install Homebrew
    > `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
3.  Symlink .tmux.conf
    > `ln -s ~/.config/.tmux.conf ~/.tmux.conf`
4.  Install Tmux
    > `brew install tmux`
5.  Install tpm
    > `$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
6.  Install tmux plugins
    > `prefix + I`
7.  Install Zsh (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
    > `brew install zsh`
8.  Make zsh the default shell and symlink to `/usr/bin/zsh`

    > `command -v zsh | sudo tee -a /etc/shells`

    > `chsh -s $(which zsh)`

    > `ln -s zshpath /usr/bin/zsh`

9.  Symlink .zshrc
    > `ln -s ~/.config/.zshrc`
10. Install Fnm https://github.com/Schniz/fnm
11. Install Node and set default version with fnm
12. Install Oh My Zsh
    > `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
13. Install Zsh plugins below and p10k theme

    > https://github.com/jancodes/zsh_to_fish

    > https://github.com/agkozak/zsh-z

    > https://github.com/romkatv/powerlevel10k

14. Run `p10k configure`
15. Set theme and fonts in terminal of choice

    > https://www.nerdfonts.com/font-downloads (casacadia or firacode mono)

    > For WSL2 font issues, restart windows explorer

16. Install Neovim (beta version)

    > `brew install neovim --HEAD`

17. Install Packer.nvim and `:PackerSync` in a nvim session

    > `git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

18. Mason install lsps

    > `:Mason` in a nvim session then pick the lsp you want to use

    LSP used in my config: `lua, prettier, json-lsp, typescript, tailwindcss, omnisharp , eslint_d, cssls`

19. Install VcXsrv (WSL only) https://sourceforge.net/projects/vcxsrv/

    Follow Step 2, my config already did Step 3:

    > https://gist.github.com/necojackarc/02c3c81e1525bb5dc3561f378e921541#2-set-up-vcxsrv-windows-x-server

    Other potential issues:

    > https://installati.one/ubuntu/20.04/xclip/

    > https://superuser.com/questions/1291425/windows-subsystem-linux-make-vim-use-the-clipboard (only applicable if you're not using TMUX)

20. Additional installs:

    > https://github.com/commitizen/cz-cli for writing beatiful commit messages

    > https://github.com/yosukes-dev/one-dark-windows-terminal (wsl only)

    > https://command-not-found.com/xdg-open (wsl only)

    > https://github.com/BurntSushi/ripgrep

    > https://github.com/sharkdp/fd

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

#### Mac stuff

`Change key repeat for moving faster in vim with hjkl`

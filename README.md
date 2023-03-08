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

> Currently configs does not work with Warp

### Setup (Last updated 03/08/2023)

<em>one day this will be script once I change jobs enough</em>

1.  Clone repo into as ~/.config folder. If your computer is not new, there might be a config folder already. You can move the files into config or delete your config folder if there is nothing important.
    > `git clone git@github.com:jancodes/dotfiles.git ~/.config`
2.  Install Homebrew
    > `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
3.  Symlink .tmux.conf TODO move after zsh install
    > `ln -s ~/.config/.tmux.conf ~/.tmux.conf`
4.  Install Tmux
    > `brew install tmux`
5.  Install tpm
    > `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
6.  Install tmux plugins
    > `prefix + I` Mac uses ctrl b and WSL uses alt b.
7.  Install Zsh (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
    > `brew install zsh`
8.  Make zsh the default shell and symlink to `/usr/bin/zsh` Note: this could be a different path check where zsh is installed

    > `command -v zsh | sudo tee -a /etc/shells`

    > `chsh -s $(which zsh)`

    > `ln -s zshpath /usr/bin/zsh ~/.zshrc`

9.  Symlink .zshrc
    > `ln -s ~/.config/.zshrc`
10. Install Fnm https://github.com/Schniz/fnm
    > `brew install fnm`
12. Install Node and set default version with fnm
    > `fnm install nodeversion`
    > `fnm alias default nodeversion`
14. Install Oh My Zsh
    > `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
15. Install Zsh plugins below and p10k theme

    > https://github.com/jancodes/zsh_to_fish

    > https://github.com/agkozak/zsh-z
    > `git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z`

    > https://github.com/romkatv/powerlevel10k
    > `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

14. Run `p10k configure`
15. Set theme and fonts in terminal of choice (TODO move before powerline install)

    > https://www.nerdfonts.com/font-downloads (I'm using Caskaydia Cove Nerd Font Complete Mono Regular)

    > For WSL2 font issues, restart windows explorer

16. Install Neovim (beta version)

    > `brew install neovim --fetch-head`

17. Mason install lsps

    > `:Mason` in a nvim session then pick the lsp you want to use

    LSP used in my config: `lua, prettierd, json-lsp, typescript, tailwindcss , eslint_d, cssls`

    Note: lua, json, typescript, tailwindcss, cssls is installed by default with setup with Mason lspconfig

    There is no support for eslint_d and prettier for auto install, so install manuall with :Mason

18. Install VcXsrv (WSL only) https://sourceforge.net/projects/vcxsrv/

    Follow Step 2, my config already did Step 3:

    > https://gist.github.com/necojackarc/02c3c81e1525bb5dc3561f378e921541#2-set-up-vcxsrv-windows-x-server

    Other potential issues:

    > https://installati.one/ubuntu/20.04/xclip/

    > if clipboard still don't work, check if your firewall is blocking VcXsrv.

19. Additional installs:

    > https://github.com/commitizen/cz-cli for writing beatiful commit messages

    > https://github.com/yosukes-dev/one-dark-windows-terminal (wsl only)

    > https://command-not-found.com/xdg-open (wsl only)
    
    > https://formulae.brew.sh/formula/gnu-sed

    > https://github.com/BurntSushi/ripgrep

    > https://github.com/sharkdp/fd

    > https://formulae.brew.sh/formula/make

    > https://formulae.brew.sh/formula/gcc
    
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

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

### Setup (Last updated 9/28/2022)

<em>one day this will be script once I change jobs enough</em>

1. Clone repo into ~/.config folder
2. Install Homebrew (https://brew.sh/)
3. Install Zsh (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
4. Make zsh the default shell
   > `command -v zsh | sudo tee -a /etc/shells chsh -s $(which zsh)`
5. Install Oh My Zsh
6. Symlink .zshrc
   > `ln -s ~/.config/.zshrc`
7. Install Zsh plugins and p10k (check the starter setup link in resources)
8. Run p10k configure
9. Install Tmux with homebrew
10. Symlink .tmux.conf
11. Install tpm (https://github.com/tmux-plugins/tpm)
12. Install tmux plugins
13. Install Fnm https://github.com/Schniz/fnm
14. Install Node and set default version
15. Set theme in terminal of choice

    > https://github.com/microsoft/cascadia-code

    > https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Regular/complete

16. Install neovim --head with brew
17. Install Packer vim then sync
18. Mason install lsps
    > (prettier, json-lsp, typescript, tailwindcss, omnisharp, lua, eslint_d, cssls)
19. (Linux WSL) Install VcXsrv

    > https://superuser.com/questions/1291425/windows-subsystem-linux-make-vim-use-the-clipboard

    > https://installati.one/ubuntu/20.04/xclip/

20. Additional installs:

    > https://github.com/BurntSushi/ripgrep

    > https://github.com/sharkdp/fd

### Useful notes and resources

#### Zsh related

Helpful starter setup

> https://github.com/jancodes/zsh_to_fish

###### Zsh Plugins

> https://github.com/agkozak/zsh-z

> https://github.com/romkatv/powerlevel10k

#### Tmux

.tmux.conf must be in ~/ directory | do a symlink (ln -s)

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

Packer.nvim

> https://github.com/wbthomason/packer.nvim

Nerd Font

> https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Regular/complete

Fnm (fast nvm replacement)

> https://github.com/Schniz/fnm

Git commit message cli

> https://github.com/commitizen/cz-cli

#### WSL

WSL Optimization

> https://jade.fyi/blog/development-in-wsl/

#### Mac stuff

`Change key repeat for moving faster in vim with hjkl`

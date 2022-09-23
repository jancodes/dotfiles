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

### Setup

1. Clone repo into ~/.config folder
2. Fix missing packages and setup symlinks
3. ???
4. Profit

### Useful notes and resources

#### Zsh related

Helpful starter setup

> https://github.com/jancodes/zsh_to_fish

###### Zsh Plugins

> https://github.com/agkozak/zsh-z

> https://github.com/romkatv/powerlevel10k

#### Fish related

Make fish default shell

> echo /usr/local/bin/fish | sudo tee -a /etc/shells

> chsh -s /usr/local/bin/fish

##### Fish plugins

> https://github.com/jorgebucaran/fisher

> https://github.com/oh-my-fish/theme-bobthefish

> https://github.com/jethrokuan/z

> https://github.com/franciscolourenco/done

> https://github.com/budimanjojo/tmux.fish

##### List of fish plugins

https://github.com/jorgebucaran/awsm.fish

#### Tmux

.tmux.conf must be in ~/ directory | do a symlink (ln -s)

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

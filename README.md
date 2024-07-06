## .Config
A custom config repo containning all my mac alacritty, nvim, tmux etc. configurations.

```bash
git clone --depth 1 https://github.com/DelinQu/dotfiles ~/.dotfiles
```

## Update Logs
- [x] 2024.06.01: add nvchad plugins from nvchad community.
- [x] 2024.6.28: stow synchronize

## 3rd 
The following packages should be install for a full-configuration
* [nvim-0.10](https://neovim.io/doc/user/news-0.10.html) neovim BREAKING CHANGES
* [Alacritty](https://github.com/alacritty/alacritty) A fast, cross-platform, OpenGL terminal emulator and its fork version with cursor animation [alacritty-smooth-cursor](https://github.com/GregTheMadMonk/alacritty-smooth-cursor)
* Awesome Tutorials and configs
    * [typecraft-dev](https://github.com/typecraft-dev/dotfiles)

* [Mosh](https://github.com/mobile-shell/mosh), recommend install by (conda)[https://anaconda.org/conda-forge/mosh]
    * other plugin such as distant.nvim or remote.nvim might be a chioce, but Mosh seam be a better choice.

* tmux with plugin manager:
    * [catppuccin](https://github.com/catppuccin/tmux)
    * [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
    * [typecraft](https://www.youtube.com/watch?v=niuOc02Rvrc)

* python-lsp, recommend install by apt, brew, pip, or conda (pyright is better)
* [stowm dotfiles manager](https://learn.typecraft.dev/tutorial/never-lose-your-configs-again/) and [Using GNU Stow to Manage Symbolic Links for Your Dotfiles](https://systemcrafters.net/managing-your-dotfiles/using-gnu-stow/)
* [npm for pyright](https://github.com/nvm-sh/nvm)
* make ues specific gcc: 
```
make CMAKE_BUILD_TYPE=Release CC=gcc CPP=g++- CXX=g++ LD=g++
CC=gcc nvim
```

## Tutorials
* `*` and `#`: highlight the current word and jump to the next previous one
* `yw` and `byw`: copy/delete word under cursor in Vim
* `[c` and `]c`: jump to the previous and next difference in diff   
* `do` and `dp`: receive and push curent difference to other view 
* `:windo diffthis`: diff current buffer views
* `:diffsplit`: diff current buffer view with `$1` files

-- Get onedark theme for iterm2
-- Escape+ options key in iterm for mac
-- Change OS key repeat
-- WSL2 init setup - https://jade.fyi/blog/development-in-wsl/

require("plugins")
require("lsp")
require("commands")

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.nu = true
vim.o.smartcase = true
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.backspace = "indent,eol,start"
vim.o.clipboard = "unnamedplus"
vim.o.history = 200
vim.o.splitbelow = true
vim.o.splitright = true

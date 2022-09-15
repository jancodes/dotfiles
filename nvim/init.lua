-- Get onedark theme for iterm2
-- Escape+ options key in iterm for mac
-- Change OS key repeat
-- WSL2 init setup - https://jade.fyi/blog/development-in-wsl/
local au = require('au')

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
vim.o.swapfile = false
vim.o.updatetime = 300
vim.o.relativenumber = false
vim.o.timeoutlen = 300
vim.o.termguicolors = true

require("plugins")
require("lsp")
require("commands")

au({ 'BufEnter', 'FocusGained', 'InsertLeave'}, {
  '*.*',
  function()
    vim.o.relativenumber = true
  end
})

au({ 'BufLeave', 'FocusLost', 'InsertEnter'}, {
  '*.*',
  function()
    vim.o.relativenumber = false
  end
})

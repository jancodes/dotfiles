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
-- use for toggleterm
vim.o.hidden = true
-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
-- for tmux
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.mapleader = " "
vim.g.localleader = "\\"
-- save session options
vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')
require("lsp")
require("commands")

-- au({ 'BufEnter', 'FocusGained', 'InsertLeave'}, {
--   '*.*',
--   function()
--     vim.o.relativenumber = true
--   end
-- })

-- au({ 'BufLeave', 'FocusLost', 'InsertEnter'}, {
--   '*.*',
--   function()
--     vim.o.relativenumber = false
--   end
-- })

vim.opt.completeopt = "popup,noinsert,noselect"
-- for render-markdown
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "copilot-chat",
--   callback = function()
--     vim.bo.filetype = "markdown"
--   end,
-- })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'copilot-*',
  callback = function()
    -- Set buffer-local options
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.conceallevel = 0
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    -- Delay execution by 100 milliseconds
    vim.defer_fn(function()
      vim.cmd("CopilotChatCommit silent")
    end, 100)
  end
})

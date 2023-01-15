return {
  "glepnir/lspsaga.nvim",
  config = function()
    local saga = require("lspsaga")

    saga.setup {
      request_timeout = 5000,
      finder = {
        edit = { 'o', '<CR>' },
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = { 'q', '<ESC>' },
      },
      code_action = {
        keys = {
          quit = "q",
          exec = "<CR>",
        }
      },
      definition = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>i',
        tabe = '<C-c>t',
        quit = 'q',
        close = '<Esc>',
      },
      rename = {
        quit = '<C-c>',
        exec = '<CR>',
        in_select = true,
      },
    }

    local opts = { silent = true }
    vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
    vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
    vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
    vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
    vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
  end
  -- bug with main where the screen decreases in height
  -- branch = "version_2.2",
  -- commit = "04e8167740c66193686ea3d14b511c7b160ea755",
}

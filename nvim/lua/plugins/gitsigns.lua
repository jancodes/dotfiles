local u = require("utils")
require('gitsigns').setup({
  signs = {
        add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  }
})

u.nmap("<Leader>gb", ":Gitsigns toggle_current_line_blame<CR>")

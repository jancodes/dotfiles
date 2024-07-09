return {
  'lewis6991/gitsigns.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local m = require("mapx")
    require('gitsigns').setup({
      signs = {
        add    = { text = '+' },
        change = { text = '~' },
      }
    })
    m.nmap("<Leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
  end
}

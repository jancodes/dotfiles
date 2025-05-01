return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'      -- optional, for icons
  },
  ft = { "markdown", "copilot-chat" }, -- Load plugin for these filetypes
  config = function()
    require('render-markdown').setup({
    })
  end,
}

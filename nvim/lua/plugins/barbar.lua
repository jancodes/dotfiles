return {
  'romgrk/barbar.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      exclude_name = { 'profile.log' },
      excluded_buftypes = { 'terminal' },
      icons = {
        buffer_index = false,
        buffer_number = false,
        button = 'X',
        diagnostics = {},
        filetype = { enabled = true },
        inactive = { separator = { left = '▎', right = '' } },
        modified = { button = '●' },
        pinned = { button = '📌' },
        separator = { left = '▎', right = '' },
      },
    }
  end,
  -- icons broken in the barbar refactor
  commit = 'b5b9888'
}

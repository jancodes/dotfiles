return {
  'romgrk/barbar.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      exclude_name = { 'profile.log' },
      excluded_buftypes = { 'terminal' },
      icons = {
        pinned = { button = '📌', filename = true },
      },
    }
  end,
}

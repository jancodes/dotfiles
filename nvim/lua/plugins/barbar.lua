return {
  'romgrk/barbar.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    exclude_name = { 'profile.log' },
    excluded_buftypes = { 'terminal' },
    maximum_length = 15,
  },
  version = '^1.0.0',
}

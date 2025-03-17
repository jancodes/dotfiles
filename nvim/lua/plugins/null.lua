return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null = require('null-ls')
    null.setup({
      sources = {
        -- Formatters
        null.builtins.formatting.prettierd.with {
          extra_filetypes = {
            'handlebars',
          },
          condition = function(utils)
            return utils.root_has_file { '.prettierrc', '.prettierignore' }
          end,
        },
        require("none-ls.formatting.eslint_d"),
        null.builtins.formatting.stylua,

        -- Diagnostics
        require("none-ls.diagnostics.eslint_d"),

        -- Code Actions
        require("none-ls.code_actions.eslint"),
      },
    })
  end,
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
}

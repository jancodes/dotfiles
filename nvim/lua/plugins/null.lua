return {
  'nvimtools/none-ls.nvim',          -- Core plugin
  dependencies = {
    'nvimtools/none-ls-extras.nvim', -- Required for eslint_d
  },
  config = function()
    local null = require('null-ls')

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null.setup({
      debug = true, -- Enable logging
      sources = {
        -- Formatters
        null.builtins.formatting.prettierd.with {
          extra_filetypes = { 'handlebars' },
          condition = function(utils)
            return utils.root_has_file { '.prettierrc', '.prettierignore' }
          end,
        },
        require("none-ls.formatting.eslint_d"), -- Now available via extras, don't use builtins
        null.builtins.formatting.stylua,

        -- Diagnostics
        require("none-ls.diagnostics.eslint_d"), -- Now available via extras, don't use builtins


        -- Code Actions
        require("none-ls.code_actions.eslint_d"), -- Now available via extras, don't use builtins
      },
      on_attach = function(client, bufnr)
        if client:supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                async = false,
                filter = function(c) return c.name == "null-ls" end,
              })
            end,
          })
        end
      end,
    })
  end,
}
